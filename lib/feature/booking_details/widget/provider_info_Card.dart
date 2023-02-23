import 'package:get/get.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import 'package:demandium_serviceman/feature/booking_details/controller/booking_details_controller.dart';
import 'package:demandium_serviceman/feature/booking_details/widget/bottom_card.dart';

class BookingDetailsProviderInfo extends StatelessWidget {
  const BookingDetailsProviderInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingDetailsController>(builder: (bookingDetailsController){
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal:Dimensions.PADDING_SIZE_DEFAULT),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("provider_info".tr,style:ubuntuMedium.copyWith(
                    fontSize: Dimensions.fontSizeDefault,color: Theme.of(context).primaryColorLight) ,
                ),
              ],
            ),
          ),
          SizedBox(height:Dimensions.PADDING_SIZE_DEFAULT),
          BottomCard(
            name: '${bookingDetailsController.bookingDetailsContent!.provider!.companyName!}',
            phone: '${bookingDetailsController.bookingDetailsContent!.provider!.companyPhone!}',
            image: "${Get.find<SplashController>().configModel.content!.imageBaseUrl!}"
                "${AppConstants.PROVIDER_PROFILE_IMAGE_PATH}"
                "${bookingDetailsController.bookingDetailsContent!.provider!.logo!}",
          ),
        ],
      );
    });
  }
}
