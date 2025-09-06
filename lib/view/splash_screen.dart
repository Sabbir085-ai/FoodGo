import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodgo/view/home_screen.dart';
import 'package:foodgo/view/profile_screen.dart';
//import 'package:foodgo/view/profile_screen.dart';
import 'package:foodgo/view/signup_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // ৪ সেকেন্ড পরে লগইন স্ট্যাটাস চেক করো
    Future.delayed(Duration(seconds: 4), () {
      if (mounted) {
        checkLoginStatus();
      }
    });
  }

  void checkLoginStatus() {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      Get.offAll(() => ProfileScreen(), transition: Transition.noTransition);
    } else {
      Get.offAll(() => SignupScreens(), transition: Transition.noTransition);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFfc8089), Color(0xFFef2a39)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 582,
                  child: Center(
                    child: Text(
                      "FoodGo",
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: -25,
              left: -25,
              child: Image.asset(
                "assets/images/image 2.png",
                width: 246,
                height: 288,
              ),
            ),
            Positioned(
              bottom: -15,
              left: 75,
              child: Image.asset(
                "assets/images/image 1.png",
                width: 202,
                height: 202,
              ),
            ),
          ],
        ),
      ),
    );
  }
}