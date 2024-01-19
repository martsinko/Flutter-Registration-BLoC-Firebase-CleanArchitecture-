import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/pages/sign_up_page.dart';
import '../../../../../core/config/app_config.dart';

// ignore: must_be_immutable
class RegisterButton extends StatelessWidget {
  RegisterButton({
    super.key,

    required this.screenWidth,
    required this.screenHeight,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final double screenWidth;
  final double screenHeight;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.90,
      height: screenHeight / 14,
      child: TextButton(
        onPressed: () {  
          emailController.clear();
          passwordController.clear();
          BlocProvider.of<SignUpBloc>(context).add(SignUpButtonPressed(
            email: SignUpPage.email, 
            password: SignUpPage.password));
          print('Значення передані: ${SignUpPage.email}');
        },
        style: TextButton.styleFrom(
          backgroundColor: colorCustomBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          registerButton,
          style: GoogleFonts.montserrat(
            fontSize: screenWidth / 22,
            fontWeight: FontWeight.w400,
            color: colorWhite,
          ),
        ),
      ),
    );
  }
}
