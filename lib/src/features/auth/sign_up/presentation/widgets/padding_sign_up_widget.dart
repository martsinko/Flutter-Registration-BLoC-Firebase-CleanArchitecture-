import 'package:flutter/material.dart';

import 'sign_up_widgets.dart';


class PaddingSignUpTitle extends StatelessWidget {
  const PaddingSignUpTitle({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidth / 22),
      child: 
    SignUpTitle(screenHeight: screenHeight),);
  }
}