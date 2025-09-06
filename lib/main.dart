import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodgo/view/profile_screen.dart';
import 'package:foodgo/view/login_screen.dart';
import 'package:foodgo/view/login_screen.dart';
import 'package:foodgo/view/signup_screen.dart';
import 'package:foodgo/view/splash_screen.dart';
import 'package:foodgo/view/signup_screens.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodGo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      //home: SplashScreen(),
       home: ProfileScreen(),
    );
  }
}