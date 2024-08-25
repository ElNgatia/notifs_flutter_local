import 'package:flutter/material.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationDemo extends StatefulWidget {
  const NotificationDemo({super.key, required this.title});
  final String title;

  @override
  State<NotificationDemo> createState() => _NotificationDemoState();
}

class _NotificationDemoState extends State<NotificationDemo> {
  String? _deviceToken;

  @override
  void initState() {
    super.initState();
    _initializeFCM();
  }

  Future<void> _initializeFCM() async {
    // Initialize Firebase
    await Firebase.initializeApp();

    // Request notification permissions
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      _getDeviceToken();
    } else {
      print('User declined or has not accepted permission');
    }
  }

  Future<void> _getDeviceToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();

    setState(() {
      _deviceToken = token;
    });

    if (token != null) {
      // Show notification with the device token
      ElegantNotification.success(
        title: const Text('FCM Token Retrieved'),
        description: Text('Token: $token'),
        action: const Text(
          'Copy',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.blue,
          ),
        ),
        onActionPressed: () {
          // Code to copy the token to the clipboard
          print("Token copied: $token");
        },
      ).show(context);
    }
  }

  void _showInfoNotification() {
    ElegantNotification.info(
      title: const Text('Info Notification'),
      description: const Text('This is an informational notification.'),
      action: const Text(
        'More Info',
        style: TextStyle(
          decoration: TextDecoration.underline,
          color: Colors.blue,
        ),
      ),
      onActionPressed: () {
        print("Info action pressed");
      },
    ).show(context);
  }

  // Other notifications (Success, Error, Warning) omitted for brevity

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Press a button to show a notification'),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: _showInfoNotification,
              child: const Text('Show Info Notification'),
            ),
            SizedBox(height: 20),
            _deviceToken != null
                ? Text('Device Token: $_deviceToken')
                : CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
