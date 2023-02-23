import 'package:get/get.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateScreen extends StatelessWidget {
  final bool? isUpdate;

  UpdateScreen({required this.isUpdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

            Image.asset(
              isUpdate! ? Images.update : Images.maintenance,
              width: MediaQuery
                  .of(context)
                  .size
                  .height * 0.4,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.4,
            ),
            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.01),
            SizedBox(height: Dimensions.PADDING_SIZE_LARGE,),
            Text(
              isUpdate! ? 'update_is_available'.tr : 'we_are_under_maintenance'.tr,
              style: ubuntuBold.copyWith(fontSize: MediaQuery
                  .of(context)
                  .size
                  .height * 0.023, color: Theme
                  .of(context)
                  .primaryColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.01),

            Text(
              isUpdate! ? 'your_app_needs_to_update'.tr : 'we_will_be_right_back'
                  .tr,
              style: ubuntuRegular.copyWith(fontSize: MediaQuery
                  .of(context)
                  .size
                  .height * 0.0175, color: Theme
                  .of(context)
                  .disabledColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: isUpdate! ? MediaQuery
                .of(context)
                .size
                .height * 0.04 : 0),

            isUpdate! ? CustomButton(
                btnTxt: 'update_now'.tr, onPressed: () async {
              String _appUrl = 'https://google.com';
              if (GetPlatform.isAndroid) {
                _appUrl = Get
                    .find<SplashController>()
                    .configModel
                    .content!
                    .appUrlAndroid!;
              } else if (GetPlatform.isIOS) {
                _appUrl = Get
                    .find<SplashController>()
                    .configModel
                    .content!
                    .appUrlIos!;
              }
              _launchUrl(Uri.parse(_appUrl));

              if (await launchUrl(Uri.parse(_appUrl))) {
                launchUrl(Uri.parse(_appUrl));
              } else {
                showCustomSnackBar('${'can_not_launch'.tr} $_appUrl');
              }
            }) : SizedBox(),

          ]),
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}