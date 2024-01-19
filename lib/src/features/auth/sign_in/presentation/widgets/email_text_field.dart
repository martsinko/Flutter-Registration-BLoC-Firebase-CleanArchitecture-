import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/config/app_config.dart';
class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight / 14,
      width: screenWidth * 0.900,
      child: TextField(
        decoration: InputDecoration(
          hintText: email,
          hintStyle: GoogleFonts.montserrat(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8)
          )
        ),
      ));
  }
}