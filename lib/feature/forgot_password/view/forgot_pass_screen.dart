
import 'package:demandium_serviceman/core/core_export.dart';
import 'package:demandium_serviceman/feature/auth/widgets/custom_text_field.dart';
import 'package:get/get.dart';

class ForgetPassScreen extends StatelessWidget {
  final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String countryDialCode = CountryCode.fromCountryCode(Get.find<SplashController>().configModel.content!.countryCode!).dialCode!;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(title: "forgot_password".tr),

      body: SafeArea(child: Center(child: Scrollbar(child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),

        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
        child: Center(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
          child: Column(children: [

            Image.asset(Images.forgetPassword,height: 100,width: 100,),

            SizedBox(height: Dimensions.PADDING_SIZE_LARGE,),

            CustomTextField(
              hintText: 'phone_humber_hint'.tr,
              controller: _numberController,
              inputType: TextInputType.phone,
              countryDialCode: countryDialCode,
              onCountryChanged: (CountryCode countryCode) => countryDialCode = countryCode.dialCode!,
            ),

            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

            GetBuilder<AuthController>(builder: (authController) {
              return !authController.isLoading! ?
              CustomButton(btnTxt: "send_otp".tr,
                onPressed: (){
                      _forgetPass(countryDialCode);
              },) : Center(child: CircularProgressIndicator(color: Theme.of(context).hoverColor));
            }),
            SizedBox(height: 150),

          ]),
        )),
      )))),
    );
  }



  void _forgetPass(String countryDialCode) async {
    String _phone = countryDialCode +_numberController.text.trim();
    if (_phone.isEmpty) {
      showCustomSnackBar('enter_phone_number'.tr);
    }else {
        Get.find<AuthController>().forgetPassword(_phone);
      }
    }
  }


