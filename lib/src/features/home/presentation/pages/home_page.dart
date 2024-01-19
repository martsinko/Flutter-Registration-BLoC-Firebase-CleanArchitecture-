import 'package:flutter/material.dart';

import '../../../../core/config/app_config.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
         child: Column(
           children: [
            SizedBox(
      width: screenWidth * 0.108,
      height: screenHeight / 20,
      child: OutlinedButton(onPressed: (){
      }, 
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13)
        )
      ),
      child: const Icon(Icons.arrow_back_ios, color: colorBlack,) )),
             Container(
              child: Center(child: const Text('Користувач зареєстрований')),
             ),
           ],
         ),
      ),
    );
  }
}