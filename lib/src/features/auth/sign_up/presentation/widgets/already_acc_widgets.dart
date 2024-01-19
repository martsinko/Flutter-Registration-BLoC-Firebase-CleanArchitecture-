import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/config/app_config.dart';

class AlreadyAccTextandTextButton extends StatelessWidget {
  const AlreadyAccTextandTextButton({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(alreadyAcc, style: GoogleFonts.montserrat(fontSize: screenWidth / 26, fontWeight: FontWeight.w500),),
      TextButton(onPressed: (){}, child:  Text(loginNow, style: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: screenWidth / 25, color: colorLoginNow),))
    ],
                 );
  }
}