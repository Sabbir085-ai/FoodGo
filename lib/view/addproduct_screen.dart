
import 'package:flutter/material.dart';

class AddproductScreen extends StatelessWidget {
  const AddproductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.red,
        title: Text('Add Product Screen ',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
      ),
    );
  }
}