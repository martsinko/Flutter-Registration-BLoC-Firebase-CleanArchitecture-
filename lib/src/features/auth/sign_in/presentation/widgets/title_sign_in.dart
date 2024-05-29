import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/config/components/app_config.dart';
class SignInTitle extends StatelessWidget {
  const SignInTitle({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Text(titleSignIn, style:  GoogleFonts.montserrat(fontSize: screenHeight / 32, fontWeight: FontWeight.w800, color: colorCustomBlack),);
  }
}