import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/sign_up_page.dart';

class PasswordTextField extends StatefulWidget {
  final double screenHeight;
  final double screenWidth;

  PasswordTextField({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {

  bool passToogle = true;
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.screenWidth * 0.9,
      child: TextFormField(
        validator: (value) {
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
        onChanged: (password) {
          SignUpPage.password = password;
        },
        controller: passwordController,
        obscureText: passToogle,
        decoration: InputDecoration(
          suffixIcon: IconButton(onPressed: (){
              setState(() {
                 passToogle = !passToogle;
              });
          }, icon: Icon(passToogle ? Icons.visibility : Icons.visibility_off)
          ),
        
          errorStyle: TextStyle(color: Colors.red, fontSize: 13.0),
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Пароль',
          hintStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
