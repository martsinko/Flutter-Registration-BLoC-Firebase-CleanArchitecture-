import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_identificator/src/features/auth/sign_in/presentation/pages/admin_sign_in_page.dart';
import '../../../../core/config/components/app_config.dart';
import '../../../auth/auth_user/repositories/auth_repository.dart';
import '../widgets/welcome_page_widgets.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key,});


  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  

  @override
  Widget build(BuildContext context) {
    
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return  Scaffold(
      body: SafeArea(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          color: colorDarkWhite,
          child: Column(
            children: [
                SizedBox(height: screenHeight * sizedBox1),
                 TitleTextWidget(screenWidth: screenWidth),
                 Subtitle(screenWidth: screenWidth),
                 SizedBox(height: screenHeight / sizedBox2),
                ImageSizedBox(screenWidth: screenWidth, screenHeight: screenHeight),
                SizedBox( height: screenHeight / 500),
                 AuthButton(screenWidth: screenWidth, screenHeight: screenHeight),
                 SizedBox(height: screenHeight / 100),
                 SizedBox(
     width: screenWidth * 0.800,
     height: screenHeight / 14,
     child: TextButton(onPressed: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AdminSignInPage()));
     // Navigator.pushReplacementNamed(context, '/sign_in_page');
     }, style: ElevatedButton.styleFrom(
      backgroundColor: colorCustomBlack,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      )
     ), 
     child: Text('Авторизуватись як адмін', style: GoogleFonts.montserrat(fontSize: screenWidth * 0.052, 
     fontWeight: FontWeight.w400, 
     color: colorWhite),))),
                 SizedBox(height: screenHeight / sizedBox4),
                 RegisterButton(screenWidth: screenWidth, screenHeight: screenHeight)
            ],
          ),
        ) ),
    );
  }
}







