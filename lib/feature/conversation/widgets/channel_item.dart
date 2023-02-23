import 'package:get/get.dart';
import 'package:demandium_serviceman/components/custom_image.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import 'package:demandium_serviceman/feature/conversation/model/conversation_user.dart';


class ChannelItem extends StatelessWidget {
  final String channelCreatedTime;
  final ConversationUserModel conversationUserModel;
  final int isRead;
  const ChannelItem({
    Key? key,
    required this.conversationUserModel,
    required this.channelCreatedTime,
    required this.isRead}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String imagePath =
    conversationUserModel.user!.userType=="customer"?AppConstants.CUSTOMER_PROFILE_IMAGE_PATH
        :conversationUserModel.user!.userType=="provider-admin"?AppConstants.PROVIDER_PROFILE_IMAGE_PATH
        :conversationUserModel.user!.userType=="provider-serviceman"?AppConstants.SERVICEMAN_PROFILE_IMAGE_PATH
        :AppConstants.ADMIN_PROFILE_IMAGE_PATH;

    return InkWell(
      onTap:(){
        Get.find<ConversationController>().resetImageFile();
        Get.find<ConversationController>().setChannelId(conversationUserModel.channelId!);
        String name = conversationUserModel.user!.userType == 'customer' || conversationUserModel.user!.userType == 'super-admin'?
        conversationUserModel.user!.firstName!+ " " +conversationUserModel.user!.lastName! : conversationUserModel.user!.provider!.companyName!;

        String phone = conversationUserModel.user!=null? conversationUserModel.user!.phone??"":"";

        String image = conversationUserModel.user!.userType == 'customer' || conversationUserModel.user!.userType == 'super-admin'?
        conversationUserModel.user!.profileImage! : conversationUserModel.user!.provider!.logo!;
        String imageWithPath = "${Get.find<SplashController>().configModel.content!.imageBaseUrl}${imagePath}${image}";

        String userTypeImage= conversationUserModel.user!.userType == 'customer' ?  'customer' : 'provider';
        Get.find<ConversationController>().setUserImageType(userTypeImage);
        Get.toNamed(RouteHelper.getChatScreenRoute(conversationUserModel.channelId!,name,imageWithPath,phone));
      },

      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isRead == 0? Theme.of(context).primaryColor : Theme.of(context).cardColor.withOpacity(Get.isDarkMode?0.5:1),
          boxShadow: shadow,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL,),
            //conversationUserModel.user.userType
            ClipRRect(borderRadius: BorderRadius.circular(50),
              child: conversationUserModel.user!=null && conversationUserModel.user!.userType == 'customer' ?
              CustomImage(
                  height: 50, width: 50,
                  image: '${Get.find<SplashController>().configModel.content!.imageBaseUrl}'
                      '/user/profile_image/'
                      '${conversationUserModel.user!.profileImage}'
              ):
              conversationUserModel.user!=null && conversationUserModel.user!.userType == 'provider-admin' ?
               CustomImage(
                  height: 50,
                  width: 50,
                  image: '${Get.find<SplashController>().configModel.content!.imageBaseUrl}'
                      '/provider/logo/'
                      '${conversationUserModel.user!.provider!.logo}'
              )
              : CustomImage(
                  height: 50,
                  width: 50,
                  image: '${Get.find<SplashController>().configModel.content!.imageBaseUrl}'
                      '${AppConstants.ADMIN_PROFILE_IMAGE_PATH}'
                      '${conversationUserModel.user!.profileImage}'
              )
            ),

            Gaps.horizontalGapOf(Dimensions.PADDING_SIZE_SMALL),

            Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              '${conversationUserModel.user!.userType == 'customer' || conversationUserModel.user!.userType == 'super-admin'  ?
                              conversationUserModel.user!.firstName!+ " " +conversationUserModel.user!.lastName! : conversationUserModel.user!.provider!.companyName!}',
                              style: isRead == 0 ?
                              ubuntuBold.copyWith(fontSize: Dimensions.fontSizeDefault, color: light.cardColor) :
                              ubuntuRegular.copyWith(
                                fontSize: Dimensions.fontSizeDefault,
                                color:Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.7), ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 10,),
                        ],
                      ),
                    ),

                    Text('${conversationUserModel.user!=null ? conversationUserModel.user!.userType!.tr : ""}',
                      style: ubuntuRegular.copyWith(
                        fontSize: Dimensions.fontSizeSmall,
                        color: isRead == 0? light.cardColor : Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.6) ,
                      ),
                    ),
                  ],
                )
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if(conversationUserModel.user!.userType == "super-admin")
                  Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withOpacity(.2),
                          borderRadius: BorderRadius.all(Radius.circular(12.0))
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL,vertical: 3),
                        child: Text('support'.tr,style: ubuntuMedium.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: Dimensions.fontSizeSmall),),
                      )),
                if(conversationUserModel.user!.userType == "super-admin")
                  SizedBox(height: 10,),

                Container(
                  width: Get.width*.25,
                  child: Text("${DateConverter.dateMonthYearTime(DateConverter.isoUtcStringToLocalDate(channelCreatedTime))}",
                    style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall,
                      color: isRead == 0? light.cardColor : Theme.of(context).hintColor,),
                    maxLines: 2,textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                  ),
                ),
              ],
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL,),
          ],
        ),
      ),
    );
  }
}

