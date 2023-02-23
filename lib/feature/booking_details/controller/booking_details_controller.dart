import 'package:demandium_serviceman/feature/booking_details/model/invoice.dart';
import 'package:get/get.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import '../model/booking_details_model.dart';
import '../repository/booking_details_repo.dart';

enum BookingDetailsTabControllerState {bookingDetails,status}

class BookingDetailsController extends GetxController with GetSingleTickerProviderStateMixin{
  final BookingDetailsRepo? bookingDetailsRepo;
  BookingDetailsController({required this.bookingDetailsRepo});
  String ? _bookingCancelStatus;

  TabController? controller;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isUpdate = false;
  bool get isUpdate => _isUpdate;

  double _invoiceGrandTotal= 0.0;
  double get invoiceGrandTotal => _invoiceGrandTotal;

  @override
  void onClose() {
    controller!.dispose();
    super.onClose();
  }

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'booking_details'.tr),
    Tab(text: 'status'.tr),
  ];

  final List<String> items = [
    "ongoing",
    "completed",
  ];

  var bookingPageCurrentState = BookingDetailsTabControllerState.bookingDetails;

  @override
  void onInit(){
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
    _bookingCancelStatus = Get.find<SplashController>().configModel.content!.serviceManCanCancelBooking!.toString();
    addCancelable();


  }



  void updateServicePageCurrentState(BookingDetailsTabControllerState bookingDetaisTabControllerState){
    bookingPageCurrentState = bookingDetaisTabControllerState;
    update();
  }

  var _selectedValue= "";
  String get selectedValue => _selectedValue;
  BookingDetailsContent? _bookingDetailsContent;
  BookingDetailsContent? get bookingDetailsContent => _bookingDetailsContent;

  void setSelectedValue(String value){
    _selectedValue=value;
    update();
  }

  addCancelable(){
    if(_bookingCancelStatus!='0'){
      items.add("canceled");
    }
  }


  List<InvoiceItem> _invoiceItems =[];
  List<InvoiceItem> get invoiceItems => _invoiceItems;

  List<double> _unitTotalCost =[];
  List<double> get unitTotalCost => _unitTotalCost;

  double _allTotalCost = 0;
  double _totalDiscount =0;

  double _totalDiscountWithCoupon =0;
  double get totalDiscountWithCoupon => _totalDiscountWithCoupon;

  double get allTotalCost => _allTotalCost;
  double get totalDiscount => _totalDiscount;


  Future<void> getBookingDetailsData(String bookingID,{bool loadingFalse=false}) async {
    _invoiceGrandTotal=0;
    _invoiceItems=[];

    _isLoading = true;
    if(loadingFalse == true){
      _invoiceItems=[];
      _isLoading = false;
    }
    update();

    Response response = await bookingDetailsRepo!.getBookingDetailsData(bookingID);
    if(response.statusCode==200){
      _invoiceItems=[];
      _bookingDetailsContent = BookingDetailsContent.fromJson(response.body['content']);
      _unitTotalCost=[];
      _bookingDetailsContent?.detail!.forEach((element){
        _unitTotalCost.add( double.parse(element.serviceCost!)*element.quantity!);
      });
      if(_bookingDetailsContent!=null){
        _selectedValue = _bookingDetailsContent?.bookingStatus??"";
      }
      _allTotalCost=0;
      _unitTotalCost.forEach((element) {
        _allTotalCost=_allTotalCost+element;
      });

      double? discount= double.tryParse(_bookingDetailsContent!.totalDiscountAmount);
      double? campaignDiscount= double.tryParse(_bookingDetailsContent!.totalCampaignDiscountAmount!);
      _totalDiscount = (discount!+campaignDiscount!);
      _totalDiscountWithCoupon = discount+campaignDiscount+(double.tryParse(_bookingDetailsContent!.totalCouponDiscountAmount!)!);
      _bookingDetailsContent?.detail!.forEach((element){
        _invoiceItems.add(
            InvoiceItem(
              discountAmount:(
                  double.tryParse(element.discountAmount!)! +
                  (double.tryParse(element.campaignDiscountAmount!)!)
                  +(double.tryParse(element.overallCouponDiscountAmount!)!)),
              tax: double. tryParse(element.taxAmount!)!,
              unitAllTotal: double.tryParse(element.totalCost!)!,
              quantity: element.quantity!,
                serviceName: "${element.serviceName?? 'service_deleted'.tr } \n${element.variantKey?.replaceAll('-', ' ').capitalizeFirst ?? 'variantKey_not_available'.tr}",
                unitPrice: double.tryParse(element.serviceCost!),
            )
        );
      });
    }
    else{

    }
    _isLoading = false;
    update();
  }


  void changeBookingStatus(String bookingId, String bookingStatus) async{
    _isUpdate = true;
    update();
    if(bookingStatus=='ongoing' && _selectedValue =='canceled'){
      showCustomSnackBar('service_ongoing_can_not_cancel_booking'.tr);
    }else{
      Response response = await bookingDetailsRepo!.changeBookingStatus(bookingId,_selectedValue);
      if(response.statusCode==200){
        showCustomSnackBar('status_update_to'.tr+' '+_selectedValue.tr,isError: false);
        getBookingDetailsData(bookingId,loadingFalse: true);
      }
      else{
        showCustomSnackBar(response.statusText);
      }
    }
    _isUpdate = false;
    update();
  }


  void changePaymentStatus(String bookingId,String paymentStatus) async {
    Response response = await bookingDetailsRepo!.changePaymentStatus(bookingId,paymentStatus);
    if(response.statusCode == 200){
      showCustomSnackBar('successfully_paid'.tr,isError: false);
    } else {
      showCustomSnackBar(response.body['message']);
    }
    update();
  }

}