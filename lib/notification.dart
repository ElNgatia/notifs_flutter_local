import 'package:flutter/material.dart';
import 'package:elegant_notification/elegant_notification.dart';

class NotificationDemo extends StatefulWidget {
  const NotificationDemo({super.key, required this.title});
  final String title;

  @override
  State<NotificationDemo> createState() => _NotificationDemoState();
}

class _NotificationDemoState extends State<NotificationDemo> {
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
            const Text(
              'Press to show notification',
            ),
            OutlinedButton(
              onPressed: () {
                ElegantNotification.info(
                  description: const Text('Test Notification'),
                  action: const Text(
                    'Link',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                    ),
                  ),
                  onActionPressed: () {
                    // ignore: avoid_print
                    
                  },
                ).show(context);
              },
              child: const Text(
                'Show Notification',
              ),
            )
          ],
        ),
      ),
    );
  }
}
