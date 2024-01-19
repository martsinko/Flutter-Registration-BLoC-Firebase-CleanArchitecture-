import 'package:flutter/material.dart';
import '../../../../core/config/app_config.dart';
import '../widgets/welcome_page_widgets.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

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
          color: colorDarkWhite,
          child: Column(
            children: [
                SizedBox(height: screenHeight * sizedBox1),
                 TitleTextWidget(screenWidth: screenWidth),
                 Subtitle(screenWidth: screenWidth),
                 SizedBox(height: screenHeight / sizedBox2),
                ImageSizedBox(screenWidth: screenWidth, screenHeight: screenHeight),
                SizedBox( height: screenHeight / sizedBox3),
                 AuthButton(screenWidth: screenWidth, screenHeight: screenHeight),
                 SizedBox(height: screenHeight / sizedBox4),
                 RegisterButton(screenWidth: screenWidth, screenHeight: screenHeight)
            ],
          ),
        ) ),
    );
  }
}







