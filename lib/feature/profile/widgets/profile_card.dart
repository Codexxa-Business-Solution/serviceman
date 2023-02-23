import 'package:get/get.dart';
import 'package:demandium_serviceman/core/core_export.dart';

class ProfileCardItem extends StatelessWidget {
  final String leadingIcon;
  final bool? isDarkItem;
  final String title;
  final IconData? trailingIcon;

  const ProfileCardItem({
    Key? key,this.trailingIcon=Icons.arrow_forward_ios,
    required this.title,
    required this.leadingIcon,
    this.isDarkItem=false
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor.withOpacity(Get.isDarkMode?0.5:1),
        boxShadow: Get.isDarkMode?null:
        [BoxShadow(color: Colors.grey[Get.isDarkMode ? 800 : 200]!, blurRadius: Dimensions.RADIUS_SMALL, spreadRadius: 1)],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                  height: Dimensions.PADDING_SIZE_LARGE,
                  width:Dimensions.PADDING_SIZE_EXTRA_LARGE,
                  child: Image.asset(leadingIcon)
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
              Text(title,style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeDefault)),
            ],
          ),

          isDarkItem==false?Icon(
            trailingIcon,size: Dimensions.PADDING_SIZE_DEFAULT,
            color: Theme.of(context).primaryColorLight,
          ): GetBuilder<ThemeController>(
            builder: (themeController){
              return GestureDetector(
                onTap: ()=> themeController.toggleTheme(),
                child: Container(height: 25, width: 45,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                      color: !Get.isDarkMode?Theme.of(context).primaryColor:Colors.grey.withOpacity(0.5)
                  ),
                  child: Row(
                    mainAxisAlignment: themeController.darkTheme?MainAxisAlignment.start:MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.all(2),
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: light.cardColor,),
                        child: Icon(themeController.darkTheme ?
                        Icons.dark_mode_outlined : Icons.light_mode_outlined,
                          size: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
