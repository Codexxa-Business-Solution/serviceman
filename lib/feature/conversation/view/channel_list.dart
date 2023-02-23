import 'package:get/get.dart';
import 'package:demandium_serviceman/feature/conversation/widgets/channel_item.dart';
import 'package:demandium_serviceman/feature/notifications/widgets/no_notification_screen.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:demandium_serviceman/core/core_export.dart';

class ChannelList extends GetView<ConversationController> {
  const ChannelList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(title: 'inbox'.tr),
      body: RefreshIndicator(
        backgroundColor: Theme.of(context).backgroundColor,
        color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.6),
        onRefresh: () async {
         Get.find<ConversationController>().getChannelList(1,false);
         },
       child: GetBuilder<ConversationController>(
        initState:(_) async=> await Get.find<ConversationController>().getChannelList(1,false),
        builder: (conversationController){
          if(!conversationController.paginationLoading)
          return Column(
            children: [
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              conversationController.adminConversationModel!=null?
              ChannelItem(
                conversationUserModel: conversationController.adminConversationModel!,
                channelCreatedTime: conversationController.adminConversationModel!.createdAt,
                isRead: 0,
              ): SizedBox(),
              Expanded(
                child:controller.channelList!.length==0 && conversationController.adminConversationModel==null?
                SizedBox(
                    child: NoDataScreen(text: '',type: NoDataType.CONVERSATION,)

                ): ListView.builder(
                    controller: conversationController.channelScrollController,
                    itemCount: controller.channelList!.length,
                    itemBuilder: (context,index){
                      bool user =
                      ((controller.channelList![index].channelUsers![0].user != null && controller.channelList![index].channelUsers![0].user!.userType !='super-admin')
                          &&  (controller.channelList![index].channelUsers![1].user != null && controller.channelList![index].channelUsers![1].user!.userType !='super-admin'));
                      int? _isRead;
                      if(user){
                        _isRead = controller.channelList![index].channelUsers![0].user!.userType == "provider-serviceman" ?
                        controller.channelList![index].channelUsers![0].isRead! : controller.channelList![index].channelUsers![1].isRead!;
                      }
                      return user? ChannelItem(
                        conversationUserModel:  controller.channelList![index].channelUsers![0].user!.userType != "provider-serviceman" ?
                        controller.channelList![index].channelUsers![0] : controller.channelList![index].channelUsers![1],
                        channelCreatedTime: controller.channelList!.elementAt(index).updatedAt!,
                        isRead: _isRead!,
                      ): SizedBox();
                    }
                ),
              ),
              conversationController.isLoading! ? Center(child: Padding(
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  child: CircularProgressIndicator(color: Theme.of(context).hoverColor)),
              ) : SizedBox.shrink(),
            ],
          );
          return InboxShimmer();

        },
      ),
    ));
  }
}

class InboxShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
      itemBuilder: (context, index) {
        return Shimmer(
          duration: Duration(seconds: 3),
          interval: Duration(seconds: 5),
          color: Theme.of(context).backgroundColor,
          colorOpacity: 0,
          enabled: true,
          child: Padding(
            padding: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_DEFAULT),
            child: Row(children: [
              CircleAvatar(backgroundColor: Theme.of(context).shadowColor,child: Icon(Icons.person), radius: 20),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
                  child: Column(children: [
                    Container(height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                          color: Theme.of(context).shadowColor),
                    ),
                  ]),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
