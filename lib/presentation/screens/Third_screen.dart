import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key, required this.title, required this.bgColor})
      : super(key: key);

  final String title;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: bgColor, body: Container());
  }
}
