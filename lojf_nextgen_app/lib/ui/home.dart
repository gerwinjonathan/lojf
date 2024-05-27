import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int? index = 0;

  @override
  void initState() {
    super.initState();
    setupNotification();
    initForegroundMsg();
    index = 0;
  }

  setupNotification() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    String? test = await messaging.getToken();

    print('User granted permission: ${settings.authorizationStatus}');
    print('Get Token ${test}');
  }

  initForegroundMsg() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "LOJF NextGen",
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "Coming Soon",
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index!,
        destinations: [
          NavigationDestination(
            icon: Icon(
              FontAwesomeIcons.house,
            ),
            label: "Home",
            selectedIcon: Icon(
              FontAwesomeIcons.house,
            ),
          ),
          NavigationDestination(
            icon: Icon(
              FontAwesomeIcons.house,
            ),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(
              FontAwesomeIcons.house,
            ),
            label: "Home",
          ),
        ],
        onDestinationSelected: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
