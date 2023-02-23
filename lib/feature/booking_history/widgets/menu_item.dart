import 'package:get/get.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import '../controller/history_screen_controller.dart';

class CategoryTabItem extends GetView<BookingHistoryController> {
  const CategoryTabItem({Key? key, required this.title,this.index}) : super(key: key);
  final String title;
  final int? index;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
          color: controller.currentIndex !=index && Get.isDarkMode?
          Colors.grey.withOpacity(0.2):controller.currentIndex ==index? Theme.of(context).primaryColor:
          Theme.of(context).primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Row(
        children: [
          SizedBox(
            height: 16,
            width: 16,
            child: Image.asset(
              index == 0 ? Images.allIcon :index == 1 ?
              Images.completedIcon:Images.canceledIcon
            )
          ),
          SizedBox(width: 5),
          Text(
            "${title}",
            textAlign: TextAlign.center,
            style:ubuntuMedium.copyWith(
                fontSize: Dimensions.fontSizeSmall,color: controller.currentIndex ==index?
            Colors.white: Theme.of(context).textTheme.bodyText1!.color),
          )
        ],
      ),
    );
  }
}