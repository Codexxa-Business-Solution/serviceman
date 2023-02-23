import 'package:get/get.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import 'dashboard_custom_card.dart';

class BusinessSummerySection extends StatelessWidget {
  const  BusinessSummerySection({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<DashboardController>(builder: (controller){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_DEFAULT,
              vertical: Dimensions.PADDING_SIZE_DEFAULT,
            ),
            child: Text(
              "bookings_summary".tr,
              style: ubuntuMedium.copyWith(
                fontSize: Dimensions.fontSizeDefault,
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
            ),
          ),
          Container(
            padding:  EdgeInsets.symmetric(
              horizontal:Dimensions.PADDING_SIZE_DEFAULT,
              vertical: Dimensions.PADDING_SIZE_SMALL,
            ),
            width: MediaQuery.of(context).size.width,
            height: 260,
            decoration: BoxDecoration(
              color:Theme.of(context).cardColor.withOpacity(Get.isDarkMode?0.5:1),
              boxShadow: shadow
            ),

            child: Column(
              children: [
                Row(
                  children:   [
                    BusinessSummaryItem(
                        height: 80,
                        curveColor: Color(0xff7180ff),
                        cardColor: Color(0xff6a79ff),
                        amount: controller.Cards.pendingBookings ?? 0,
                        title: "total_assigned_booking".tr,
                        iconData: Images.earning
                    ),
                    SizedBox(width: Dimensions.PADDING_SIZE_SMALL,),
                    BusinessSummaryItem(
                      height: 80,
                      cardColor: Color(0xff3376E0),
                      curveColor: Color(0xff367ae3),
                      amount: controller.Cards.ongoingBookings ?? 0,
                      title: "ongoing_booking".tr,
                      iconData: Images.service,
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                BusinessSummaryItem(
                  cardColor:Theme.of(context).colorScheme.surfaceTint,
                  amount: controller.Cards.completedBookings ?? 0,
                  title: "total_completed_booking".tr,
                  iconData: Images.serviceMan,
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                BusinessSummaryItem(
                  cardColor: Theme.of(context).colorScheme.tertiary,
                  amount: controller.Cards.canceledBookings ?? 0,
                  title: "total_canceled_booking".tr,
                  iconData: Images.booking,
                ),
              ],
            ),
          ),
        ],
      );
      }
    );
  }
}
