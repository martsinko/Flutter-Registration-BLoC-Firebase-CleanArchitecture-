import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/config/components/app_config.dart';

class HaventAccWidgets extends StatelessWidget {
  const HaventAccWidgets({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(haventAcc, style: GoogleFonts.montserrat(fontSize: screenWidth / 28, fontWeight: FontWeight.w500),),
      TextButton(onPressed: (){
        Navigator.pushReplacementNamed(context, '/sign_up_page');
      }, child:  Text(registerNow, style: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: screenWidth /30, color: colorLoginNow),))
    ],
                 );
  }
}