import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/config/app_config.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: GoogleFonts.montserrat(
      fontSize: screenWidth * 0.08, 
      fontWeight: FontWeight.w700, 
      /*fontStyle: FontStyle.italic,*/ 
      color: colorMedBlack));
  }
}