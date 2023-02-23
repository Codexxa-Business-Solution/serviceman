import 'package:get/get.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:demandium_serviceman/core/core_export.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _isLoggedIn = Get.find<AuthController>().isLoggedIn();
    double _ratio = ResponsiveHelper.isDesktop(context) ? 1.1 : ResponsiveHelper.isTab(context) ? 1.1 : 1.2;

      String _aboutUs = Get.find<SplashController>().configModel.content!.aboutUs!;
      String _privacyPolicy = Get.find<SplashController>().configModel.content!.privacyPolicy!;
      String _termsAndCondition = Get.find<SplashController>().configModel.content!.termsAndConditions!;
      String _refundPolicy = Get.find<SplashController>().configModel.content!.refundPolicy!;
      String _cancellationPolicy = Get.find<SplashController>().configModel.content!.cancellationPolicy!;


    final List<MenuModel> _menuList = [
      MenuModel(icon: Images.profile, title: 'profile'.tr, route: RouteHelper.getProfileRoute()),
      MenuModel(icon: Images.languageIcon, title: 'language'.tr, route: RouteHelper.getLanguageRoute('menu')),
      MenuModel(icon: Images.chatImage, title: 'inbox'.tr, route: RouteHelper.getInboxScreenRoute()),
      if(_aboutUs!='')MenuModel(icon: Images.aboutUs, title: 'about_us'.tr, route: RouteHelper.getHtmlRoute('about_us')),
      if(_privacyPolicy!='')MenuModel(icon: Images.privacyPolicy, title: 'privacy_policy'.tr, route: RouteHelper.getHtmlRoute("privacy-policy")),
      if(_termsAndCondition!='') MenuModel(icon: Images.termsConditions, title: 'terms_conditions'.tr, route: RouteHelper.getHtmlRoute('terms-and-condition')),
      if(_refundPolicy!='')MenuModel(icon: Images.refundPolicy, title: 'refund_policy'.tr, route: RouteHelper.getHtmlRoute('refund_policy')),
      if(_cancellationPolicy!='')MenuModel(icon: Images.cancellationPolicy, title: 'cancellation_policy'.tr, route: RouteHelper.getHtmlRoute('cancellation_policy')),
      MenuModel(icon: Images.logout, title: _isLoggedIn ? 'logout'.tr : 'sign_in'.tr, route: RouteHelper.signIn),
    ];

    return PointerInterceptor(
      child: Container(
        width: Dimensions.WEB_MAX_WIDTH,
        padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(Dimensions.RADIUS_EXTRA_LARGE)),
          color: Theme.of(context).cardColor,
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          InkWell(
            onTap: () => Get.back(),
            child: Icon(Icons.keyboard_arrow_down_rounded, size: 30),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: ResponsiveHelper.isDesktop(context) ? 8 : ResponsiveHelper.isTab(context) ? 6 : 4,
              childAspectRatio: (1/_ratio),
              crossAxisSpacing: Dimensions.PADDING_SIZE_EXTRA_SMALL, mainAxisSpacing: Dimensions.PADDING_SIZE_EXTRA_SMALL,
            ),
            itemCount: _menuList.length,
            itemBuilder: (context, index) {
              return MenuButton(menu: _menuList[index], isLogout: index == _menuList.length-1);
            },
          ),
          SizedBox(height: ResponsiveHelper.isMobile(context) ? Dimensions.PADDING_SIZE_SMALL : 0),
          SafeArea(
            child: RichText(
              text: TextSpan(
                  text: "app_version".tr,
                  style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: Theme.of(context).primaryColorLight),
                  children: <TextSpan>[
                    TextSpan(
                      text: " ${AppConstants.APP_VERSION} ",
                      style: ubuntuBold.copyWith(fontSize: Dimensions.fontSizeDefault),
                    )
                  ]
              ),
            ),
          ),
          SizedBox(height: 10)

        ]),
      ),
    );
  }
}
