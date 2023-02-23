import 'dart:convert';
import 'package:get/get.dart';
import '../../feature/booking_list/controller/booking_list_controller.dart';
import '../../feature/booking_list/repository/booking_list_repo.dart';
import '../core_export.dart';

Future<Map<String, Map<String, String>>> init() async{
  //core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

  //Repository
  Get.lazyPut(() => LanguageRepo());

  //Controller
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => SplashController(splashRepo: SplashRepo(sharedPreferences: Get.find(), apiClient: Get.find())));
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find(), apiClient: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find())));
  //Get.lazyPut(() => NotificationController(notificationRepo: Get.find()));
  Get.lazyPut(() => BookingListController(bookingListRepo: BookingListRepo(apiClient: Get.find())));
  Get.lazyPut(() => DashboardController(dashboardRepository: DashboardRepository(apiClient: Get.find())));

  //Retrieving localized data
  Map<String, Map<String, String>> _languages = Map();
  for(LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues =  await rootBundle.loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);
    Map<String, String> _json = Map();
    _mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });
    _languages['${languageModel.languageCode}_${languageModel.countryCode}'] = _json;
  }
  return _languages;
}
