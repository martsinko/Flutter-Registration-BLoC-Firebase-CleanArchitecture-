
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/config/components/app_config.dart';
import '../bloc/sign_in_bloc.dart';
import '../pages/sing_in_page.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.keyForm,
    required this.emailLogController,
    required this.passwordLogController,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;
  final GlobalKey<FormState> keyForm;
    final TextEditingController emailLogController;
  final TextEditingController passwordLogController;




  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.90,
      height: screenHeight / 14,
      child: TextButton(onPressed: (){
      if(keyForm.currentState!.validate())  {   
             Text('Зареєстровано');
          }
        BlocProvider.of<SignInBloc>(context).add(SignInButtonPressed(email: SignInPage.emailLog, password: SignInPage.passwordLog));
        //Navigator.pushReplacementNamed(context, '/student_home');
      }, style: TextButton.styleFrom(
        backgroundColor: colorCustomBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        )
      ), child: Text(loginButton, 
      style: GoogleFonts.montserrat(
        fontSize: screenWidth / 22, 
          fontWeight: FontWeight.w400, 
            color: colorWhite),)));
  }
}