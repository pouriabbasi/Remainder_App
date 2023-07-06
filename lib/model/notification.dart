import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService extends ChangeNotifier {
  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  //initilize

  Future initialize() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("ic_launcher");

    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings();

    tz.initializeTimeZones();

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: androidInitializationSettings,
            iOS: iosInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future _notificationDetails() async{
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        "channel id",
        "channel name",
        channelDescription: "channel description",
        importance: Importance.high,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  Future showScheduledNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required DateTime scheduledDate,
  })async =>_notifications.zonedSchedule(
    id, 
    title, 
    body, 
    tz.TZDateTime.from(scheduledDate, tz.local),
    await _notificationDetails(),
    payload: payload,
  androidAllowWhileIdle: true,
  uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);

  //Instant Notifications
//   Future instantNofitication() async {
//     var android = AndroidNotificationDetails("id", "channel",channelDescription: "description");
//
//     var ios = IOSNotificationDetails();
//
//     var platform = new NotificationDetails(android: android, iOS: ios);
//
//     await _flutterLocalNotificationsPlugin.show(
//         0, "Demo instant notification", "Tap to do something", platform,
//         payload: "Welcome to demo app");
//   }
//
//   //Image notification
//   Future imageNotification() async {
//     var bigPicture = BigPictureStyleInformation(
//         DrawableResourceAndroidBitmap("ic_launcher"),
//         largeIcon: DrawableResourceAndroidBitmap("ic_launcher"),
//         contentTitle: "Demo image notification",
//         summaryText: "This is some text",
//         htmlFormatContent: true,
//         htmlFormatContentTitle: true);
//
//     var android = AndroidNotificationDetails("id", "channel", channelDescription: "description",
//         styleInformation: bigPicture);
//
//     var platform = new NotificationDetails(android: android);
//
//     await _flutterLocalNotificationsPlugin.show(
//         0, "Demo Image notification", "Tap to do something", platform,
//         payload: "Welcome to demo app");
//   }
//
//   //Stylish Notification
//   Future stylishNotification() async {
//     var android = AndroidNotificationDetails("id", "channel", channelDescription: "description",
//         color: Colors.deepOrange,
//         enableLights: true,
//         enableVibration: true,
//         largeIcon: DrawableResourceAndroidBitmap("ic_launcher"),
//         styleInformation: MediaStyleInformation(
//             htmlFormatContent: true, htmlFormatTitle: true));
//
//     var platform = new NotificationDetails(android: android);
//
//     await _flutterLocalNotificationsPlugin.show(
//         0, "Demo Stylish notification", "Tap to do something", platform);
//   }
//
//   //Sheduled Notification
//
//   Future sheduledNotification() async {
//     var interval = RepeatInterval.everyMinute;
//     var bigPicture = BigPictureStyleInformation(
//         DrawableResourceAndroidBitmap("ic_launcher"),
//         largeIcon: DrawableResourceAndroidBitmap("ic_launcher"),
//         contentTitle: "Demo image notification",
//         summaryText: "This is some text",
//         htmlFormatContent: true,
//         htmlFormatContentTitle: true);
//
//     var android = AndroidNotificationDetails("id", "channel", channelDescription: "description",
//         styleInformation: bigPicture);
//
//     var platform = new NotificationDetails(android: android);
//
//     await _flutterLocalNotificationsPlugin.periodicallyShow(
//         0,
//         "Demo Sheduled notification",
//         "Tap to do something",
//         interval,
//         platform);
//   }
//
//   //Cancel notification
//
//   Future cancelNotification() async {
//     await _flutterLocalNotificationsPlugin.cancelAll();
//   }
}
