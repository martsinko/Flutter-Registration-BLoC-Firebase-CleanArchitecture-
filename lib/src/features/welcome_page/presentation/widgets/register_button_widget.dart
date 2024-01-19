import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/config/app_config.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     width: screenWidth * 0.80,
     height: screenHeight / 14,
     child: TextButton(onPressed: (){}, style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      )
     ),  child: Text(registerButton, style: GoogleFonts.montserrat(
      fontSize: screenWidth * 0.052,
      fontWeight: FontWeight.w400, 
      color: colorBlack),)));
  }
}