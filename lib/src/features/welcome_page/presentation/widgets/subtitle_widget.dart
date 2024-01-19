import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/config/app_config.dart';

class Subtitle extends StatelessWidget {
  const Subtitle({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Text(subtitle, style: GoogleFonts.russoOne(
      fontSize: screenWidth * 0.082, 
      fontWeight: FontWeight.w900, 
      /*fontStyle: FontStyle.italic,*/ 
      color: colorCustomBlack,),);
  }
}
// russoOne