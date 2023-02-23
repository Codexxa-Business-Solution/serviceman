import 'package:get/get.dart';
import 'package:demandium_serviceman/feature/booking_details/controller/booking_details_controller.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:demandium_serviceman/core/core_export.dart';

class CreateChannelDialog extends StatefulWidget {
  final String? referenceId;
  final String? customerID;
  final String? serviceManId;
  final String? providerId;

  CreateChannelDialog({this.referenceId, this.customerID, this.serviceManId, this.providerId,});
  @override
  State<CreateChannelDialog> createState() => _ProductBottomSheetState();
}

class _ProductBottomSheetState extends State<CreateChannelDialog> {
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
          borderRadius: BorderRadius.vertical(top: Radius.circular(Dimensions.RADIUS_EXTRA_LARGE)),
        ),
        child: GetBuilder<ConversationController>(
            builder: (conversationController) {
              return SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () => Get.back(),
                          child: Padding(
                            padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT),
                            child: Icon(Icons.close),
                          )),
                      Padding(
                        padding: EdgeInsets.only(right: Dimensions.PADDING_SIZE_DEFAULT, top: ResponsiveHelper.isDesktop(context) ? 0 : Dimensions.PADDING_SIZE_DEFAULT,
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("create_channel".tr,style: ubuntuMedium,),
                              SizedBox(height: Dimensions.PADDING_SIZE_LARGE,),
                              ///create channel with provider & customer
                              GetBuilder<BookingDetailsController>(builder: (bookingDetailsController){
                                return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed:(){
                                          String name = "${Get.find<BookingDetailsController>().bookingDetailsContent!.provider!.companyName!}";
                                          String phone = "${Get.find<BookingDetailsController>().bookingDetailsContent!.provider!.companyPhone!}";
                                          String image = "${Get.find<SplashController>().configModel.content!.imageBaseUrl}"
                                              "${AppConstants.PROVIDER_PROFILE_IMAGE_PATH}"
                                              "${Get.find<BookingDetailsController>().bookingDetailsContent!.provider!.logo!}";
                                          conversationController.setChatNameImg(name,image);
                                          Get.find<ConversationController>().setUserImageType('provider');
                                          Get.find<ConversationController>().createChannel(widget.providerId!, widget.referenceId!,name: name,image: image,userType:phone);
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Theme.of(context).disabledColor.withOpacity(0.3), minimumSize:  Size(Dimensions.PADDING_SIZE_LARGE, 40),
                                          padding:  EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL,horizontal: Dimensions.PADDING_SIZE_LARGE ),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE)),
                                        ),
                                        child: Text(
                                          'provider'.tr, textAlign: TextAlign.center,
                                          style: ubuntuBold.copyWith(color: Theme.of(context).textTheme.bodyText1!.color),
                                        ),
                                      ),
                                      const SizedBox(width: Dimensions.PADDING_SIZE_LARGE),

                                      bookingDetailsController.bookingDetailsContent!.customer!=null?
                                      TextButton(
                                        onPressed:(){
                                          String name = "${Get.find<BookingDetailsController>().bookingDetailsContent!.customer!.firstName!}"
                                              " ${Get.find<BookingDetailsController>().bookingDetailsContent!.customer!.lastName!}";
                                          String phone = "${Get.find<BookingDetailsController>().bookingDetailsContent!.customer!.phone!}";

                                          String image = "${Get.find<SplashController>().configModel.content!.imageBaseUrl}"
                                              "${AppConstants.CUSTOMER_PROFILE_IMAGE_PATH}"
                                              "${Get.find<BookingDetailsController>().bookingDetailsContent!.customer!.profileImage!}";
                                          conversationController.setChatNameImg(name,image);
                                          Get.find<ConversationController>().setUserImageType('customer');
                                          Get.find<ConversationController>().createChannel(widget.customerID!, widget.referenceId!,name: name,image: image,userType:phone);
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Theme.of(context).disabledColor.withOpacity(0.3), minimumSize:  Size(Dimensions.PADDING_SIZE_LARGE, 40),
                                          padding:  EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL,horizontal: Dimensions.PADDING_SIZE_LARGE ),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE)),
                                        ),
                                        child: Text(
                                          'customer'.tr, textAlign: TextAlign.center,
                                          style: ubuntuBold.copyWith(color: Theme.of(context).textTheme.bodyText1!.color),
                                        ),
                                      ):SizedBox(),

                                    ]);
                              }),
                              SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
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

