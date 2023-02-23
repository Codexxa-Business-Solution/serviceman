import 'package:get/get.dart';
import 'package:demandium_serviceman/core/core_export.dart';


class NotificationRepo {
final ApiClient apiClient;
final SharedPreferences sharedPreferences;
NotificationRepo({required this.sharedPreferences, required this.apiClient});

Future<Response> getNotification(int offset) async {
  return await apiClient.getData(
      '${AppConstants.NOTIFICATION_URI}?limit=30&offset=$offset');
}

Future <int?> getNotificationCount() async {
  return await sharedPreferences.getInt(AppConstants.NOTIFICATION_COUNT);
}
void setNotificationCount(int count){
  sharedPreferences.setInt(AppConstants.NOTIFICATION_COUNT, count);
}
}

