import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications{
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context){

    final InitializationSettings initializationSettings=InitializationSettings(android: AndroidInitializationSettings('@drawable/mylogoo'));

    _flutterLocalNotificationsPlugin.initialize(initializationSettings,onSelectNotification: (String? route)async{
      Navigator.of(context).pushNamed(route!);
    });
  }

  static void display(RemoteMessage message)async {
    try {

      var random = Random(); //
      int value=(pow(2, 32)-1).toInt();// keep this somewhere in a static variable. Just make sure to initialize only once.
      int id = random.nextInt(value);


      NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
            'eshop', 'eshop channel', 'eshop Channel',
            importance: Importance.max, priority: Priority.high),
      );

      await _flutterLocalNotificationsPlugin.show(
          id, message.notification!.title, message.notification!.body,
          notificationDetails,payload: message.data['route']);
    }catch(e){print(e.toString());}
  }

}