import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/config/app_config.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.90,
      height: screenHeight / 14,
      child: TextButton(onPressed: (){}, style: TextButton.styleFrom(
        backgroundColor: colorCustomBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        )
      ), child: Text(loginButton, 
      style: GoogleFonts.montserrat(
        fontSize: screenWidth / 22, 
          fontWeight: FontWeight.w400, 
            color: colorWhite),)));
  }
}