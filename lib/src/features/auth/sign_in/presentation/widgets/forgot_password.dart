import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/config/app_config.dart';
class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    // ignore: sort_child_properties_last
    return Align(child: TextButton(onPressed: (){}, child: Padding(
      padding:  EdgeInsets.only(right: screenWidth / 34),
      child: Text(forgotPassword, style: GoogleFonts.montserrat(color: colorCustomBlack, fontWeight: FontWeight.w500),),
    )), alignment: Alignment.centerRight,);
  }
}