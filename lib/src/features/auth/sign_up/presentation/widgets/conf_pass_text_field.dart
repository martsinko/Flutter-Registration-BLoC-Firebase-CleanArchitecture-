import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/config/app_config.dart';

// ignore: must_be_immutable
class ConfirmPasswordTextField extends StatelessWidget {
 ConfirmPasswordTextField({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

 TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
       height: screenHeight / 14,
       width: screenWidth * 0.9,
       child: TextField(
        controller: confirmPasswordController,
         decoration: InputDecoration(
           hintText: passwordConfirm,
           hintStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
           border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(8)
           )
         ),
       ));
  }
}