import 'package:flutter/material.dart';
import 'package:loginsignup/widget/texts/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomText(text: "Home Screen"),),
    );
  }
}