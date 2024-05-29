import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_identificator/src/features/auth/sign_in/presentation/pages/sing_in_page.dart';

import '../../../../../core/config/components/app_config.dart';
class EmailTextField extends StatelessWidget {
   EmailTextField({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  TextEditingController emailLogController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.900,
      child: TextFormField(
        validator: (value){
            if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)){
             return "Введіть коректну пошту";// Text('Введіть коректну дату');
                
            } else{
              return null;
            }
        },
        onChanged: (text){SignInPage.emailLog = text;},
        controller: emailLogController,
        decoration: InputDecoration(
          errorStyle: TextStyle(color: Colors.red, fontSize: 13.0),
          contentPadding: EdgeInsets.all(16),
          hintText: email,
          hintStyle: GoogleFonts.montserrat(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8)
          )
        ),
      ));
  }
}