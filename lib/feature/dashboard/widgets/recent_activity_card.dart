import 'package:get/get.dart';
import 'package:demandium_serviceman/components/custom_image.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import 'package:demandium_serviceman/utils/color_resources.dart';
import '../model/dashboard_model.dart';

class RecentActivityItem extends StatelessWidget {
  final Booking activityData;
  RecentActivityItem({
    Key? key, required this.activityData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (splashController) {
      return Container(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                child: CustomImage(
                  height: 70,
                  width: 70,
                  image: Get.find<SplashController>().configModel.content != null && activityData.detail![0].service != null ?
                  "${Get.find<SplashController>().configModel.content!.imageBaseUrl!}"
                  "${AppConstants.SERVICE_IMAGE_PATH}"
                  "${activityData.detail![0].service!.thumbnail??""}" : "",
                ),
              ),
            ),

            SizedBox(width: Dimensions.PADDING_SIZE_SMALL),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("booking".tr + "# ${activityData.readableId}".tr, maxLines: 1,
                    style: ubuntuBold.copyWith(fontWeight: FontWeight.w700, color: Color(0xff758590))),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                  Text(textDirection: TextDirection.ltr,
                    "${DateConverter.dateMonthYearTime(DateConverter.isoUtcStringToLocalDate(activityData.createdAt!))}",
                    style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Color(0xff758590)),
                  )
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.fontSizeSmall,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color:Get.isDarkMode?Colors.grey.withOpacity(0.2):
                ColorResources.buttonBackgroundColorMap[activityData.bookingStatus],
              ),
              child: Text(
                activityData.bookingStatus!.tr,
                style:ubuntuMedium.copyWith(fontWeight: FontWeight.w500, fontSize: Dimensions.fontSizeSmall,
                    color: ColorResources.buttonTextColorMap[activityData.bookingStatus]
                ),
              ),
            ),
          ],
        ),
      );
    });
  }}