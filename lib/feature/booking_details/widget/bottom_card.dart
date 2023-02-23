import 'package:get/get.dart';
import 'package:demandium_serviceman/components/custom_image.dart';
import 'package:demandium_serviceman/core/core_export.dart';


class BottomCard extends StatelessWidget {

  BottomCard({Key? key, required this.name, required this.phone, required this.image, this.Address}) : super(key: key);

  final String name;
  final String phone;
  final String image;
  final String? Address;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
      padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).cardColor.withOpacity(Get.isDarkMode?0.5:1),
          boxShadow: shadow
      ),


      child: Column(
        children: [

          SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT,),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CustomImage(
              height: 50,
              width: 50,
              image: image,
            )
          ),

          SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
          Text("$name", style: ubuntuBold.copyWith(fontSize: Dimensions.fontSizeDefault,),textAlign: TextAlign.center,),

          SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
          Text("$phone", style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeDefault,
              color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.7))),

          SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
          Address != null ?
          Padding(padding: EdgeInsets.symmetric(horizontal: 10),
            child: RichText(
              text: TextSpan(text: '${'service_address'.tr} :',
                style: ubuntuBold.copyWith(fontSize: Dimensions.fontSizeDefault,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              children: [
                  TextSpan(
                    text: ' $Address',
                      style: ubuntuRegular.copyWith(
                        fontSize: Dimensions.fontSizeDefault,
                        color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.7),
                      ),
                  ),
              ],
            ),
              textAlign: TextAlign.center),
          ) : SizedBox(),

           SizedBox(height:Dimensions.PADDING_SIZE_SMALL),
        ],
      ),
    );
  }
}