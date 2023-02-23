import 'dart:convert';

import 'package:demandium_serviceman/data/model/response/notification_body.dart';
import 'package:get/get.dart';
import 'package:demandium_serviceman/components/UpdateScreen.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import 'package:demandium_serviceman/feature/booking_list/binding/booking_list_binding.dart';
import 'package:demandium_serviceman/feature/booking_list/view/booking_list_screen.dart';
import 'package:demandium_serviceman/feature/conversation/binding/conversation_binding.dart';
import 'package:demandium_serviceman/feature/conversation/view/channel_list.dart';
import 'package:demandium_serviceman/feature/home/home_screen.dart';
import 'package:demandium_serviceman/feature/html/binding/html_binding.dart';
import 'package:demandium_serviceman/feature/html/html_viewer_screen.dart';
import 'package:demandium_serviceman/feature/language/view/language_bottom_sheet.dart';
import 'package:demandium_serviceman/feature/notifications/view/notification_screen.dart';
import 'package:demandium_serviceman/feature/profile/binding/profile_binding.dart';
import 'package:demandium_serviceman/feature/profile/view/profile_information_tabs.dart';
import 'package:demandium_serviceman/feature/profile/view/profile_screen.dart';
import 'package:demandium_serviceman/feature/splash/binding/splash_binding.dart';
import 'package:demandium_serviceman/utils/html_type.dart';


class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String language = '/language';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String verification = '/verification';
  static const String update = '/update';
  static const String profile = '/profile';
  static const String profileInformation = '/profile-information';
  static const String bankInfo = '/bank-info';
  static const String mySubscription = '/my-subscription';
  static const String html = '/html';
  static const String bookingDetails = '/booking-details';
  static const String chatScreen = '/chat-screen';
  static const String chatInbox = '/chat-inbox';
  static const String notification = '/notification';
  static const String bookingRequest = '/booking-request';
  static const String forgotPassword = '/forgot-password';
  static const String verificationScreen = '/otp-verification';
  static const String changePassword = '/change-password';
  static const String invoice = '/invoice';
  static String getInitialRoute() => initial;
  static String getSplashRoute(NotificationBody? body) {
    String _data = 'null';
    if(body != null) {
      List<int> _encoded = utf8.encode(jsonEncode(body));
      _data = base64Encode(_encoded);
    }
    return '$splash?data=$_data';
  }
  static String getLanguageRoute(String page) => '$language?page=$page';
  static String getSignInRoute(String page) => '$signIn?page=$page';
  static String getUpdateRoute(bool isUpdate) => '$update?update=${isUpdate.toString()}';
  static String getChatScreenRoute(String channelId,String name,String image,String userType) =>
      '$chatScreen?channelID=$channelId&name=$name&image=$image&userType=$userType';
  static String getInboxScreenRoute() => '$chatInbox';
  static String getProfileRoute() => profile;
  static String getBankInfoRoute() => bankInfo;
  static String getMySubscriptionRoute() => mySubscription;
  static String getHtmlRoute(String page) => '$html?page=$page';
  static String getBookingDetailsRoute(String bookingId, String bookingStatus, String fromPage) =>
      '$bookingDetails?booking_id=$bookingId&booking_status=$bookingStatus&fromPage=$fromPage';
  static String getBookingReqRoute() => bookingRequest;
  static String getForgotPasswordRoute() => forgotPassword;
  static String getVerificationRoute(String phone) => '$verificationScreen?phone=$phone';
  static String getChangePasswordRoute(String phone,String otp) => '$changePassword?phone=$phone&otp=$otp';
  static String getInvoiceRoute(String booking_id) => '$invoice?booking_id=$booking_id';
  static String getNotificationRoute() => '$notification';



  static List<GetPage> routes = [
    GetPage(name: initial, page: () => getRoute(HomeScreen(pageIndex: 0))),
    GetPage(name: splash,
        page: () {
          NotificationBody? _data;
          if(Get.parameters['data'] != 'null') {
            List<int> _decode = base64Decode(Get.parameters['data']!.replaceAll(' ', '+'));
            _data = NotificationBody.fromJson(jsonDecode(utf8.decode(_decode)));
          }
          return SplashScreen(body: _data != null ? _data:null);
        },
        binding: SplashBinding()
    ),

    GetPage(name: profile, page: () => ProfileScreen(),binding: UserBinding()),
    GetPage(name: notification, page: () => NotificationScreen()),
    GetPage(name: signIn, page: () => SignInScreen(exitFromApp: false,)),

    GetPage(name: bookingDetails, binding: BookingDetailsBinding(),
        page: () => getRoute(BookingDetails(
          bookingStatus: Get.parameters['booking_status'].toString(),
          bookingId: Get.parameters['booking_id'].toString(),
          fromPage: Get.parameters['fromPage'],
        ))
    ),

    GetPage(name: profileInformation, page: () => getRoute(ProfileInformationScreen())),
    GetPage(name: bookingRequest, page: () => getRoute(BookingListScreen()),binding:  BookingListBinding()),
    GetPage( name: chatScreen, page: () => getRoute(ConversationScreen(
        channelID: Get.parameters['channelID']!,
        name: Get.parameters['name']!,
        userType: Get.parameters['userType']!,
        image: Get.parameters['image']!)
    )),    GetPage(name: forgotPassword, page:() => getRoute(ForgetPassScreen()),),
    GetPage(name: verificationScreen, page:() => getRoute(VerificationScreen(number: Get.parameters['phone'].toString(),)),),
    GetPage(name: changePassword, page:() => getRoute(NewPassScreen(number: Get.parameters['phone'].toString(),otp: Get.parameters['otp'].toString())),),
    GetPage(name: language, page: () => ChooseLanguageBottomSheet()),
    GetPage(name: html, page: () => HtmlViewerScreen(
      htmlType: Get.parameters['page'] == 'terms-and-condition' ? HtmlType.TERMS_AND_CONDITION
      : Get.parameters['page'] == 'privacy-policy' ? HtmlType.PRIVACY_POLICY :Get.parameters['page'] == 'refund_policy' ?
      HtmlType.REFUND_POLICY: Get.parameters['page'] == 'return_policy' ? HtmlType.RETURN_POLICY:
      Get.parameters['page'] == 'cancellation_policy' ? HtmlType.CANCELLATION_POLICY :
      HtmlType.ABOUT_US,
    ),binding: HtmlBindings()),
    GetPage(name: chatInbox,binding: ConversationBinding(), page: () => ChannelList()),
  ];

  static getRoute(Widget navigateTo) {
    // double _minimumVersion = 1.0;
    // if(GetPlatform.isAndroid) {
    //   if(Get.find<SplashController>().configModel.content!.minimumVersion!=null){
    //     _minimumVersion = double.parse(Get.find<SplashController>()
    //         .configModel.content!.minimumVersion!.minVersionForAndroid!.toString());
    //   }
    // }else if(GetPlatform.isIOS) {
    //   if(Get.find<SplashController>().configModel.content!.minimumVersion!=null){
    //     _minimumVersion = double.parse(Get.find<SplashController>().configModel.content!.minimumVersion!.minVersionForIos!.toString());
    //   }
    // }
    return navigateTo;
  }
}