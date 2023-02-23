import 'package:demandium_serviceman/core/core_export.dart';
import 'package:demandium_serviceman/feature/auth/widgets/custom_text_field.dart';
import 'package:get/get.dart';


class NewPassScreen extends StatefulWidget {
  final String number;
  final String otp;
  NewPassScreen({required this.number,required this.otp});

  @override
  State<NewPassScreen> createState() => _NewPassScreenState();
}

class _NewPassScreenState extends State<NewPassScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final FocusNode _newPasswordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  String _phone='';



  @override
  void initState() {
    super.initState();
    _phone="+"+widget.number.trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(title: "change_password".tr),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [

            CustomTextField(
              title: 'New_Password'.tr,
              hintText: "********",
              controller: _newPasswordController,
              focusNode: _newPasswordFocus,
              nextFocus: _confirmPasswordFocus,
              inputType: TextInputType.visiblePassword,
              isPassword: true,
            ),

            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

            CustomTextField(
              title: "Confirm_New_Password".tr,
              hintText: "********",
              controller: _confirmPasswordController,
              focusNode: _confirmPasswordFocus,
              inputAction: TextInputAction.done,
              inputType: TextInputType.visiblePassword,
              isPassword: true,
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

            GetBuilder<AuthController>(builder: (controller){
              return controller.isLoading!?
              Center(child: CircularProgressIndicator(color: Theme.of(context).hoverColor),)

              :CustomButton(
                fontSize: Dimensions.fontSizeDefault,
                btnTxt: "change_password".tr,
                onPressed: ()=> _resetPassword(
                    _phone,widget.otp,_newPasswordController.text.trim(),_confirmPasswordController.text.trim()
                ),
              );
            })
          ]),
        ),
      ),
    );
  }

  void _resetPassword(String phone,String otp,String password,String conPassword){
    String _password = _newPasswordController.text.trim();
    String _confirmPassword = _confirmPasswordController.text.trim();
    if (_password.isEmpty) {
      showCustomSnackBar('enter_password'.tr);
    }else if (_password.length < 8) {
      showCustomSnackBar('password_should_be'.tr);
    }else if(_confirmPassword.isEmpty){
      showCustomSnackBar("enter_confirm_password".tr);
    }else if(_password != _confirmPassword) {
      showCustomSnackBar('confirm_password_does_not_matched'.tr);
    }else {
      Get.find<AuthController>().resetPassword(phone,otp,password,conPassword);
    }
  }
}
