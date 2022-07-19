// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:push_notification_template/push_notification/push_notification.dart';
import 'second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    PushNotification.instance.init(initScheduled: true);
    listenNotifications();
    PushNotification.instance.showDailyScheludedNotification(
      title: 'Dinner',
      body: 'Today at 6 PM',
      payload: 'dinner_6pm',
      scheduledDate: DateTime.now().add(Duration(seconds: 12)),
    );
  }

  void listenNotifications() => PushNotification.instance.onNotifications.stream
      .listen(onClickedNotification);

  void onClickedNotification(String? payload) =>
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SecondPage(payload: payload),
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _button(
              'Simple Notifications',
              () => PushNotification.instance.showNotification(
                title: 'Sarah Abs',
                body: 'Hey! Do we have everything we need for the lunch',
                payload: 'sarah.abs',
              ),
            ),
            _button(
              'Scheluded Notifications',
              () {
                PushNotification.instance.showScheludedNotification(
                  title: 'dinner',
                  body: 'Today at 6 pm',
                  payload: 'dinner_6pm',
                  scheduledDate: DateTime.now().add(
                    const Duration(seconds: 1),
                  ),
                );
                final snackBar = SnackBar(
                  content: Text(
                    'Scheduled in 1 Seconds',
                    style: TextStyle(fontSize: 24),
                  ),
                );
                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(snackBar);
              },
            ),
            _button(
              'Remove Notifications',
              () {},
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Local Push Notification Template'),
    );
  }

  ElevatedButton _button(
    String text,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
