import 'package:get/get.dart';
import 'package:demandium_serviceman/feature/dashboard/widgets/app_bar.dart';
import 'package:demandium_serviceman/feature/notifications/controller/notification_controller.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import '../widgets/business_summery_section.dart';
import '../widgets/dashboard_shimmer.dart';
import '../widgets/earning_statistics_section.dart';
import '../widgets/recent_activity_section.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);
  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}
class _DashBoardScreenState extends State<DashBoardScreen> {

  void _loadData(){
    Get.find<DashboardController>().getDashboardData();
    Get.find<DashboardController>().changeToYearlyEarnStatisticsChart(EarningType.monthly);
    Get.find<DashboardController>().getMonthlyBookingsDataForChart(
      DateConverter.stringYear(DateTime.now()),DateTime.now().month.toString(),
      isRefresh: true
    );
    Get.find<DashboardController>().getYearlyBookingsDataForChart(
      DateConverter.stringYear(DateTime.now()),
      isRefresh: true
    );
    Get.find<NotificationController>().getNotifications(1,saveNotificationCount: false);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Theme.of(context).backgroundColor,
     //appBar: CustomAppBar(title: "Dashboard"),
      appBar:  MainAppBar(color: Theme.of(context).primaryColor,),
      body: RefreshIndicator(
        backgroundColor: Theme.of(context).backgroundColor,
        color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.6),
        onRefresh: () async {
          _loadData();
        },
        child: SingleChildScrollView(
          child: GetBuilder<DashboardController>(
            builder: (dashboardController){
              return dashboardController.isLoading ?
              DashboardTopCardShimmer() :

              Column(
                children:[
                  BusinessSummerySection(),
                  BookingStatisticsSection(),
                  RecentActivitySection(),
                  SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT,)
                ],
              );
            },
          ),
        ),
      )
    );
  }
}
