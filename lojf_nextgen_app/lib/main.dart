import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lojf_nextgen_app/ui/home.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDtEL6Pg5yTPAsODNvuQMssxWGLKtfdwxc',
      appId: '1:1033223373491:android:aa570a6abef6d33f5ae6c6',
      messagingSenderId: '1033223373491',
      projectId: 'lojf-8bb9b',
      storageBucket: 'lojf-8bb9b.appspot.com',
    ),
  );

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDtEL6Pg5yTPAsODNvuQMssxWGLKtfdwxc',
      appId: '1:1033223373491:android:aa570a6abef6d33f5ae6c6',
      messagingSenderId: '1033223373491',
      projectId: 'lojf-8bb9b',
      storageBucket: 'lojf-8bb9b.appspot.com',
    ),
  );
  runApp(const HomeLojfNextGen());
}

class HomeLojfNextGen extends StatelessWidget {
  const HomeLojfNextGen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOJF Nextgen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black54),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
