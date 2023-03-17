import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttersocial_app/Provider/newsprovider.dart';
import 'package:fluttersocial_app/firebase_options.dart';
import 'package:fluttersocial_app/splash_screen/indroductionscreen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("News_App");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   //FlutterNativeSplash.removeAfter(initialization);
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Intro1()
    );
  }
}
