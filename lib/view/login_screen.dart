import 'package:flutter/material.dart';
import 'package:foodgo/controller/auth_controller.dart';
import 'package:foodgo/widget/custom_button.dart';
import 'package:get/get.dart';


class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AuthController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(0.7),
        title: Text(
          "Login Screen",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0XFFfc8089), Color(0XFFef2a39)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _textField("Enter your email", controller.emailController),
                _textField(
                  "Enter your password",
                  controller.passwordController,
                  isPassword: true,
                ),

                SizedBox(height: 20),

                Obx(() {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return CustomButton(
                      onTab: () {
                        controller.signIn();
                      },
                      text: "Login",
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textField(
    String hint,
    TextEditingController textEditingcontroller, {
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,

        child: Padding(
          padding: EdgeInsets.all(15),
          child: TextField(
            controller: textEditingcontroller,
            obscureText: isPassword,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: hint,
            ),
          ),
        ),
      ),
    );
  }
}