
import '../core/core_export.dart';

class AppConstants {
  static const String APP_NAME = 'Serviceman';
  static const String APP_USER = '';
  static const String APP_VERSION = '1.2';
  static const String BASE_URL = 'https://urbanclap.bizz-manager.com';
  static const String LOGIN_URI = '/api/v1/serviceman/auth/login';
  static const String CONFIG_URI = '/api/v1/serviceman/config';
  static const String BOOKING_REQUEST_API = '/api/v1/serviceman/booking/list';
  static const String DASHBOARD_URI = '/api/v1/serviceman/dashboard';
  static const String PROFILE_INFO_URI = '/api/v1/serviceman/info';
  static const String UPDATE_PASSWORD_URI = '/api/v1/serviceman/profile/change-password';
  static const String UPDATE_PROFILE_URI = '/api/v1/serviceman/update/profile';
  static const String NOTIFICATION_URI = '/api/v1/serviceman/push-notifications';
  static const String BOOKING_DETAILS_URI = '/api/v1/serviceman/booking/detail';
  static const String STATUS_UPDATE_URI = '/api/v1/serviceman/booking/status-update';
  static const String FORGOT_PASS_URI = '/api/v1/serviceman/forgot-password';
  static const String OTP_VERIFICATION_URI = '/api/v1/serviceman/otp-verification';
  static const String RESET_PASS_URI = '/api/v1/serviceman/reset-password';
  static const String CREATE_CHANNEL = '/api/v1/serviceman/chat/create-channel';
  static const String GET_CHANNEL_LIST = '/api/v1/serviceman/chat/channel-list';
  static const String GET_CONVERSATION = '/api/v1/serviceman/chat/conversation';
  static const String SEND_MESSAGE = '/api/v1/serviceman/chat/send-message';
  static const String PAYMENT_STATUS_UPDATE = '/api/v1/serviceman/booking/payment-status-update';
  static const String VERIFY_TOKEN_URI = '/api/v1/auth/verify-token';
  static const String RESET_PASSWORD_URI = '/api/v1/auth/reset-password';
  static const String TOKEN_URI = '/api/v1/serviceman/update/fcm-token';
  static const String PAGES = '/api/v1/customer/config/pages';



  // image path
  static const String BUSINESS_LOGO_PATH = '/business/';
  static const String CATEGORY_IMAGE_PATH = '/category/';
  static const String PUSH_NOTIFICATION_IMAGE_PATH = '/push-notification/';
  static const String SERVICE_IMAGE_PATH = '/service/';

  static const String CUSTOMER_PROFILE_IMAGE_PATH = '/user/profile_image/';
  static const String PROVIDER_PROFILE_IMAGE_PATH = '/provider/logo/';
  static const String PROVIDER_IDENTITY_IMAGE_PATH = '/provider/identity/';
  static const String SERVICEMAN_PROFILE_IMAGE_PATH = '/serviceman/profile/';
  static const String SERVICEMAN_IDENTITY_IMAGE_PATH = '/serviceman/identity/';
  static const String ADMIN_PROFILE_IMAGE_PATH = '/user/profile_image/';


  // Shared Key
  static const String THEME = 'demand_theme';
  static const String TOKEN = 'demand_token';
  static const String COUNTRY_CODE = 'demand_country_code';
  static const String LANGUAGE_CODE = 'demand_language_code';
  static const String CART_LIST = 'demand_cart_list';
  static const String USER_PASSWORD = 'demand_user_password';
  static const String USER_ADDRESS = 'demand_user_address';
  static const String USER_NUMBER = 'demand_user_number';
  static const String USER_COUNTRY_CODE = 'demand_user_country_code';
  static const String NOTIFICATION = 'demand_notification';
  static const String SEARCH_HISTORY = 'demand_search_history';
  static const String NOTIFICATION_COUNT = 'demand_notification_count';
  static const String TOPIC = 'provider-serviceman';
  static const String ZONE_ID = 'zoneId';
  static const String LOCALIZATION_KEY = 'X-localization';
  static const String INTRO = 'intro';

  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: Images.usa, languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(imageUrl: Images.arabic, languageName: 'عربى', countryCode: 'SA', languageCode: 'ar'),
  ];
}
