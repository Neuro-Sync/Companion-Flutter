// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import '../../utils/utilities.dart';

// class NotificationHelper {
//   static AndroidNotificationChannel channel = const AndroidNotificationChannel(
//       'high_importance_channel', 'Hight Importance Notifications',
//       description: 'This channel is used for important notifications.',
//       importance: Importance.high);
//   static Future<void> _firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {
//     await Firebase.initializeApp();
//   }

//   static Future<void> init(
//       FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
//     await Firebase.initializeApp();

//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('me');

//     const DarwinInitializationSettings initializationSettingsIOS =
//         DarwinInitializationSettings(
//       requestSoundPermission: false,
//       requestBadgePermission: false,
//       requestAlertPermission: false,
//     );

//     InitializationSettings initializationSettings =
//         const InitializationSettings(
//             android: initializationSettingsAndroid,
//             iOS: initializationSettingsIOS,
//             macOS: null);

//     flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       // onSelectNotification: (payload) {
//       //   log("payload1: ${payload.toString()}");
//       //   try {
//       //     log("payload: ${payload.toString()}");
//       //   } catch (e) {
//       //     log("Exception: $e");
//       //   }
//       //   return;
//       // },
//     );

//     FirebaseMessaging.onBackgroundMessage(
//         _firebaseMessagingBackgroundHandler); //1

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       // var data = jsonDecode(message.data.toString());
//       // defaultShowToast(
//       //     message: message.data.toString(),
//       //     states: ToastStates.ERORR);

//       // if (message.data.isNotEmpty) {
//       //   Get.to(PostDetials(
//       //     postid: int.parse(message.data["post_id"].toString()),
//       //     userid:int.parse(message.data["user_id"].toString()) ,
//       //   ));
//       // }
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//       if (notification != null && android != null) {
//         flutterLocalNotificationsPlugin.show(
//             notification.hashCode,
//             notification.title,
//             notification.body,
//             NotificationDetails(
//                 android: AndroidNotificationDetails(channel.id, channel.name,
//                     channelDescription: channel.description,
//                     icon: '@mipmap/ic_launcher')));
//       } else if (notification != null && android == null && Platform.isIOS) {
//         var jsdata = json.decode(notification.body!);
//         var body = jsdata["content"];
//         flutterLocalNotificationsPlugin.show(
//             notification.hashCode,
//             notification.title,
//             body,
//             const NotificationDetails(
//                 iOS: DarwinNotificationDetails(
//                     presentAlert: true,
//                     presentBadge: true,
//                     presentSound: true)));
//       }
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//       if (message.data.isNotEmpty) {
//         // Get.to(PostDetials(
//         //   postid: int.parse(message.data["post_id"].toString()),
//         //    userid:int.parse(message.data["user_id"].toString()) ,
//         // ));
//       }
//       defaultShowToast(
//           message: message.data["post_id"].toString(),
//           states: ToastStates.SUCCESS);

//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//       if (notification != null && android != null) {
//         flutterLocalNotificationsPlugin.show(
//             notification.hashCode,
//             notification.title,
//             notification.body,
//             NotificationDetails(
//                 android: AndroidNotificationDetails(channel.id, channel.name,
//                     channelDescription: channel.description,
//                     icon: '@mipmap/ic_launcher')));
//       } else if (notification != null && android == null && Platform.isIOS) {
//         var jsdata = json.decode(notification.body!);
//         var body = jsdata["content"];
//         flutterLocalNotificationsPlugin.show(
//             notification.hashCode,
//             notification.title,
//             body,
//             const NotificationDetails(
//                 iOS: DarwinNotificationDetails(
//                     presentAlert: true,
//                     presentBadge: true,
//                     presentSound: true)));
//       }
//     });
//     await FirebaseMessaging.instance.getInitialMessage();
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//             alert: true, badge: true, sound: true);
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//             alert: true,
//             badge: true, //num of notifications that i received and not read it
//             sound: true); //for ios
//   }
// }
