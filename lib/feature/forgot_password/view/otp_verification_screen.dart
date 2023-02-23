import 'package:demandium_serviceman/core/core_export.dart';
import 'package:get/get.dart';

class VerificationScreen extends StatefulWidget {
   final String? number;
  VerificationScreen({this.number});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String? _number;
  Timer? _timer;
  int? _seconds = 0;

  @override
  void initState() {
    super.initState();

    _number = widget.number!.startsWith('+') ? widget.number : '+'+widget.number!.substring(1, widget.number!.length);
    _startTimer();
  }

  void _startTimer() {
    _seconds = 30;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _seconds = _seconds! - 1;
      if(_seconds == 0) {
        timer.cancel();
        _timer?.cancel();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(title: 'otp_verification'.tr),
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          child: GetBuilder<AuthController>(builder: (authController) {
            return Column(children: [
              Image.asset(Get.isDarkMode?Images.demandiumDarkLogo:Images.demandiumLogo, width: 180),
              SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

              Column(
                children: [
                   Text('enter_the_verification'.tr, style: ubuntuRegular.copyWith(color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5))),
                   SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text('sent_to'.tr, style: ubuntuRegular.copyWith(color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5))),
                       SizedBox(width: Dimensions.PADDING_SIZE_SMALL,),
                       Text('$_number', style: ubuntuMedium.copyWith(color: Theme.of(context).textTheme.bodyText1!.color)),
                     ],
                   ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 39, vertical: 35),
                child: PinCodeTextField(
                  length: 4,
                  appContext: context,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.slide,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    fieldHeight: 60,
                    fieldWidth: 60,
                    borderWidth: 1,
                    borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                    selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
                    selectedFillColor: Get.isDarkMode?Colors.grey.withOpacity(0.6):Colors.white,
                    inactiveFillColor: Theme.of(context).disabledColor.withOpacity(0.2),
                    inactiveColor: Theme.of(context).primaryColor.withOpacity(0.2),
                    activeColor: Theme.of(context).primaryColor.withOpacity(0.4),
                    activeFillColor: Theme.of(context).disabledColor.withOpacity(0.2),
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onChanged: authController.updateVerificationCode,
                  beforeTextPaste: (text) => true,
                  pastedTextStyle: ubuntuRegular.copyWith(color: Theme.of(context).textTheme.bodyText1!.color),
                ),
              ),

              authController.verificationCode.length == 4 ? !authController.isLoading! ?
              CustomButton(
                margin: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
                btnTxt: "verify".tr,
                onPressed: (){
                _otpVerify(_number!, authController.verificationCode);
                },
              ) : Center(child: CircularProgressIndicator(color: Theme.of(context).hoverColor)) : SizedBox.shrink(),

              (widget.number != null && widget.number!.isNotEmpty) ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'did_not_receive_the_code'.tr,
                  style: ubuntuRegular.copyWith(color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5)),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(1, 40),
                    backgroundColor: Theme.of(context).backgroundColor,
                    textStyle: TextStyle(color: Theme.of(context).primaryColor)
                  ),
                  onPressed: _seconds! < 1 ? () {
                    authController.forgetPassword(_number!,reload: false).then((value) {
                      if (value.isSuccess!) {
                        _startTimer();
                        showCustomSnackBar('resend_code_successful'.tr, isError: false);
                      } else {
                        showCustomSnackBar(value.message);
                      }
                    });
                  } : null,
                  child: Text('${'resend'.tr}${_seconds! > 0 ? ' ($_seconds)' : ''}',style: ubuntuRegular.copyWith(
                    fontSize: Dimensions.fontSizeDefault, color: Theme.of(context).primaryColor,)),
                ),
              ]) : SizedBox(),

              SizedBox(height: Get.height*0.1,)
            ]);
          }),
        ),
      ),
    );
  }

  void _otpVerify(String phone,String otp) async {

      Get.find<AuthController>().otpVerification(phone,otp).then((status) async {
        if (status.isSuccess!) {
          Get.offNamed(RouteHelper.getChangePasswordRoute(phone.toString(),otp));
        }else {
          showCustomSnackBar(status.message);
        }
      });
  }


}
