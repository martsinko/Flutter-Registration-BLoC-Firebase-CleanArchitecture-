import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/config/app_config.dart';
import '../pages/sign_up_page.dart';

// ignore: must_be_immutable
class PasswordTextField extends StatelessWidget {
 PasswordTextField({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.passwordFieldKey
  });

  final double screenHeight;
  final double screenWidth;
  final passwordFieldKey;

TextEditingController passwordController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return SizedBox(
       height: screenHeight / 14,
       width: screenWidth * 0.9,
       child: TextField(
        key:  passwordFieldKey,
        onChanged: (text){SignUpPage.password = text;},
        controller: passwordController,
         decoration: InputDecoration(
           hintText: password,
           hintStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
           border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(8)
           )
         ),
       ));
  }
}