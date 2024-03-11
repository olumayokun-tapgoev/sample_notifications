import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sample_notifications/api/firebase_api.dart';
import 'package:sample_notifications/pages/home_screen.dart';
import 'package:sample_notifications/pages/notification_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Push Notifications',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 40))),
      navigatorKey: navigatorKey,
      home: const HomeScreen(),
      routes: {
        NotificationScreen.route: (context) => const NotificationScreen()
      },
    );
  }
}
