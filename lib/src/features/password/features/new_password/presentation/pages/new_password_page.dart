import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../firebase_options.dart';
import '../../../../../../core/config/components/app_config.dart';
import '../../../../../auth/sign_up/presentation/pages/sign_up_page.dart';
import '../../repositories/new_password_repo.dart';

class NewPasswordPage extends StatefulWidget {
  
  final NewPasswordRepository newPasswordRepository;
  const NewPasswordPage({super.key, 
  required this.newPasswordRepository});


  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState(); 
  
}
class _NewPasswordPageState extends State<NewPasswordPage> {


  Future passwordReset() async{
    try{
        await FirebaseAuth.instance.sendPasswordResetEmail(email: newEmailController.text.trim());
        showDialog(
          context: context, 
          builder: (context){
            return AlertDialog(
              content: Text('Посилання для зміни пароля надіслано! Перевірте свою електронну пошту'),
            );
          }
          );
    } on FirebaseAuthException catch (e){
      print('Помилка - $e');
    }
  }

  TextEditingController newEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
     double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: screenWidth / 22 ),
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight / signBox1),
              SizedBox(
                      width: screenWidth * 0.108,
                      height: screenHeight / 20,
                      child: OutlinedButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                      }, 
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)
                        )
                      ),
                      child: const Icon(Icons.arrow_back_ios, color: colorBlack,) )),
              
              SizedBox(
                    height: screenHeight / signBox2,
                  ),
                Text('Забули пароль?', style:  GoogleFonts.montserrat(fontSize: 30, fontWeight: FontWeight.w700, color: colorCustomBlack),),
                SizedBox(
                  height: screenHeight / 80 ,
                ),
               Text('Не переживай! Введіть адресу електронної пошти, пов’язану з вашим обліковим записом', style:  GoogleFonts.montserrat(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.grey)),
               SizedBox(height: screenWidth / 30,),
               SizedBox(
      width: screenWidth * 0.900,
      child: TextFormField(
        controller: newEmailController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8)
          ),
          hintText: 'Введіть електронну пошту',errorStyle: TextStyle(color: Colors.red, fontSize: 13.0),
          hintStyle: GoogleFonts.montserrat(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8)
          )
        ),
        validator: (value){
            if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)){
             return "Введіть коректну пошту";// Text('Введіть коректну дату');
                
            } else{
              return null;
            }
        },
          )),
        
          SizedBox(height: screenHeight / 60,),
                SizedBox(
      width: screenWidth * 0.90,
      height: screenHeight / 15,
      child: TextButton(
        onPressed: () {
             // widget.newPasswordRepository.passwordReset(context);
             passwordReset();
        },
        style: TextButton.styleFrom( 
          
          backgroundColor: colorCustomBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'Скинути пароль',
          style: GoogleFonts.montserrat(
            fontSize: screenWidth / 22,
            fontWeight: FontWeight.w400,
            color: colorWhite,
          ),
        ),
      ),
    )
            ],           
          ),
        )
        ),
    );
  }
}