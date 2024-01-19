import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/pages/sign_up_page.dart';
import '../../../../../core/config/app_config.dart';

// ignore: must_be_immutable
class EmailTextField extends StatelessWidget {
   EmailTextField({
    super.key,
    required this.emailFieldKey,
    required this.screenHeight,
    required this.screenWidth,

  });

  final double screenHeight;
  final double screenWidth;
  final Key emailFieldKey;

 TextEditingController emailController = TextEditingController();
  
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight / 14,
      width: screenWidth * 0.900,
      child: TextField(
        key: emailFieldKey,
        onChanged: (text){SignUpPage.email = text;},
        controller: emailController,
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