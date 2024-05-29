import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/pages/sign_up_page.dart';

import '../../../../../core/config/components/app_config.dart';
import '../pages/sing_in_page.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  const PasswordTextFieldWidget({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.passwordLogController,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;
  final TextEditingController passwordLogController;

  @override
  _PasswordTextFieldWidgetState createState() => _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {


  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.screenWidth * 0.9,
      child: TextFormField(
        onChanged: (value) {
          SignInPage.passwordLog = value;
        },
        validator:  (value) {

          if(value != SignInPage.passwordLog){
                return "Неправильний пароль";
            }
          
          if (value!.isEmpty) {
            return "Пароль не може бути порожнім";
          }
          if (value.length < 6) {
            return "Пароль повинен містити принаймні 6 символів";
          }
          if (!RegExp(r'^(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$')
              .hasMatch(value)) {
            return "Пароль повинен містити принаймні одну цифру та \nодин спеціальний символ";
          }
          return null;
        },
  
        controller: widget.passwordLogController,
        obscureText: passwordVisible,
        decoration: InputDecoration(
          errorStyle: TextStyle(color: Colors.red, fontSize: 13.0),
          contentPadding: EdgeInsets.all(16),
          hintText: password,
          hintStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
            icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
          ),
        ),
      ),
    );
  }
}
