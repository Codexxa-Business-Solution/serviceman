import 'package:get/get.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import 'package:demandium_serviceman/feature/booking_history/controller/history_screen_controller.dart';
import 'package:demandium_serviceman/feature/booking_history/widgets/booking_history_shimmer.dart';
import 'package:demandium_serviceman/feature/booking_history/widgets/no_data_screen.dart';
import 'package:demandium_serviceman/feature/booking_history/widgets/service_request_menu.dart';
import 'package:demandium_serviceman/feature/booking_history/widgets/booking_history_card.dart';
import 'package:demandium_serviceman/feature/dashboard/widgets/app_bar.dart';

class BookingHistoryScreen extends StatefulWidget {
  const BookingHistoryScreen({Key? key}) : super(key: key);
  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar:  MainAppBar(title: 'booking_history'.tr,color: Theme.of(context).primaryColor),
        body: GetBuilder<BookingHistoryController>(
          builder: (bookingHistoryController){
            return RefreshIndicator(
              backgroundColor: Theme.of(context).backgroundColor,
              color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.6),
              onRefresh: () async{
                Get.find<BookingHistoryController>().getBookingHistory(
                    bookingHistoryController.bookingHistoryStatus[bookingHistoryController.currentIndex],1
                );
              },
              child:
              CustomScrollView(
               controller: bookingHistoryController.scrollController,
                slivers: [
                  SliverPersistentHeader(delegate: BookingHistorySectionMenu(),pinned: true,floating: false,),
                  bookingHistoryController.isFirst ?
                  SliverToBoxAdapter(child: BookingHistoryShimmer()) :
                  bookingHistoryController.bookingList.length <1 ?
                  SliverToBoxAdapter(
                      child:NoDataScreen(
                          text: '${'no'.tr} ${bookingHistoryController.bookingHistoryStatus[bookingHistoryController.currentIndex]=='All'?'booking'.tr.toLowerCase():
                          bookingHistoryController.bookingHistoryStatus[bookingHistoryController.currentIndex].toLowerCase().tr.toLowerCase()} ${"request_right_now".tr}'
                      )
                  ) :
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        bookingHistoryController.bookingList.isNotEmpty?
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: bookingHistoryController.bookingList.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (con, index){
                              return BookingListItem(bookingItemModel: bookingHistoryController.bookingList[index]);
                            }):SizedBox(),
                        bookingHistoryController.isLoading ? CircularProgressIndicator(color: Theme.of(context).primaryColor,):SizedBox()
                      ],
                    ),
                  ),
                ],
              ),  ///////
            );
          },
        )
    );
  }
}


