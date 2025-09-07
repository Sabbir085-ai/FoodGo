import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodgo/models/user_model.dart';
//import 'package:foodgo/models/user_model.dart';
import 'package:foodgo/services/auth_services.dart';
import 'package:foodgo/view/home_screen.dart';
import 'package:foodgo/view/profile_screen.dart';
import 'package:foodgo/view/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';

class AuthController extends GetxController {
  // Auth Services
  final AuthServices _authServices = AuthServices();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Loading State
  var isLoading = false.obs;

  var isProfileLading = false.obs;

  Rxn<UserModel> currentUser = Rxn<UserModel>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  // Signup Function
  Future<void> signup() async {
    try {
      isLoading.value = true;
      User? user = await _authServices.signUp(
        emailController.text,
        passwordController.text,
        firstNameController.text,
        lastNameController.text,
        addressController.text,
      );
      if (user != null) {
        Get.snackbar(
          "Success",
          "User registration Successfully ",
          backgroundColor: Colors.grey,
          colorText: Colors.white,
        );
      }

      log("${user?.email}");

      Get.offAll(HomeScreen(), transition: Transition.noTransition);

      isLoading.value = false;
    } catch (abir) {
      isLoading.value = false;
      // ignore: unnecessary_string_interpolations
      Get.snackbar("Error", "${abir.toString()}");
    }
  }

  // Login Function

  Future<void> signIn() async {
    try {
      isLoading.value = true;
      User? user = await _authServices.signIn(
        emailController.text,
        passwordController.text,
      );

      Get.snackbar(
        "Success",
        "User Login Successfully",
        backgroundColor: Colors.grey,
        colorText: Colors.white,
      );

      log("${user?.email}");

      Get.offAll(ProfileScreen(), transition: Transition.noTransition);
      isLoading.value = false;
      // ignore: empty_catches
    } catch (exception) {}
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   if (firebaseAuth.currentUser != null) {
  //     WidgetsBinding.instance.addPostFrameCallback((_) {
  //       Get.offAll(HomeScreen(), transition: Transition.noTransition);
  //     });
  //   }
  // }

  Future<void> fatchUserProfile() async {
    try {
      isProfileLading.value = true;

      UserModel? userModel = await _authServices.GetUserProfile();

      if (userModel != null) {
        currentUser.value = userModel;
      }
    } catch (e) {
      throw Exception("Profile Data is not found");
    }
  }

  Future SignOut() async {
    await _authServices.signOut();
    Get.snackbar("Success", "User LogOut Successfully");
    Get.off(SplashScreen(),transition: Transition.noTransition);
  }
}
