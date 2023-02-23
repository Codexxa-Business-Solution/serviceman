import 'package:get/get.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import 'package:demandium_serviceman/feature/booking_details/controller/booking_details_controller.dart';
import 'package:demandium_serviceman/feature/booking_details/widget/bottom_card.dart';

class BookingDetailsCustomerInfo extends StatelessWidget {
  const BookingDetailsCustomerInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<BookingDetailsController>(
      builder: (bookingDetailsController) {
        final bookingDetails =bookingDetailsController.bookingDetailsContent;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
            child: Text("customer_info".tr,
              style: ubuntuMedium.copyWith(fontSize: Dimensions.fontSizeDefault, color: Theme.of(context).primaryColorLight),
            ),
          ),
          SizedBox(height:Dimensions.PADDING_SIZE_DEFAULT),
          bookingDetails!.customer!=null?
          BottomCard(
            name: bookingDetails.customer!.firstName.toString() + " " +
                bookingDetailsController.bookingDetailsContent!.customer!.lastName.toString(),
            phone: bookingDetails.customer!.phone!=null?
            bookingDetails.customer!.phone!:bookingDetails.customer!.email!,
            image: "${Get.find<SplashController>().configModel.content!.imageBaseUrl}"
                "${AppConstants.CUSTOMER_PROFILE_IMAGE_PATH}"
                "${bookingDetails.customer!.profileImage!}",
            Address: bookingDetails.serviceAddress !=null?
            bookingDetails.serviceAddress!.address:'address_not_found'.tr,

          ):Container(
            margin: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_LARGE,
              vertical: Dimensions.PADDING_SIZE_LARGE,
            ),
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).cardColor.withOpacity(Get.isDarkMode?0.5:1),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 1,
                  color: Colors.black.withOpacity(0.1),
                )
              ],
            ),
            child: Center(
              child: Column(
                children: [
                  Text('missing_customer_information'.tr,style: ubuntuRegular.copyWith(
                      color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.8)
                  ),),
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
                  Text('this_customer_may_deleted'.tr,style: ubuntuRegular.copyWith(
                    color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.6),
                    fontSize: Dimensions.fontSizeSmall,
                  )
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
