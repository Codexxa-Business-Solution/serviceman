import 'package:demandium_serviceman/components/custom_image.dart';
import 'package:demandium_serviceman/feature/conversation/widgets/image_dialog.dart';
import 'package:get/get.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import 'package:demandium_serviceman/feature/profile/widgets/profile_information_shimmer.dart';

class GeneralInfo extends StatelessWidget {
  GeneralInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: GetBuilder<ProfileController>(
          builder: (controller){
            return controller.contents==null? ProfileInfoShimmer()
            : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Stack(alignment: AlignmentDirectional.center,
                      children: [
                        controller.pickedFile==null?
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(''
                              "${Get.find<SplashController>().configModel.content!.imageBaseUrl!}"
                              "${AppConstants.SERVICEMAN_PROFILE_IMAGE_PATH}"
                              "${controller.userInfo.profileImage}"
                          ),
                        )

                            :CircleAvatar(radius: 50, backgroundImage:FileImage(File(controller.pickedFile!.path))),

                        IconButton( onPressed: ()=>controller.pickImage(),
                          icon: Icon(Icons.camera_enhance_rounded, color: light.cardColor),
                        ),
                      ],
                    ),
                  ],
                ),

                customRichText("full_name".tr,true,context),
                NonEditableTextField(text: controller.userInfo.firstName??"",text2: controller.userInfo.lastName??""),

                customRichText("email".tr,true,context),
                CustomTextFormField(
                  isShowSuffixIcon: true,
                  controller: controller.emailController,
                  hintText: "enter_email_address".tr,
                  isShowBorder: true,
                ),
                customRichText("select_identity_type".tr,true,context),
                NonEditableTextField(text: controller.userInfo.identificationType!=null?controller.userInfo.identificationType.toString().tr:'',),

                customRichText("identity_number".tr,true,context),
                NonEditableTextField(text: controller.userInfo.identificationNumber??"",),

                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                if(controller.userInfo.identificationImage!=null && controller.userInfo.identificationImage!.length>0)
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: ResponsiveHelper.isTab(context)?2:1,
                        crossAxisSpacing: Dimensions.PADDING_SIZE_SMALL,
                        mainAxisSpacing: Dimensions.PADDING_SIZE_SMALL,
                        mainAxisExtent: 200
                    ),
                    itemBuilder: (context,index){
                      return  InkWell(
                        onTap: ()=> Get.dialog(
                            ImageDialog(imageUrl: '${Get.find<SplashController>().configModel.content!.imageBaseUrl}'
                                '${AppConstants.SERVICEMAN_IDENTITY_IMAGE_PATH}'
                                '${controller.userInfo.identificationImage![index]}'
                            )
                        ),
                        child: ClipRRect(borderRadius: BorderRadius.circular(10),
                          child: CustomImage(
                            fit: BoxFit.fill,
                            image: '${Get.find<SplashController>().configModel.content!.imageBaseUrl}'
                                '${AppConstants.SERVICEMAN_IDENTITY_IMAGE_PATH}'
                                '${controller.userInfo.identificationImage![index]}',
                          ),
                        ),
                      );
                    },
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.userInfo.identificationImage!.length,
                  ),

                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),


                controller.isLoading ?
                Center(child: CircularProgressIndicator(color: Theme.of(context).hoverColor))

                    : CustomButton(
                    btnTxt: "save".tr,
                    onPressed: ()=> _updateProfile(context,controller)

                ),

                // Padding(
                //   padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                //   child: Text(
                //     'you_can_only_change_password'.tr,
                //     textAlign: TextAlign.justify,
                //     style: ubuntuRegular.copyWith(
                //       fontSize: Dimensions.fontSizeSmall,
                //       color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5)
                //     ),
                //   ),
                // ),
                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
            ]);
          },
        )
      ),
    );
  }

  _updateProfile(BuildContext context, ProfileController profileController) {
    if(profileController.emailController!.text.isEmpty){
      showCustomSnackBar("enter_email_address".tr);
    }
    else{
      profileController.updateProfile();
    }
  }

  Widget customRichText(String title,bool isRequired,BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RichText(
          text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: title,
            style: ubuntuMedium.copyWith(color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.8))),
        TextSpan(text: isRequired?' *':"", style: ubuntuRegular.copyWith(color: Theme.of(context).errorColor)),
      ])),
    );
  }

}
