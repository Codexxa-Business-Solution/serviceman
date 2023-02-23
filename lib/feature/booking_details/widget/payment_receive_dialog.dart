import 'package:get/get.dart';
import 'package:demandium_serviceman/core/helper/price_converter.dart';
import 'package:demandium_serviceman/feature/booking_details/controller/booking_details_controller.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:demandium_serviceman/core/core_export.dart';

class PaymentReceiveDialog extends StatefulWidget {

  final String bookingId;
  final String orderAmount;
  PaymentReceiveDialog(this.bookingId, this.orderAmount);

  @override
  State<PaymentReceiveDialog> createState() => _PaymentReceiveDialogState();
}

class _PaymentReceiveDialogState extends State<PaymentReceiveDialog>{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PointerInterceptor(
      child: Container(
        width: Dimensions.WEB_MAX_WIDTH,
        padding: EdgeInsets.only(
            left: Dimensions.PADDING_SIZE_DEFAULT,
            bottom: Dimensions.PADDING_SIZE_DEFAULT),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: GetBuilder<BookingDetailsController>(
            builder: (bookingDetailsController) {
              return SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () => Get.back(),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: Dimensions.PADDING_SIZE_DEFAULT,
                                right: Dimensions.PADDING_SIZE_DEFAULT),
                            child: Icon(Icons.close),
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                          right: Dimensions.PADDING_SIZE_DEFAULT,
                          top: ResponsiveHelper.isDesktop(context)
                              ? 0
                              : Dimensions.PADDING_SIZE_DEFAULT,
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 100,
                                child: Image.asset(Images.money),
                              ),
                              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                              Text("collected_money_from_customer".tr,style: ubuntuBold,),
                              SizedBox(height: Dimensions.PADDING_SIZE_LARGE,),

                              Row( crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Text('${"order_amount".tr} : ',style: ubuntuBold,),
                                Text("${PriceConverter.convertPrice(double.parse(widget.orderAmount))}",style: ubuntuBold,),
                              ],),
                              SizedBox(height: Dimensions.PADDING_SIZE_LARGE,),


                              CustomButton(
                                onPressed:(){
                                  bookingDetailsController.changePaymentStatus(widget.bookingId,"paid");
                                  bookingDetailsController.changeBookingStatus(widget.bookingId, "completed");
                                  Get.back();
                                },
                                btnTxt: 'ok'.tr,
                              ),
                              SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                            ]),
                      ),
                    ]),
              );
            }),
      ),
    );
  }
}
