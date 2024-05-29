import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_identificator/src/features/auth/sign_in/data/datasources/remote/login_remote.dart';
import 'package:smart_identificator/src/features/auth/sign_in/data/repositories/login_repository_impl.dart';
import '../../../../../core/config/components/app_config.dart';
import '../../../auth_user/repositories/auth_repository.dart';
import '../../domain/repositories/login_repository.dart';
import '../bloc/sign_in_bloc.dart';
import '../widgets/password_text_field.dart';
import '../widgets/sign_in_widgets.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
ExUserRepository signUpRepository = ExUserRepositoryImpl(loginDataSource: LoginRemoteDataSourceImpl(firebaseAuth: firebaseAuth) ); 

class AdminSignInPage extends StatefulWidget {
  const AdminSignInPage({super.key, });

  static String emailLog = '';
 static String passwordLog = '';

  @override
  State<AdminSignInPage> createState() => _AdminSignInPageState();
}

class _AdminSignInPageState extends State<AdminSignInPage> {

  final TextEditingController emailLogController = TextEditingController();
  final TextEditingController passwordLogController = TextEditingController();
  


@override
  void initState(){
   super.initState();
      Future.delayed(Duration.zero, () async {
    await Firebase.initializeApp();
  });
  }
   
 void _showErrorMessage() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Неправильний логін або пароль'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  final bool passwordVisible = true;
   final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: colorDarkWhite,
      body: SafeArea(
          child: BlocProvider(
        create: (context) => SignInBloc(
            exUserRepository: ExUserRepositoryImpl(
                loginDataSource:
                    LoginRemoteDataSourceImpl(firebaseAuth: firebaseAuth))),
        child: BlocListener<SignInBloc, SignInState>(
          listener: (context, state) {
  
            if(state is SignInLoading){
            showDialog(context: context, 
            builder: (context) => const Center(
                child: CircularProgressIndicator(
                ),
              )
              );
          }

          if(state is SignInSuccess){         
            Navigator.pushReplacementNamed(context, '/nav_bar_page');
             ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(content: Text('Авторизовано')),
                );
          }
          
          if(state is SignInError){ 
            _showErrorMessage();        
            /*ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(content: Text('Неправильний логін або пароль')),
                );*/
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenHeight / signBox1),
                Padding_ButtonBack(
                    screenWidth: screenWidth, screenHeight: screenHeight),
                SizedBox(
                  height: screenHeight / signBox2,
                ),
                Padding(
                  padding:  EdgeInsets.only(left: screenWidth / 20),
                  child: Text('Привіт дорогий Адміністраторе!', style: GoogleFonts.montserrat(
                        fontSize: screenWidth * 0.08, 
                        fontWeight: FontWeight.w700, 
                        /*fontStyle: FontStyle.italic,*/ 
                        color: colorMedBlack)),
                ),
                SizedBox(
                  height: screenHeight / signBox3,
                ),
                Form(
                  key: keyForm,
                  child: Column(
                  children:[
                EmailTextField(
                    screenHeight: screenHeight, screenWidth: screenWidth),
                SizedBox(
                  height: screenHeight / signBox4,
                ),
                PasswordTextFieldWidget(screenHeight: screenHeight, screenWidth: screenWidth, passwordLogController: passwordLogController),
                ForgotPassword(screenWidth: screenWidth),
                SizedBox(
                  height: screenHeight / 60,
                ),
                LoginButton(
                    screenWidth: screenWidth, screenHeight: screenHeight, emailLogController: emailLogController, passwordLogController: passwordLogController, keyForm: keyForm,),
                SizedBox(height: screenHeight / signBox7),
                OtherLogin(
                    screenWidth: screenWidth, screenHeight: screenHeight),
               Row(
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
             }, 
           child: Icon(Icons.facebook, size: 35,))),

                 SizedBox(width: screenWidth / 50 ,),
               

         SizedBox(
           width: screenWidth / 4,
           height: screenHeight / 16,
           
           child: OutlinedButton(onPressed: () async{
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
    ),
                SizedBox(
                  height: screenHeight / signBox9,
                ),
                    ]   
                  )
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}

