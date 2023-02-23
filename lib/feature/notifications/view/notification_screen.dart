import 'package:get/get.dart';
import 'package:demandium_serviceman/components/custom_image.dart';
import 'package:demandium_serviceman/feature/notifications/controller/notification_controller.dart';
import 'package:demandium_serviceman/feature/notifications/widgets/notification_dialog.dart';
import 'package:demandium_serviceman/feature/notifications/widgets/notification_shimmer.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import '../widgets/no_notification_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<NotificationController>().getNotifications(1,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(title: "notifications".tr),
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<NotificationController>().getNotifications(1);
          },
        child: GetBuilder<NotificationController>(

          builder: (controller) {

          return controller.isLoading? NotificationShimmer(): controller.dateList.length == 0 ?
          NoDataScreen(text: 'empty_notifications'.tr,):
          CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              SliverToBoxAdapter(child: Column(children: [
                ListView.builder(
                  itemBuilder: (context, index0) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.PADDING_SIZE_DEFAULT,
                              vertical: Dimensions.PADDING_SIZE_DEFAULT
                          ),
                          width: Get.width,
                          color:Theme.of(context).backgroundColor,
                          child: Text("${Get.find<NotificationController>().dateList[index0]}",
                            textDirection: TextDirection.ltr,
                            style: ubuntuBold.copyWith(
                                fontSize: Dimensions.fontSizeLarge,
                                color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.7)
                            )
                          )
                        ),
                        ListView.builder(
                          itemBuilder: (context, index1) {
                            return InkWell(
                              onTap:(){
                                showDialog(context: context, builder: (ctx)  => NotificationDialog(
                                  title: "${controller.notificationList[index0][index1].title.toString().trim()}",
                                  subTitle: "${controller.notificationList[index0][index1].description}",
                                  imageUrl:'${Get.find<SplashController>().configModel.content!.imageBaseUrl}''/push-notification/'
                                      '${controller.notificationList[index0][index1].coverImage}',
                                ));
                              },

                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.PADDING_SIZE_SMALL,
                                    vertical: Dimensions.PADDING_SIZE_SMALL,

                                  ),
                                  color: Theme.of(context).cardColor.withOpacity(Get.isDarkMode?0.5:1),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: CustomImage(
                                              image: '${Get.find<SplashController>().configModel.content!.imageBaseUrl}'
                                                  '/push-notification/''${controller.notificationList[index0][index1].coverImage}',
                                              height: 30, width: 30,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT,),

                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("${controller.notificationList[index0][index1].title.toString().trim()}",
                                                  style: ubuntuMedium.copyWith(
                                                    color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.7),
                                                    fontSize: Dimensions.fontSizeDefault
                                                  )
                                                ),
                                                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                                                Text("${controller.notificationList[index0][index1].description}",
                                                  style: ubuntuRegular.copyWith(
                                                    color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5),
                                                    fontSize: Dimensions.fontSizeDefault
                                                  ),
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ]),
                                          ),

                                          Container(
                                            height: 40, width: 60,
                                            child: Text("${DateConverter.convertStringTimeToDate(DateConverter.isoUtcStringToLocalDate(
                                                controller.notificationList[index0][index1].createdAt))}"
                                            )
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                              ),
                            );
                          },
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.notificationList[index0].length,
                        )
                      ],
                    );
                  },
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.dateList.length,
                ),
                controller.isLoading? CircularProgressIndicator():SizedBox(),


              ],),
              ),
              SliverToBoxAdapter(
                child:   SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
              )
            ]);
        },
      )));
  }
}




