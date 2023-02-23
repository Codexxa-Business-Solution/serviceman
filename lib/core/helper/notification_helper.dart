import 'dart:convert';
import 'package:demandium_serviceman/data/model/response/notification_body.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import '../core_export.dart';

class NotificationHelper {
  static Future<void> initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize = new AndroidInitializationSettings('notification_icon');
    var iOSInitialize = new IOSInitializationSettings();
    var initializationsSettings = new InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    flutterLocalNotificationsPlugin.initialize(initializationsSettings, onSelectNotification: (String? payload) async {
      try{
        if(payload!=null && payload!=''){
          NotificationBody notificationBody = NotificationBody.fromJson(jsonDecode(payload));
          print("Type: ${notificationBody.type}");
          if(notificationBody.type=='general'){
            Get.toNamed(RouteHelper.getNotificationRoute());
          }else if(notificationBody.type=='booking' && notificationBody.bookingId!=null && notificationBody.bookingId!=''){
            Get.toNamed(RouteHelper.getBookingDetailsRoute(notificationBody.bookingId.toString(),'','fromNotification'));
          } else if(notificationBody.type=='privacy_policy' && notificationBody.title!=null && notificationBody.title!=''){
            Get.toNamed(RouteHelper.getHtmlRoute("privacy-policy"));
          }else if(notificationBody.type=='terms_and_conditions' && notificationBody.title!=null && notificationBody.title!=''){
            Get.toNamed(RouteHelper.getHtmlRoute("terms-and-condition"));
          }else{
            Get.toNamed(RouteHelper.getNotificationRoute());
          }
        }
      }catch (e) {}
      return;
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage: ${message.notification!.title}/${message.notification!.body}/${message.notification!.titleLocKey}");
      NotificationHelper.showNotification(message, flutterLocalNotificationsPlugin, false);
      if(Get.find<AuthController>().isLoggedIn()) {
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) {
      try{
        if(message!=null && message.data.isNotEmpty) {
          NotificationBody _notificationBody = convertNotification(message.data);
          if(_notificationBody.type=='general'){
            Get.toNamed(RouteHelper.getNotificationRoute());
          }else if(_notificationBody.type=='booking'
              && message.data['booking_id']!=null&& message.data['booking_id']!=""){
            Get.toNamed(RouteHelper.getBookingDetailsRoute(message.data['booking_id'],'','fromNotification'));
          } else if(_notificationBody.type=='privacy_policy'){
            Get.toNamed(RouteHelper.getHtmlRoute("privacy-policy"));
          }else if(_notificationBody.type=='terms_and_conditions'){
            Get.toNamed(RouteHelper.getHtmlRoute("terms-and-condition"));
          }else{
            Get.toNamed(RouteHelper.getNotificationRoute());
          }
        }
      }catch (e) {}
    });
  }

  static Future<void> showNotification(RemoteMessage message, FlutterLocalNotificationsPlugin fln, bool data) async {
    if(!GetPlatform.isIOS) {
      String? _title;
      String? _body;
      String? _orderID;
      String? _image;
      String playLoad = jsonEncode(message.data);
      if(data) {
        _title = message.data['title']?.replaceAll('_', ' ').toString().capitalize;
        _body = message.data['body'];
        _orderID = message.data['order_id'];
        _image = (message.data['image'] != null && message.data['image'].isNotEmpty)
            ? message.data['image'].startsWith('http') ? message.data['image']
            : '${AppConstants.BASE_URL}/storage/app/public/notification/${message.data['image']}' : null;
      }else {
        _title = message.notification!.title;
        _body = message.notification!.body;
        _orderID = message.notification!.titleLocKey;
        if(GetPlatform.isAndroid) {
          _image = (message.notification!.android!.imageUrl != null && message.notification!.android!.imageUrl!.isNotEmpty)
              ? message.notification!.android!.imageUrl!.startsWith('http') ? message.notification!.android!.imageUrl
              : '${AppConstants.BASE_URL}/storage/app/public/notification/${message.notification!.android!.imageUrl}' : null;
        }else if(GetPlatform.isIOS) {
          _image = (message.notification!.apple!.imageUrl != null && message.notification!.apple!.imageUrl!.isNotEmpty)
              ? message.notification!.apple!.imageUrl!.startsWith('http') ? message.notification!.apple!.imageUrl
              : '${AppConstants.BASE_URL}/storage/app/public/notification/${message.notification!.apple!.imageUrl}' : null;
        }
      }

      if(_image != null && _image.isNotEmpty) {
        try{
          await showBigPictureNotificationHiddenLargeIcon(_title!, _body!, playLoad, _image, fln);
        }catch(e) {
          await showBigTextNotification(_title!, _body!, playLoad, fln);
        }
      }else {
        await showBigTextNotification(_title!, _body!,playLoad, fln);
      }
    }
  }

  static Future<void> showTextNotification(String title, String body, String playLoad, FlutterLocalNotificationsPlugin fln) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'ondemandservice', 'ondemandservice', playSound: true,
      importance: Importance.max, priority: Priority.max, sound: RawResourceAndroidNotificationSound('notification'),
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await fln.show(0, title, body, platformChannelSpecifics, payload: playLoad);
  }

  static Future<void> showBigTextNotification(String title, String body, String playLoad, FlutterLocalNotificationsPlugin fln) async {
    BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
      body, htmlFormatBigText: true,
      contentTitle: title, htmlFormatContentTitle: true,
    );
    AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'ondemandservice', 'ondemandservice', importance: Importance.max,
      styleInformation: bigTextStyleInformation, priority: Priority.max, playSound: true,
      sound: RawResourceAndroidNotificationSound('notification'),
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await fln.show(0, title, body, platformChannelSpecifics, payload: playLoad);
  }

  static Future<void> showBigPictureNotificationHiddenLargeIcon(String title, String body, String playLoad, String image, FlutterLocalNotificationsPlugin fln) async {
    final String largeIconPath = await _downloadAndSaveFile(image, 'largeIcon');
    final String bigPicturePath = await _downloadAndSaveFile(image, 'bigPicture');
    final BigPictureStyleInformation bigPictureStyleInformation = BigPictureStyleInformation(
      FilePathAndroidBitmap(bigPicturePath), hideExpandedLargeIcon: true,
      contentTitle: title, htmlFormatContentTitle: true,
      summaryText: body, htmlFormatSummaryText: true,
    );
    final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'ondemandservice', 'ondemandservice',
      largeIcon: FilePathAndroidBitmap(largeIconPath), priority: Priority.max, playSound: true,
      styleInformation: bigPictureStyleInformation, importance: Importance.max,
      sound: RawResourceAndroidNotificationSound('notification'),
    );
    final NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await fln.show(0, title, body, platformChannelSpecifics, payload: playLoad);
  }

  static Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  static NotificationBody convertNotification(Map<String, dynamic> data){
    return NotificationBody.fromJson(data);
  }

}

Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
  print("onBackground: ${message.notification!.title}/${message.notification!.body}/${message.notification!.titleLocKey}");
}