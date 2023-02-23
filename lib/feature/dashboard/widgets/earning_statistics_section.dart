import 'package:get/get.dart';
import 'package:demandium_serviceman/feature/dashboard/widgets/yearly_dashboad_chart.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_drop_down_button.dart';
import 'monthly_dashboard_chart.dart';

class BookingStatisticsSection extends GetView<DashboardController> {
  const BookingStatisticsSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> previousYearsList =[];
    for(int i=4;i>=0;i--){
      previousYearsList.add((DateTime.now().year -i).toString());
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Theme.of(context).backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT+3, vertical: Dimensions.PADDING_SIZE_DEFAULT),
          child: Row(
            children: [
              Image.asset(Images.dashboardEarning,height: 15,width: 15,),
              SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT,),
              Text(
                "booking_statistics".tr,
                style: ubuntuMedium.copyWith(fontSize: Dimensions.fontSizeDefault
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
              right: Dimensions.PADDING_SIZE_SMALL,
              top:Dimensions.PADDING_SIZE_DEFAULT,
              bottom: Dimensions.PADDING_SIZE_SMALL
          ),
          decoration: BoxDecoration(
              color:Theme.of(context).cardColor.withOpacity(Get.isDarkMode?0.5:1),              boxShadow: shadow
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GetBuilder<DashboardController>(
                builder: (dashboardController){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      GestureDetector(
                        onTap: (){
                          dashboardController.changeToYearlyEarnStatisticsChart(EarningType.monthly);
                          Get.find<DashboardController>().getMonthlyBookingsDataForChart(DateConverter
                              .stringYear(DateTime.now()),DateTime.now().month.toString()
                          );
                        },
                        child:  DashboardCustomButton(
                            buttonText: "monthly".tr,
                            isSelectedButton: dashboardController.getChartType == EarningType.monthly ? true: false
                        ),
                      ),
                      SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                      GestureDetector(
                        onTap: (){
                          dashboardController.changeToYearlyEarnStatisticsChart(EarningType.yearly);
                          dashboardController.changeDashboardDropdownValue(DateConverter.stringYear(DateTime.now()),"Year");
                        },
                        child:  DashboardCustomButton(
                            buttonText: "yearly".tr,
                            isSelectedButton: dashboardController.getChartType == EarningType.yearly ? true: false
                        ),
                      ),
                    ],
                  );
                },

              ),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

              GetBuilder<DashboardController>(
                  builder:(dashboardController){
                    return dashboardController.getChartType == EarningType.monthly ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        CustomDropDownButton(type: "Year",itemList: previousYearsList ,title:"year".tr),
                        SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                        CustomDropDownButton(
                            type: "Month",
                            itemList: ['January','February','March','April','May','June','July','August',
                              'September','October','November','December'],
                            title:"month".tr
                        ),
                      ],
                    ) : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomDropDownButton(type: "Year",itemList: previousYearsList ,title:"year".tr),
                      ],
                    );
                  }),

              GetBuilder<DashboardController>(
                builder: (controller){
                return SizedBox(
                  width: context.width,
                  child: controller.getChartType == EarningType.monthly ?
                  MonthlyDashBoardChart():
                  YearlyDashBoardChart(),
                );
              }),
              Text("total_bookings".tr,style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall),),
            ],
          ),
        ),
      ],
    );
  }
}
