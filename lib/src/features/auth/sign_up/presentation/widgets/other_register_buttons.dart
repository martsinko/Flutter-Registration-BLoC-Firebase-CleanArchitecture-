import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_identificator/src/features/auth/sign_in/domain/repositories/login_repository.dart';
import 'package:smart_identificator/src/features/student_home/presentation/pages/navigation_bar_pages/navigator_bar_page.dart';
import 'package:smart_identificator/src/features/student_home/presentation/pages/navigation_bar_pages/repositories/info_repository.dart';
import '../../../../../core/config/components/app_config.dart';
import '../../../auth_user/repositories/auth_repository.dart';

class OtherRegisterButtons extends StatelessWidget {
  const OtherRegisterButtons({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
     required this.authRepository, 
     required this.exUserRepository, 
     required this.infoRepository,
  });
   final InfoRepository infoRepository;
  final ExUserRepository exUserRepository;
    final AuthRepository authRepository;
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
             onPressed: () async{
                 try {
              UserCredential userCredential = await authRepository.signInWithFacebook();
              User? user = userCredential.user;
              if (user != null) {
                Navigator.pushReplacementNamed(context, '/nav_bar_page');
                print('Успішна авторизація: ${user.email}');
              }
            } catch (e) {
              print('Помилка авторизації: $e');
            }
             }, 
           child: Icon(Icons.facebook, size: 35,))),

                 SizedBox(width: screenWidth / 50 ,),
               

         SizedBox(
           width: screenWidth / 4,
           height: screenHeight / 16,
           
           child: OutlinedButton(onPressed: () async{
             await authRepository.signInWithGoogle();
           }, 
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