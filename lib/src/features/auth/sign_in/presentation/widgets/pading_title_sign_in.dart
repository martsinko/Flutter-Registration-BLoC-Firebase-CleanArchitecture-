import 'package:flutter/material.dart';
import 'title_sign_in.dart';

class Padding_TitleSignIn extends StatelessWidget {
  const Padding_TitleSignIn({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidth / 20),
      child: 
      SignInTitle(screenHeight: screenHeight), 
    );
  }
}