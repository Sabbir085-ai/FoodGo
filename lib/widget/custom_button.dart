import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback onTab;
  const CustomButton({super.key, this.text, required this.onTab, required MaterialColor bgColor, required Color textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18),
        child: Container(
          alignment: Alignment.center,
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
          color: Colors.white

          ),
          child: Text(
            "${text}",
            style: TextStyle(fontSize: 18, color: Color(0XFFef2a39)),
          ),
        ),
      ),
    );
  }
}