import 'package:get/get.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import 'package:demandium_serviceman/feature/booking_details/controller/booking_details_controller.dart';
import 'package:demandium_serviceman/feature/booking_details/widget/payment_receive_dialog.dart';

class StatusChangeDropdownButton extends StatelessWidget {
  const StatusChangeDropdownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingDetailsController>(builder: (bookingDetailsController){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE,vertical: Dimensions.PADDING_SIZE_SMALL),
        height: 70,
        child: Row(
            children: [
              Expanded(
                child: Container(padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE), height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: Get.isDarkMode? light.cardColor.withOpacity(0.3):
                      Theme.of(context).primaryColor.withOpacity(0.30)
                      )
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: bookingDetailsController.selectedValue == ''?
                      Text(bookingDetailsController.bookingDetailsContent!.bookingStatus!.tr) :
                      Text(bookingDetailsController.selectedValue.tr),
                      dropdownColor: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(5),
                      elevation: 2,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: bookingDetailsController.items.map((String items) {
                        return DropdownMenuItem(value: items, child: Row(children: [Text(items.tr)]));
                      }).toList(),

                      onChanged:(String? newValue) {

                        bookingDetailsController.setSelectedValue(newValue!);
                        if(newValue.toLowerCase() == "completed" && bookingDetailsController.bookingDetailsContent!.paymentMethod == "cash_after_service" &&  bookingDetailsController.bookingDetailsContent!.isPaid !=1){
                          Get.bottomSheet(PaymentReceiveDialog(bookingDetailsController.bookingDetailsContent!.id!,bookingDetailsController.bookingDetailsContent!.totalBookingAmount.toString()));
                        }
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(width:Dimensions.PADDING_SIZE_DEFAULT),
              bookingDetailsController.isUpdate ?
              SizedBox(height: 45,width: 112,
                  child:Center(child: CircularProgressIndicator(color: Theme.of(context).hoverColor))
              ) : CustomButton(
                height: 45,width: 112,
                btnTxt:"change".tr,
                onPressed: bookingDetailsController.bookingDetailsContent!.bookingStatus == "canceled"
                    || bookingDetailsController.bookingDetailsContent!.bookingStatus == "completed"
                    || bookingDetailsController.bookingDetailsContent!.bookingStatus == bookingDetailsController.selectedValue? null
                    : (){
                  if(bookingDetailsController.selectedValue=="completed"
                      && bookingDetailsController.bookingDetailsContent!.paymentMethod == "cash_after_service"
                      &&  bookingDetailsController.bookingDetailsContent!.isPaid !=1){
                    Get.bottomSheet(PaymentReceiveDialog(
                      bookingDetailsController.bookingDetailsContent!.id!,
                      bookingDetailsController.bookingDetailsContent!.totalBookingAmount.toString(),),
                    );
                  }else{
                    bookingDetailsController.changeBookingStatus(
                      bookingDetailsController.bookingDetailsContent!.id.toString(),
                      bookingDetailsController.bookingDetailsContent!.bookingStatus!,
                    );
                  }
                  },
              )
            ],
        ),
      );
    });
  }
}
