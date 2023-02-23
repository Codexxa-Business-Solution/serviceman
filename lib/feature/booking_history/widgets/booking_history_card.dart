import 'package:get/get.dart';
import 'package:demandium_serviceman/core/helper/price_converter.dart';
import 'package:demandium_serviceman/utils/color_resources.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import '../../booking_list/model/booking_model.dart';


class BookingListItem extends StatelessWidget {
  final BookingItemModel bookingItemModel;
  BookingListItem({Key? key, required this.bookingItemModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Get.toNamed(RouteHelper.getBookingDetailsRoute(bookingItemModel.id!,"","others")),
      child: Padding(
        padding:  EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withOpacity(Get.isDarkMode?0.5:1),
            boxShadow: shadow
          ),
          margin: EdgeInsets.only(bottom: 3),
          padding:  EdgeInsets.symmetric(
            vertical: Dimensions.PADDING_SIZE_SMALL,
            horizontal: Dimensions.PADDING_SIZE_DEFAULT,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("booking".tr, style: ubuntuMedium,),
                        Text(" # ${bookingItemModel.readableId}", overflow: TextOverflow.ellipsis, style: ubuntuBold,),
                      ],
                    ),
                     SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL,),

                     BookingDate('booking_date'.tr+" : ",bookingItemModel.createdAt!),
                     SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL,),

                    Row(
                      children: [
                        Text("service_scheduled_date".tr+" : ",
                          style: ubuntuRegularLow.copyWith(
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                        Text(
                          textDirection: TextDirection.ltr,
                          "${DateConverter.dateMonthYearTime(DateTime.tryParse(bookingItemModel.serviceSchedule!,),)}",
                          style: ubuntuRegularLow.copyWith(color: Theme.of(context).secondaryHeaderColor,),
                        ),
                      ],
                    ),
                     SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                    Row(
                      children: [
                        Text(
                          "total_amount".tr+": ",
                          style: ubuntuMediumMid.copyWith(color: Theme.of(context).primaryColor),
                        ),

                        Text(
                          "${PriceConverter.convertPrice(bookingItemModel.totalBookingAmount!.toDouble())}",
                          style: ubuntuMediumMid.copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_DEFAULT,
                      vertical: 5
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Get.isDarkMode ?
                      Colors.grey.withOpacity(0.2) :
                      ColorResources.buttonBackgroundColorMap[bookingItemModel.bookingStatus],
                    ),
                    child: Center(
                      child: Text(
                        bookingItemModel.bookingStatus!.tr,
                        style: ubuntuRegular.copyWith(
                          fontSize: Dimensions.fontSizeSmall,
                          color: ColorResources.buttonTextColorMap[bookingItemModel.bookingStatus],
                        ),
                      ),
                    ),
                  ),
                  Gaps.verticalGapOf(Dimensions.PADDING_SIZE_EXTRA_LARGE),

                  Text("view_details".tr,
                    style: ubuntuRegularLow.copyWith(
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget BookingDate(String dateType,String date){
  return Builder(
    builder: (context) {
      return Row(
        children: [
          Text(dateType, style: ubuntuRegularLow.copyWith(color: Theme.of(context).secondaryHeaderColor)),
          Text(
            textDirection: TextDirection.ltr,
            "${DateConverter.dateMonthYearTime(DateConverter.isoUtcStringToLocalDate(date))}",
            style: ubuntuRegularLow.copyWith(color: Theme.of(context).secondaryHeaderColor)
          ),
        ],
      );
    }
  );
}






