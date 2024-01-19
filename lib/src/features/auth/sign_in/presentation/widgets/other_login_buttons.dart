import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/config/app_config.dart';

class OtherLoginButtons extends StatelessWidget {
  const OtherLoginButtons({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.center,
       children: [
         
         SizedBox(
            width: screenWidth / 4,
           height: screenHeight / 16,
           child: OutlinedButton(
             style: OutlinedButton.styleFrom(
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(8)
             )
           ),
             onPressed: (){}, 
           child: Icon(Icons.facebook, size: 35,))),

                 SizedBox(width: screenWidth / 50 ,),
               

         SizedBox(
           width: screenWidth / 4,
           height: screenHeight / 16,
           
           child: OutlinedButton(onPressed: (){}, 
           style: OutlinedButton.styleFrom(
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(8)
             )
           ),
           child: Padding(
             padding: const EdgeInsets.symmetric(vertical: 11),
             child: SvgPicture.asset(icon),
           ),)),
       ],
    );
  }
}
