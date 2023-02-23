import 'package:get/get.dart';
import 'package:demandium_serviceman/feature/booking_history/widgets/booking_history_card.dart';
import 'package:demandium_serviceman/feature/dashboard/widgets/app_bar.dart';
import '../../booking_history/widgets/no_data_screen.dart';
import '../controller/booking_list_controller.dart';
import 'package:demandium_serviceman/feature/booking_list/widgets/booking_list_menu.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import '../widgets/booking_list_shimmer.dart';

class BookingListScreen extends StatefulWidget {
  const BookingListScreen({Key? key}) : super(key: key);

  @override
  State<BookingListScreen> createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<BookingListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
        appBar:  MainAppBar(title: 'booking_requests'.tr,color: Theme.of(context).primaryColor),
      body: GetBuilder<BookingListController>(
        builder: (bookingListController){

          return RefreshIndicator(
            backgroundColor: Theme.of(context).backgroundColor,
            color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.6),
            onRefresh: () async{
              Get.find<BookingListController>().getBookingList(bookingListController.bookingStatusState.name.toLowerCase(),1);
            },
            child: CustomScrollView(
              controller:bookingListController.scrollController,
              slivers: [
                SliverPersistentHeader(delegate: BookingListMenu(),pinned: true,floating: false,),

                !bookingListController.isFirst? bookingListController.bookingList.length ==0 ?
                SliverToBoxAdapter(child:NoDataScreen(
                  text: '${'no'.tr} ${bookingListController.bookingStatusState.name.toLowerCase()=='all'?'':
                  bookingListController.bookingStatusState.name.toLowerCase().tr.toLowerCase()} ${"request_right_now".tr}',

                )) : SliverToBoxAdapter(
                  child: Column(
                  children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: bookingListController.bookingList.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (con, index){
                            return BookingListItem(bookingItemModel:bookingListController.bookingList[index]);
                          }
                      ),
                      bookingListController.isLoading ?
                      Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_LARGE),
                          child: CircularProgressIndicator(color: Theme.of(context).primaryColor,)) : SizedBox(),
                    ],
                  ),
                ) :SliverToBoxAdapter(child: BookingListShimmer()),
              ],
            ),
          );
        },
      )
    );
  }
}




