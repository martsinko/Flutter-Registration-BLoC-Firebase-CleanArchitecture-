import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/config/app_config.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Text(titleSignUp, style:  GoogleFonts.montserrat(fontSize: screenHeight / 32, fontWeight: FontWeight.w800, color: colorCustomBlack),);
  }
}