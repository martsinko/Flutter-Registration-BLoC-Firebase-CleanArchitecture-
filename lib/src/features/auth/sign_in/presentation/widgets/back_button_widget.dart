import 'package:flutter/material.dart';
import '../../../../../core/config/components/app_config.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.108,
      height: screenHeight / 20,
      child: OutlinedButton(onPressed: (){
        
      }, 
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13)
        )
      ),
      child: const Icon(Icons.arrow_back_ios, color: colorBlack,) ));
  }
}