import 'package:flutter/material.dart';
import 'back_button_widget.dart';

class Padding_ButtonBack extends StatelessWidget {
  const Padding_ButtonBack({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: screenWidth / 22),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: ButtonBack(screenWidth: screenWidth, screenHeight: screenHeight)),
    );
  }
}