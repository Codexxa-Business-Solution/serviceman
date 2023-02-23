import 'package:get/get.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import '../widgets/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  final bool exitFromApp;
  SignInScreen({required this.exitFromApp});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}


class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  String _countryDialCode='+880';
  bool _canExit = GetPlatform.isWeb ? true : false;

  @override
  void initState(){
    super.initState();
    if(Get.find<SplashController>().configModel.content != null){

      if(Get.find<AuthController>().getUserCountryCode()!=''){
        _countryDialCode = "+"+Get.find<AuthController>().getUserCountryCode();
      }else{
        _countryDialCode = CountryCode.fromCountryCode(Get.find<SplashController>()
            .configModel.content!.countryCode!).dialCode!;}
      }
    _phoneController.text =  Get.find<AuthController>().getUserNumber()
        .replaceFirst( '+${Get.find<AuthController>().getUserCountryCode()}', '');

    _passwordController.text = Get.find<AuthController>().getUserPassword();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(widget.exitFromApp) {
          if (_canExit) {
            if (GetPlatform.isAndroid) {
              SystemNavigator.pop();
            } else if (GetPlatform.isIOS) {
              exit(0);
            } else {
              Navigator.pushNamed(context, RouteHelper.getInitialRoute());
            }
            return Future.value(false);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('back_press_again_to_exit'.tr, style: TextStyle(color: Colors.white)),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
              margin: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            ));
            _canExit = true;
            Timer(Duration(seconds: 2), () {
              _canExit = false;
            });
            return Future.value(false);
          }
        }else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
            child: Center(
              child: GetBuilder<SplashController>(builder: (splashController) {
                  return GetBuilder<AuthController>(builder: (authController) {
                    return Column(children: [
                      Image.asset(Get.isDarkMode?Images.demandiumDarkLogo:Images.demandiumLogo,width: Dimensions.AUTH_LOGO,),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      CustomTextField(
                        hintText: 'phone_hint'.tr,
                        controller: _phoneController,
                        focusNode: _phoneFocus,
                        nextFocus: _passwordFocus,
                        inputType: TextInputType.phone,
                        countryDialCode: _countryDialCode,
                        onCountryChanged: (CountryCode countryCode) => _countryDialCode = countryCode.dialCode!,
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      CustomTextField(
                        title: 'password'.tr,
                        hintText: 'enter_your_password'.tr,
                        controller: _passwordController,
                        focusNode: _passwordFocus,
                        inputType: TextInputType.visiblePassword,
                        isPassword: true,
                        inputAction: TextInputAction.done,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: ListTile(
                              onTap: () => authController.toggleRememberMe(),
                              title: Row(
                                children: [
                                  SizedBox(
                                    width: 20.0,
                                    child: Checkbox(
                                      activeColor: Theme.of(context).primaryColor,
                                      value: authController.isActiveRememberMe,
                                      onChanged: (bool? isChecked) => authController.toggleRememberMe(),
                                    ),
                                  ),
                                  SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                                  Text(
                                    'remember_me'.tr,
                                    style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeDefault),
                                  ),
                                ],
                              ),
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                              horizontalTitleGap: 0,
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(minimumSize: Size(1, 40),backgroundColor: Theme.of(context).backgroundColor),
                            onPressed: () => Get.to(ForgetPassScreen()),
                            child: Text('${'forgot_password?'.tr}', style: ubuntuRegular.copyWith(
                              fontSize: Dimensions.fontSizeDefault, color: Theme.of(context).colorScheme.tertiary.withOpacity(0.8),)
                            ),
                          ),
                      ]),
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      !authController.isLoading! ? CustomButton(
                        btnTxt: 'sign_in'.tr,
                        onPressed: authController.acceptTerms! ? () => _login(authController, _countryDialCode) : null,

                      ) : Center(child: CircularProgressIndicator()),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    ]);
                  });
                }
              ),
            ),
          ),
        )),
      ),
    );
  }


  void _login(AuthController authController, String countryDialCode) async {
    String _phone = _phoneController.text.trim();
    String _password = _passwordController.text.trim();
    String _numberWithCountryCode = countryDialCode+_phone;
    String countryCode='';
    bool _isValid = GetPlatform.isWeb ? true : false;
    if(!GetPlatform.isWeb) {
      try {
        PhoneNumber phoneNumber = await PhoneNumberUtil().parse(_numberWithCountryCode);
        _numberWithCountryCode = '+' + phoneNumber.countryCode + phoneNumber.nationalNumber;
        countryCode =phoneNumber.countryCode ;
        _isValid = true;
      } catch (e) {}
    }
    if (_phone.isEmpty) {
      showCustomSnackBar('phone_hint'.tr);
    }else if (!_isValid) {
      showCustomSnackBar('invalid_phone_number'.tr);
    }else if (_password.isEmpty) {
      showCustomSnackBar('enter_password'.tr);
    }else if (_password.length < 8) {
      showCustomSnackBar('password_should_be'.tr);
    }else {
      authController.login(_numberWithCountryCode,countryCode,_phone, _password).then((status) async {
      });
    }
  }
}
