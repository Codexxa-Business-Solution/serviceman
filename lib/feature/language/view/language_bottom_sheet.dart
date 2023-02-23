import 'package:demandium_serviceman/core/core_export.dart';
import 'package:demandium_serviceman/feature/language/widgets/language_widget.dart';
import 'package:get/get.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';


class ChooseLanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _isLoggedIn = Get.find<AuthController>().isLoggedIn();
    Get.find<LocalizationController>().loadCurrentLanguage();

    final List<MenuModel> _menuList = [
      MenuModel(icon: Images.profile, title: 'profile'.tr, route: RouteHelper.getProfileRoute()),
      MenuModel(icon: Images.profile, title: 'help_&_support'.tr, route: RouteHelper.getProfileRoute()),
    ];

    _menuList.add(MenuModel(icon: Images.logout, title: _isLoggedIn ? 'logout'.tr : 'sign_in'.tr, route: ''));

    return PointerInterceptor(
      child: GetBuilder<LocalizationController>(
        builder: (localizationController){
          return Container(
            width: Dimensions.WEB_MAX_WIDTH,
            padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Theme.of(context).cardColor,
            ),
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Icon(Icons.keyboard_arrow_down_rounded, size: 30),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height:Dimensions.PADDING_SIZE_EXTRA_LARGE),
                    Text("select_language".tr,style: ubuntuMedium.copyWith(
                        color: Theme.of(context).primaryColorLight,
                        fontSize: Dimensions.fontSizeDefault),),
                    SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: ResponsiveHelper.isDesktop(context) ? 4 : ResponsiveHelper.isTab(context) ? 4 : 2,
                        childAspectRatio: (1/1),
                      ),
                      itemCount: localizationController.languages.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => LanguageWidget(
                        languageModel: localizationController.languages[index],
                        localizationController: localizationController, index: index,
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                    SizedBox(height:Dimensions.PADDING_SIZE_EXTRA_LARGE),
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
                            Get.back();
                          }else {
                            showCustomSnackBar('select_a_language'.tr);
                          }
                        },
                      );
                    })
                  ],
                ),


                SizedBox(height: ResponsiveHelper.isMobile(context) ? Dimensions.PADDING_SIZE_SMALL : 0),
              ]),
            ),
          );
        },
      ),
    );
  }
}
