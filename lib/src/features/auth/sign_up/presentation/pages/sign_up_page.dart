import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_identificator/src/features/auth/sign_up/data/datasources/remote/remote.dart';
import 'package:smart_identificator/src/features/auth/sign_up/data/repositories/user_repository_impl.dart';
import 'package:smart_identificator/src/features/auth/sign_up/domain/repositories/user_repository.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';
import '../../../../../core/config/app_config.dart';
import '../widgets/sign_up_widgets.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
UserRepository signUpRepository = UserRepositoryImpl(remoteDataSource: FirebaseRemoteDataSourceImpl(firebaseAuth: firebaseAuth) ); 

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key,});


 static String email = '';
 static String password = '';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final  TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
@override
  void initState(){
   super.initState();
   
      Future.delayed(Duration.zero, () async {
    await Firebase.initializeApp();
  });
  }


static const Key emailFieldKey = Key('emailFieldKey');
  static const Key passwordFieldKey = Key('passwordFieldKey');


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: colorDarkWhite,
      body: SafeArea(
          child: BlocProvider(
        create: (context) => SignUpBloc(userRepository: UserRepositoryImpl(remoteDataSource: FirebaseRemoteDataSourceImpl(firebaseAuth: firebaseAuth)) ),
        child: BlocListener<SignUpBloc, SignUpState>(

          listener: (context, state) {

          if(state is SignUpLoading){
             const  Center(child: CircularProgressIndicator());
          }

          if(state is SignUpSuccess){
             ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(content: Text('Зареєстровано')),
                );
          }
          
          if(state is SignUpError){
            ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(content: Text('Не зареєстровано')),
                );
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenHeight / signBox1),
                PaddingBackButton(
                    screenWidth: screenWidth, screenHeight: screenHeight),
                SizedBox(
                  height: screenHeight / signBox2,
                ),
                PaddingSignUpTitle(
                    screenWidth: screenWidth, screenHeight: screenHeight),
                SizedBox(
                  height: screenHeight / signBox3,
                ),
                EmailTextField(
                    screenHeight: screenHeight, screenWidth: screenWidth, emailFieldKey: emailFieldKey,),
                SizedBox(
                  height: screenHeight / signBox4,
                ),
                PasswordTextField(
                    screenHeight: screenHeight, screenWidth: screenWidth, passwordFieldKey: passwordFieldKey,),
                SizedBox(
                  height: screenHeight / signBox5,
                ),
                ConfirmPasswordTextField(
                    screenHeight: screenHeight, screenWidth: screenWidth),
                SizedBox(
                  height: screenHeight / signBox6,
                ),
                RegisterButton(
                    screenWidth: screenWidth, screenHeight: screenHeight, emailController: emailController, passwordController: passwordController,),
                SizedBox(
                  height: screenHeight / signBox7,
                ),
                OtherRegisterText(
                    screenWidth: screenWidth, screenHeight: screenHeight),
                OtherRegisterButtons(
                    screenWidth: screenWidth, screenHeight: screenHeight),
                SizedBox(
                  height: screenHeight / signBox8,
                ),
                AlreadyAccTextandTextButton(screenWidth: screenWidth),
              ],
            ),
          ),
        ),
      )),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}



