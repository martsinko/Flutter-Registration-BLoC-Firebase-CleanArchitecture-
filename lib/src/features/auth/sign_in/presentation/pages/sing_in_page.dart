import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/config/app_config.dart';
import '../widgets/sign_in_widgets.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignInPage> {
bool _obscureText = false;
  @override 
    void initState(){ 
      super.initState(); 
      _obscureText = true; 
    }     
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    

    return Scaffold(
      backgroundColor: colorDarkWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
                  SizedBox(height: screenHeight / signBox1),
                  Padding_ButtonBack(screenWidth: screenWidth, screenHeight: screenHeight),
                  SizedBox(height: screenHeight / signBox2,),
                  Padding_TitleSignIn(screenWidth: screenWidth, screenHeight: screenHeight),
                  SizedBox(height: screenHeight / signBox3,),                                
                  EmailTextField(screenHeight: screenHeight, screenWidth: screenWidth),
                  SizedBox(height: screenHeight / signBox4,),

                  SizedBox(
       height: screenHeight / 14,
       width: screenWidth * 0.9,

       child: TextField(
        obscureText: _obscureText,
        
         decoration: InputDecoration(
          suffixIcon: IconButton( onPressed: (){
            setState(() {
              _obscureText = !_obscureText;
            });
          },icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off)),
           hintText: password,
           hintStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
           border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(8)
           )
         ),
       )),

                  ForgotPassword(screenWidth: screenWidth),
                  SizedBox(height: screenHeight / 60,),
                  LoginButton(screenWidth: screenWidth, screenHeight: screenHeight),
                   SizedBox(height: screenHeight / signBox7),
                  OtherLogin(screenWidth: screenWidth, screenHeight: screenHeight),
                  OtherLoginButtons(screenWidth: screenWidth, screenHeight: screenHeight),
                  SizedBox(height: screenHeight / signBox9,),
                  HaventAccWidgets(screenWidth: screenWidth)
            ],
          ),
        ) 
      ),
    );
  }
}





































