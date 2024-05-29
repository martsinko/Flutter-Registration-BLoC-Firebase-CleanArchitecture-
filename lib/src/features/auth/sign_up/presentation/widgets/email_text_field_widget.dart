import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/pages/sign_up_page.dart';
import '../../../../../core/config/components/app_config.dart';

// ignore: must_be_immutable
class EmailTextField extends StatelessWidget {
   EmailTextField({
    super.key,
    required this.screenHeight,
    required this.screenWidth,

  });

  final double screenHeight;
  final double screenWidth;

 TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.900,
      child: TextFormField(
        
        onChanged: (text)
        {SignUpPage.email = text;},
        controller: emailController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          
          hintText: email,errorStyle: TextStyle(color: Colors.red, fontSize: 13.0),
          hintStyle: GoogleFonts.montserrat(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8)
          )
        ),
        validator: (value){
            if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)){
             return "Введіть коректну пошту";// Text('Введіть коректну дату');
                
            } else{
              return null;
            }
        },
      ));
  }
}