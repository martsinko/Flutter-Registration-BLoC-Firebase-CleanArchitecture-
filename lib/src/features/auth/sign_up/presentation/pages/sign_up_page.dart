import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_identificator/src/features/auth/sign_in/domain/repositories/login_repository.dart';
import 'package:smart_identificator/src/features/auth/sign_up/data/datasources/remote/remote.dart';
import 'package:smart_identificator/src/features/auth/sign_up/data/repositories/user_repository_impl.dart';
import 'package:smart_identificator/src/features/auth/sign_up/domain/repositories/add_user_repository.dart';
import 'package:smart_identificator/src/features/auth/sign_up/domain/repositories/user_repository.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:smart_identificator/src/features/student_home/presentation/pages/navigation_bar_pages/repositories/info_repository.dart';
import '../../../../../core/config/components/app_config.dart';
import '../../../auth_user/repositories/auth_repository.dart';
import '../widgets/sign_up_widgets.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
UserRepository signUpRepository = UserRepositoryImpl(remoteDataSource: FirebaseRemoteDataSourceImpl(firebaseAuth: firebaseAuth) ); 

class SignUpPage extends StatefulWidget {
    final AuthRepository authRepository;
    final ExUserRepository exUserRepository;
    final InfoRepository infoRepository;
  final credential;
  const SignUpPage({super.key,
  required this.credential, 
  required this.authRepository, 
  required this.exUserRepository, 
  required this.infoRepository});

 static String email = '';
 static String password = '';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final  TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

 Future<void> addUser() async {
  String? uid = FirebaseAuth.instance.currentUser?.uid;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
   if (uid == null) {
      print('Користувач не автентифікований');
      return;
    }

     String? googleEmail = FirebaseAuth.instance.currentUser?.email;
  try {
    await firestore.collection('students').doc(uid).set({
      'email': SignUpPage.email,
    });
    print('Створено користувача з uid : $uid');
  } catch (e) {
    print('Помилка при створенні колекції та документів: $e');
  }
}
    
  @override
    void initState(){
    super.initState();
    
        Future.delayed(Duration.zero, () async {
      await Firebase.initializeApp();
    });
    }

  final formKey = GlobalKey<FormState>();
    
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

          listener: (context, state) async {

          if(state is SignUpLoading){
             const  Center(child: CircularProgressIndicator());
          }

          if(state is SignUpSuccess) {
             ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(content: Text('Зареєстровано')),
                 
                );
                  addUser();    
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
                  Form(
                    key: formKey,
                    child: 
                  Column(
                        
                  children: [

                EmailTextField(
                    screenHeight: screenHeight, screenWidth: screenWidth, ),//emailFieldKey: emailFieldKey,),
                SizedBox(
                  height: screenHeight / signBox4,
                ),
                PasswordTextField(
                    screenHeight: screenHeight, screenWidth: screenWidth,), //passwordFieldKey: passwordFieldKey,),
                SizedBox(
                  height: screenHeight / signBox5,
                ),
                ConfirmPasswordTextField(
                    screenHeight: screenHeight, screenWidth: screenWidth),
                SizedBox(
                  height: screenHeight / signBox6,
                ),
                RegisterButton(
                    screenWidth: screenWidth, screenHeight: screenHeight, emailController: emailController, passwordController: passwordController, formKey: formKey,),
                SizedBox(
                  height: screenHeight / signBox7,
                ),
                OtherRegisterText(
                    screenWidth: screenWidth, screenHeight: screenHeight),
                OtherRegisterButtons(
                    screenWidth: screenWidth, screenHeight: screenHeight, authRepository: widget.authRepository, exUserRepository: widget.exUserRepository, infoRepository: widget.infoRepository,),
                SizedBox(
                  height: screenHeight / signBox8,
                ),
                AlreadyAccTextandTextButton(screenWidth: screenWidth),
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}



