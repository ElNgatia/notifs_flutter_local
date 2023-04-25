import 'package:flutter/material.dart';
import 'package:notifs_flutter/notification.dart';
import 'package:elegant_notification/elegant_notification.dart';

void main() {
  ElegantNotificationState();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifications Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NotificationDemo(title: 'Notifications Demo'),
      debugShowCheckedModeBanner: false,
    );
  }
}


