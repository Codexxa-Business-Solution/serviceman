import 'package:demandium_serviceman/core/core_export.dart';
import 'package:demandium_serviceman/feature/notifications/controller/notification_controller.dart';
import 'package:demandium_serviceman/feature/notifications/view/notification_screen.dart';
import 'package:get/get.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final Color color;
  const MainAppBar({
    Key? key,
    this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<NotificationController>(builder: (notificationController){
      return AppBar(
        elevation: 5,
        titleSpacing: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        shadowColor: Get.isDarkMode?Theme.of(context).primaryColor.withOpacity(0.5):Theme.of(context).primaryColor.withOpacity(0.1),
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          child: Image.asset(Images.citifixlogo),
        ),
        title: title!=null?
        Text(title!.tr,
          style: ubuntuBold.copyWith(
            color: Theme.of(context).primaryColorLight,
            fontSize: 17,
          ),
        ):Image.asset(Get.isDarkMode?Images.appbarDarkText:Images.citiFixText,width: 110,),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Stack(
              children: [
                IconButton(
                    onPressed: () {
                      Get.to(NotificationScreen());
                      notificationController.resetNotificationCount();
                    },
                    icon: Icon(
                      Icons.notifications,
                      color: Theme.of(context).primaryColor,
                    )
                ),
                Positioned(
                  right: 2,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 2,vertical: 3),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor
                    ),
                    child: FittedBox(
                        child: Text(
                          notificationController.unseenNotificationCount.toString(),
                          style: ubuntuRegular.copyWith(color: light.cardColor
                          ),
                        )
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: Dimensions.PADDING_SIZE_EXTRA_SMALL,
          )
        ],
      );
    });
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 55);
}
