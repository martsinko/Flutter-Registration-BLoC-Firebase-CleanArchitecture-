import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/sign_up_page.dart';

class ConfirmPasswordTextField extends StatefulWidget {
  final double screenHeight;
  final double screenWidth;

  ConfirmPasswordTextField({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  @override
  _ConfirmPasswordTextFieldState createState() =>
      _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<ConfirmPasswordTextField> {
  bool _passToggle = true;
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.screenWidth * 0.9,
      child: TextFormField(
        validator: (value) {
          if (value != SignUpPage.password) {
            return "Паролі не співпадають";
          }
          if (value!.isEmpty) {
            return "Підтвердження паролю не може бути пустим";
          }
          return null;
        },
        controller: confirmPasswordController,
        obscureText: _passToggle,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _passToggle = !_passToggle;
              });
            },
            icon: Icon(_passToggle ? Icons.visibility : Icons.visibility_off),
          ),
          errorStyle: const TextStyle(color: Colors.red, fontSize: 13.0),
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Підтвердження паролю',
          hintStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
