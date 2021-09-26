import 'dart:async';

import 'package:eshopapp/Screens/notications_view.dart';
import 'package:eshopapp/core/view_model/cart_view_model.dart';
import 'package:eshopapp/core/view_model/checkout_view_model.dart';
import 'package:eshopapp/Screens/checkout_view.dart';
import 'package:eshopapp/Screens/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/service/Notifications.dart';
import 'helper/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartViewModel());
  Get.put(CheckOutViewModel());
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    LocalNotifications.initialize(context);
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if(message!=null){
        final routeFromMessage=message.data['route'];
        Navigator.of(context).pushNamed(routeFromMessage);
      }
    });
    FirebaseMessaging.onMessage.listen((message) {
      if(message.notification!=null){
        print(message.notification!.body);
      }
      LocalNotifications.display(message);

    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage=message.data['route'];
      Navigator.of(context).pushNamed(routeFromMessage);
      print(routeFromMessage);
    });
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: Scaffold(
        body: SplashScreen(),
      ),
      routes: {
        'notification':(_)=>NotificationsView()
      },
      theme: ThemeData(
        fontFamily: 'SourceSans',
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.of(context)
          .pushReplacement(
          MaterialPageRoute(builder: (context) => ControlView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: MediaQuery
          .of(context)
          .size
          .width, height: MediaQuery
          .of(context)
          .size
          .height, child: Image.asset('images/Content.png', fit: BoxFit.fill,)),
    );
  }
}

Future backgroundHandler(RemoteMessage message)async{
  print(message.data.toString());
  print(message.notification!.title);
}
