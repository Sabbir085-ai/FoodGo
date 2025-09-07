import 'package:flutter/material.dart';
import 'package:foodgo/view/addproduct_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => const AddproductScreen(), // ✅ eta ekdom correct way
            transition: Transition.leftToRight, // ✅ transition named argument
          );
        },
        // ignore: sort_child_properties_last
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.red,
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Home Screen',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
