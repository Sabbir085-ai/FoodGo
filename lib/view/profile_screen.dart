import 'package:flutter/material.dart';
import 'package:foodgo/controller/auth_controller.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<AuthController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AuthController());
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, left: 8.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Edit Profile
            Container(
              height: 70,
              width: 165,
              decoration: BoxDecoration(
                color: const Color(0xff3C2F2F),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset("assets/images/edit.png"),
                ],
              ),
            ),
            // Logout
            GestureDetector(
              onTap: () {
                controller.SignOut();
              },
              child: Container(
                height: 70,
                width: 165,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFfc8089), Color(0xFFef2a39)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Obx(() {
          if (controller.isProfileLading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {

            controller.firstNameController.text=controller.currentUser.value?.firstName??"";
            controller.lastNameController.text=controller.currentUser.value?.lastName??"";
            controller.emailController.text=controller.currentUser.value?.email??"";
            controller.addressController.text=controller.currentUser.value?.address??"";

            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 48.0),
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.arrow_back),
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            // Get.to(SettingScreen())
                          },
                          icon: const Icon(Icons.settings),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 120.0),
                    child: Container(
                      width: double.infinity,
                      height: 781,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35.0),
                          topRight: Radius.circular(35.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            _textField("Enter your first name", controller.firstNameController),
                            _textField("Enter your last name", controller.lastNameController),
                            _textField("Enter your email", controller.emailController),
                            _textField("Enter your address", controller.addressController),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }

  Widget _textField(String hint, TextEditingController textEditingcontroller, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: textEditingcontroller,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          labelText: hint,
        ),
      ),
    );
  }
}
