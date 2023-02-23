import 'package:get/get.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import 'package:demandium_serviceman/feature/booking_details/controller/booking_details_controller.dart';
import 'package:demandium_serviceman/feature/booking_details/widget/booking_details_widget.dart';
import 'package:demandium_serviceman/feature/booking_details/widget/booking_status.dart';
import 'package:demandium_serviceman/feature/conversation/widgets/create_channel_dialog.dart';

class BookingDetails extends StatefulWidget{
  final String bookingId;
  final String bookingStatus;
  final String? fromPage;
  const BookingDetails( {
    Key? key,required this.bookingId,
    required this.bookingStatus,
    this.fromPage}) : super(key: key);

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}
class _BookingDetailsState extends State<BookingDetails> {
  @override
  void initState() {
    super.initState();
    Get.find<BookingDetailsController>().controller?.addListener(() {
      if(Get.find<BookingDetailsController>().controller!.index==0){
        Get.find<BookingDetailsController>().updateServicePageCurrentState(
            BookingDetailsTabControllerState.bookingDetails
        );
      }else{
        Get.find<BookingDetailsController>().updateServicePageCurrentState(
            BookingDetailsTabControllerState.status
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingDetailsController>(
      initState: (_){
          Get.find<BookingDetailsController>().getBookingDetailsData(widget.bookingId);
        },
        builder: (bookingDetailsController){
          return WillPopScope(
            onWillPop: () async {
              if(widget.fromPage == 'fromNotification') {
                Get.offAllNamed(RouteHelper.getInitialRoute());
                return false;

              }else {
                return true;
              }
            },
            child: Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              appBar:AppBar(
                elevation: 5,
                titleSpacing: 0,
                backgroundColor: Theme.of(context).backgroundColor,
                shadowColor: Get.isDarkMode?Theme.of(context).primaryColor.withOpacity(0.5):Theme.of(context).primaryColor.withOpacity(0.1),
                title: Text('booking_details'.tr,
                  style: ubuntuBold.copyWith(fontSize: Dimensions.fontSizeLarge,color: Theme.of(context).primaryColorLight),
                ),
                leading: IconButton(onPressed: (){
                  if(widget.fromPage == 'fromNotification'){
                    Get.offAllNamed(RouteHelper.getInitialRoute());
                  }else{
                    Get.back();
                  }
                },
                  icon: Icon(Icons.arrow_back_ios,color:Theme.of(context).primaryColorLight,size: 20,),
                ),
              ),
              body:DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      height: 45,
                      width: Get.width,
                      color: Theme.of(context).backgroundColor,
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.0),
                          border:  Border(
                            bottom: BorderSide(
                                color: Theme.of(context).primaryColor.withOpacity(0.7), width: 0.5),
                          ),
                        ),
                        child: Center(
                          child: TabBar(
                            isScrollable: false,
                            unselectedLabelColor:Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5),
                            indicatorColor: Theme.of(context).primaryColor,
                            controller: bookingDetailsController.controller!,
                            labelColor: Theme.of(context).primaryColorLight,
                            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                            onTap: (int? index) {
                              switch (index) {
                                case 0:
                                  bookingDetailsController.updateServicePageCurrentState(
                                      BookingDetailsTabControllerState.bookingDetails
                                  );
                                  break;
                                case 1:
                                  bookingDetailsController.updateServicePageCurrentState(
                                      BookingDetailsTabControllerState.status
                                  );
                                break;
                              }
                            },
                            tabs: bookingDetailsController.myTabs,
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: TabBarView(
                        controller: bookingDetailsController.controller,
                        children: [
                          BookingDetailsWidget(),
                          BookingStatus(),
                        ],
                      )
                    ),
                  ],
                ),
              ),
              floatingActionButton:bookingDetailsController.bookingDetailsContent!=null &&
                  bookingDetailsController.bookingPageCurrentState == BookingDetailsTabControllerState.bookingDetails?
              Container(
                padding: EdgeInsets.only(bottom: 50),
                child: FloatingActionButton(
                  elevation: 0.0,
                  child: new Icon(Icons.message_rounded,color: light.cardColor,),
                  backgroundColor: Theme.of(context).primaryColor,
                  onPressed: ()=> Get.bottomSheet( CreateChannelDialog(
                    customerID: Get.find<BookingDetailsController>().bookingDetailsContent!.customerId,
                    providerId: Get.find<BookingDetailsController>().bookingDetailsContent!.provider!.userId!,
                    serviceManId: Get.find<BookingDetailsController>().bookingDetailsContent!.serviceman!.userId!,
                    referenceId: Get.find<BookingDetailsController>().bookingDetailsContent!.id!,),
                  ),
                ),
              ): null
            ),
          );
      },
    );
  }
}

