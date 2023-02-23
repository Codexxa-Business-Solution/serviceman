import 'package:demandium_serviceman/core/core_export.dart';
import 'package:demandium_serviceman/feature/language/widgets/language_widget.dart';
import 'package:get/get.dart';

class ChooseLanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            GetBuilder<LocalizationController>(
              builder: (localizationController){
                return Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding:  EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(Get.isDarkMode?Images.demandiumDarkLogo: Images.demandiumLogo, width: 180),
                            SizedBox(height:Dimensions.PADDING_SIZE_EXTRA_LARGE),
                            SizedBox(height:Dimensions.PADDING_SIZE_EXTRA_LARGE),
                            Row(
                              children: [
                                SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL,),
                                Text("select_language".tr,style: ubuntuMedium.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: Dimensions.fontSizeDefault),),
                                SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL,),
                              ],
                            ),

                            GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: ResponsiveHelper.isDesktop(context) ? 4 :
                                ResponsiveHelper.isTab(context) ? 3 : 2,
                                childAspectRatio: (1/1),
                              ),
                              itemCount: localizationController.languages.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
                              itemBuilder: (context, index) => LanguageWidget(
                                languageModel: localizationController.languages[index],
                                localizationController: localizationController, index: index,
                              ),
                            ),
                            SizedBox(height:Dimensions.PADDING_SIZE_SMALL),

                            Row(
                              children: [
                                SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL,),
                                Text("language_hint_text".tr,style: ubuntuRegular.copyWith(
                                    color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5),
                                    fontSize: Dimensions.fontSizeSmall),),
                                SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            GetBuilder<LocalizationController>(builder: (localizationController){
              return  CustomButton(
                btnTxt: 'save'.tr,
                margin: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                onPressed: () {
                  Get.find<SplashController>().disableIntro();
                  if(localizationController.languages.length > 0 && localizationController.selectedIndex != -1) {
                    localizationController.setLanguage(Locale(
                      AppConstants.languages[localizationController.selectedIndex].languageCode!,
                      AppConstants.languages[localizationController.selectedIndex].countryCode,
                    ));
                    Get.offNamed(RouteHelper.signIn);
                  }else {
                    showCustomSnackBar('select_a_language'.tr);
                  }
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
