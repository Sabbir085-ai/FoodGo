import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,
                child: Row(
                  children: [
                    IconButton(onPressed: (){
                      Get.back();
                    }, icon: Icon(Icons.arrow_back),color: Colors.white,),
                    Spacer(),
                    IconButton(onPressed: (){}, icon: Icon(Icons.settings),color: Colors.white),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
