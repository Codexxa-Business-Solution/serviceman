import 'package:get/get.dart';
import 'package:demandium_serviceman/core/core_export.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo}) {
    _notification = authRepo.isNotificationActive();
  }

  bool? _isLoading = false;
  bool? _notification = true;
  bool? _acceptTerms = true;

  bool? get isLoading => _isLoading;
  bool? get notification => _notification;
  bool? get acceptTerms => _acceptTerms;


  Future<void> login(String phoneWithCountryCode,String countryCode,String phoneWithoutCountryCode, String password) async {
    _isLoading = true;

    update();
    Response? response = await authRepo.login(phone: phoneWithCountryCode, password: password);
    if (response!.statusCode == 200) {
      if (isActiveRememberMe) {
        authRepo.saveUserNumberAndPassword(phoneWithCountryCode, password,countryCode);
      } else {
        authRepo.clearUserNumberAndPassword();
      }
        authRepo.saveUserToken(response.body['content']['token']);
       Get.find<ProfileController>().getUserInfo().then((value) async {
         if(value.isSuccess!){
           await authRepo.updateToken();
         }
       });
       if(response.body['message'] == 'successfully logged in'){
         showCustomSnackBar('successfully_logged_in'.tr, isError: false);
         Get.offNamed(RouteHelper.getInitialRoute());
       }
    } else {
      _isLoading = false;
      if(response.body['message'] == 'user has been disabled, please talk to the authority'){
        showCustomSnackBar('user_has_been_disabled'.tr, isError: true);
      }
      if(response.body['message'] == 'user credential does not match'){
        showCustomSnackBar('user_credential_does_not_match'.tr, isError: true);
      }
    }
    _isLoading = false;
    update();
  }



  Future<ResponseModel> forgetPassword(String phone, {bool reload = true}) async {
    if(reload){
      _isLoading = true;
      update();
    }
    Response? response = await authRepo.forgetPassword(phone);
    ResponseModel responseModel;

    if (response!.statusCode == 200) {
      if(response.body["response_code"]=="default_200"){
        Get.toNamed(RouteHelper.getVerificationRoute(phone));
      }
      else{
        showCustomSnackBar("phone_not_found".tr);
      }
      responseModel = ResponseModel(true, "");
    } else {
      showCustomSnackBar(response.statusText);
      responseModel = ResponseModel(false, "");
    }

    _isLoading = false;
    update();
    return responseModel;
  }


  Future<ResponseModel>  otpVerification(String phone,String otp) async {
    _isLoading = true;
    update();
    Response? response = await authRepo.otpVerification(phone,otp);
    ResponseModel responseModel;
    if (response!.statusCode == 200 && response.body['response_code']=="default_verified_200") {
      responseModel = ResponseModel(true, response.body["message"]);
    } else {
      responseModel = ResponseModel(false, "otp_does_not_match".tr);
    }
    _isLoading = false;
    update();
    return responseModel;
  }


  Future<void> updateToken() async {
    await authRepo.updateToken();
  }

  Future<ResponseModel> verifyToken(String email) async {
    _isLoading = true;
    update();
    Response? response = await authRepo.verifyToken(email, _verificationCode);
    ResponseModel responseModel;
    if (response!.statusCode == 200) {
      responseModel = ResponseModel(true, response.body["message"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<void> resetPassword(String phone, String otp, String password, String confirmPassword) async{
    _isLoading = true;
    update();
    Response? response = await authRepo.resetPassword(phone, otp, password, confirmPassword);
    if (response!.statusCode == 200) {
      if(response.body['message'] != 'password reset successful'){
        showCustomSnackBar('resource_not_found'.tr, isError: true);
      }else{
        Get.toNamed(RouteHelper.getSignInRoute("new_password"));
        showCustomSnackBar('password_reset_successful'.tr, isError: false);
      }
    } else {}
    _isLoading = false;
    update();
  }



  String _verificationCode = '';

  String get verificationCode => _verificationCode;

  void updateVerificationCode(String query) {
    _verificationCode = query;
    update();
  }


  bool _isActiveRememberMe = false;

  bool get isActiveRememberMe => _isActiveRememberMe;

  void toggleTerms() {
    _acceptTerms = !_acceptTerms!;
    update();
  }

  void toggleRememberMe() {
    _isActiveRememberMe = !_isActiveRememberMe;
    update();
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }

  void saveUserNumberAndPassword(String number, String password, String countryCode) {
    authRepo.saveUserNumberAndPassword(number, password, countryCode);
  }

  String getUserNumber() {
    return authRepo.getUserNumber();
  }

  String getUserCountryCode() {
    return authRepo.getUserCountryCode();
  }

  String getUserPassword() {
    return authRepo.getUserPassword();
  }

  Future<bool> clearUserNumberAndPassword() async {
    return authRepo.clearUserNumberAndPassword();
  }

  String getUserToken() {
    return authRepo.getUserToken();
  }

  bool? setNotificationActive(bool isActive) {
    _notification = isActive;
    authRepo.setNotificationActive(isActive);
    update();
    return _notification;
  }

}