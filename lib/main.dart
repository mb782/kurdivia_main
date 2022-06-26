import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kurdivia/Screen/login_1.dart';
import 'package:kurdivia/Screen/mainpage.dart';
import 'package:kurdivia/Screen/winners.dart';
import 'package:kurdivia/Widgets/navigatebar.dart';
import 'package:kurdivia/constant.dart';
import 'package:kurdivia/provider/ApiService.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


import 'Screen/questioncard.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (
          int id,
          String? title,
          String? body,
          String? payload,
          ) async {});
  var initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) async {
        if (payload != null) {
          debugPrint('notification payload: $payload');
        }
      });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApiService(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loggedIn = false;

  @override
  void initState() {
    // bool login = context.read<ApiService>().checkLogin();
    // Timer.periodic(const Duration(seconds: 3), (timer) {
    //   if (login) {
    //     Provider.of<ApiService>(context, listen: false).InfoUser();
    //     kNavigator(context, const NavigateBar());
    //   } else {
    //     kNavigator(context, FirstPage());
    //   }
    //   timer.cancel();
    // });
    bool login = context.read<ApiService>().checkLogin();
    if (login) {
      Provider.of<ApiService>(context, listen: false).InfoUser();
      loggedIn = true;
    } else {
      loggedIn = false;
    }
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => (loggedIn) ? NavigateBar() : FirstPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kDarkBlue,
        body: Center(
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: const Text(
                'Quiz App',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
        ));
  }
}
