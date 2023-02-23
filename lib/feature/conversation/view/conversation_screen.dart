import 'package:get/get.dart';
import 'package:demandium_serviceman/components/custom_image.dart';
import 'package:demandium_serviceman/feature/conversation/widgets/chatting_shimmer.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import '../widgets/message_widget.dart';

class ConversationScreen extends StatefulWidget {
  final String channelID;
  final String name;
  final String image;
  final String userType;

  ConversationScreen({
    required this.name,
    required this.image,
    required this.channelID,
    required this.userType,
  });
  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  String phone ='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     phone = "+"+widget.userType;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        titleSpacing: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        shadowColor: Get.isDarkMode?Theme.of(context).primaryColor.withOpacity(0.5):Theme.of(context).primaryColor.withOpacity(0.1),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).primaryColorLight,
              size: 20
            )
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.name,
                style: ubuntuBold.copyWith(fontSize: Dimensions.fontSizeLarge,color: Theme.of(context).primaryColorLight)
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL,),
            Text(phone,
                style: ubuntuMedium.copyWith(fontSize: Dimensions.fontSizeSmall,color: Theme.of(context).primaryColorLight)
            ),
          ],
        ),
        actions: [
          Padding(padding: const EdgeInsets.all(8.0),
            child: Container(height: 40, width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CustomImage(image: widget.image),
              ),
            ),
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL)
        ],
      ),

      body: GetBuilder<ConversationController>(
        initState: (state) {Get.find<ConversationController>().getConversation(widget.channelID,1);},
        builder: (conversationController) {
          String? customerID = Get.find<ProfileController>().userInfo.id;
          return conversationController.isFirst ?
          ChattingShimmer() :
          Column(
            children: [
              conversationController.conversationList!.length>0 ?
              Expanded(
                child: ListView.builder(
                  controller: conversationController.messageScrollController,
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  itemCount: conversationController.conversationList!.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    bool isRightMessage = conversationController.conversationList!.elementAt(index).userId == customerID;
                    return ConversationBubble(
                      conversationData:conversationController.conversationList!.elementAt(index),
                      isRightMessage: isRightMessage,
                    );
                  },
                ),
              ) :Expanded(child: Center(child: Text('no_conversation_found'.tr),)),
              conversationController.pickedImageFile != null && conversationController.pickedImageFile!.length > 0 ?
              Container(height: 90, width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return  Stack(
                      children: [
                        Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(height: 80, width: 80,
                              child: Image.file(
                                File(conversationController.pickedImageFile![index].path),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 5,
                          child: InkWell(
                            child: Icon(Icons.cancel_outlined, color: Colors.red),
                            onTap: () => conversationController.pickMultipleImage(true,index: index),
                          ),
                        ),
                      ],
                    );},
                  itemCount: conversationController.pickedImageFile!.length,
                ),
              ) : SizedBox(),

              conversationController.otherFile != null ?
              Stack(children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  height: 25,
                  child: Text(
                    conversationController.otherFile!.names.toString(),
                  ),
                ),
                Positioned(top: 0, right: 0,
                    child: InkWell(child: Icon(Icons.cancel_outlined,
                        color: Colors.red),
                        onTap: () => conversationController.pickOtherFile(true)
                    )
                )
              ],) : SizedBox(),

              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  margin: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL,
                    right: Dimensions.PADDING_SIZE_SMALL,
                    bottom: Dimensions.PADDING_SIZE_SMALL,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.5)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset: Offset(2.0, 2.0),
                      ),
                    ], color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.all(Radius.circular(20),),
                  ),
                  child: Form(
                    key: conversationController.conversationKey,
                    child: Row(
                      children: [
                        SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
                        Expanded(
                          child: TextField(
                            controller: conversationController.conversationController,
                            textCapitalization: TextCapitalization.sentences,
                            style: ubuntuMedium.copyWith(
                              fontSize: Dimensions.fontSizeLarge,
                              color:Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.8),
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "type_here".tr,
                              hintStyle: ubuntuRegular.copyWith(
                                color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.8),
                                fontSize: 16,
                              ),
                            ),
                            onChanged: (String newText) {
                              print(newText);
                            },
                          ),
                        ),

                        Row(
                          children: [
                            Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
                              child: InkWell(child: Image.asset(
                                  Images.image, color: Get.isDarkMode?Colors.white:Colors.black),
                                  onTap: () => conversationController.pickMultipleImage(false)
                              ),
                            ),

                            InkWell(child: Image.asset(Images.file, color: Get.isDarkMode?Colors.white:Colors.black),
                                onTap: () => conversationController.pickOtherFile(false)
                            ),

                            conversationController.isLoading! ?
                            Container(padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 20,
                              width: 40,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Theme.of(context).hoverColor,
                                ),
                              ),
                            ) :InkWell(
                              onTap: (){
                                if(conversationController.conversationController.text.isEmpty
                                    && conversationController.pickedImageFile!.isEmpty
                                    && conversationController.otherFile==null){
                                }
                                else if(conversationController.conversationKey.currentState!.validate()){
                                  conversationController.sendMessage(widget.channelID);
                                }
                                conversationController.conversationController.clear();
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.PADDING_SIZE_SMALL,
                                ),
                                child: Image.asset(
                                  Images.sendMessage,
                                  width: 25,
                                  height: 25,
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ],
          );
        }),
    );
  }
}
