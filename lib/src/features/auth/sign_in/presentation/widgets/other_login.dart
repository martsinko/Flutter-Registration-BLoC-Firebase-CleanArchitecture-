import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/config/components/app_config.dart';

class OtherLogin extends StatelessWidget {
  const OtherLogin({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Expanded(
                child: Container(
    margin: EdgeInsets.only(left: screenWidth / 20),
    child: const Divider(
      color: Colors.black,
      height: 5,
    ),
                ),
              ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: screenWidth / 44),
          child:  Text(otherLogin, style: GoogleFonts.montserrat(fontSize: screenHeight / 60, fontWeight: FontWeight.w500),),
        ),
         Expanded(
                child: Container(
    margin:   EdgeInsets.only(right: screenWidth / 20),
    child: const Divider(
      color: Colors.black,
      height: 36,
    ),
                ),
              ),
      ],
    );
  }
}
