import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_identificator/src/features/auth/auth_user/bloc/auth_bloc.dart';
import 'package:smart_identificator/src/features/auth/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:smart_identificator/src/features/auth/sign_in/presentation/pages/sing_in_page.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/pages/sign_up_page.dart';
import 'package:smart_identificator/src/features/password/features/new_password/presentation/pages/new_password_page.dart';
import 'package:smart_identificator/src/features/student_home/presentation/pages/home_page.dart';
import 'package:smart_identificator/src/features/welcome_page/presentation/pages/welcome_page.dart';
import 'src/core/config/components/app_config.dart';
import 'src/core/config/firebase/firebase_options.dart';
import 'src/features/auth/auth_user/repositories/auth_repository.dart';
import 'src/features/auth/sign_in/domain/repositories/login_repository.dart';
import 'src/features/auth/sign_up/domain/repositories/add_user_repository.dart';
import 'src/features/auth/sign_up/domain/repositories/user_repository.dart';
import 'src/features/password/features/new_password/repositories/new_password_repo.dart';
import 'src/features/student_home/presentation/pages/navigation_bar_pages/navigator_bar_page.dart';
import 'src/features/student_home/presentation/pages/navigation_bar_pages/repositories/info_repository.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
   MyApp({super.key,
  required this.title,
   required this.exUserRepository, 
   required this.authRepository, 
   required this.userRepository, 
   required this.name, 
   required this.infoRepository, required this.newPasswordRepository,
   required this.credential, 
 
  });

final String name;
final String title;
final credential;
final InfoRepository infoRepository;
final NewPasswordRepository newPasswordRepository;
final ExUserRepository exUserRepository;
final AuthRepository authRepository;
final UserRepository userRepository;




  @override
  Widget build(BuildContext context) {

    return  MultiBlocProvider(
      providers: [
          BlocProvider(create: (context) => AuthBloc(authRepository: authRepository)),
          BlocProvider(create: (context) => SignInBloc(exUserRepository: exUserRepository)),
          BlocProvider(create: (context) => SignUpBloc(userRepository: userRepository))
      ],
      child: MaterialApp(
        title: subtitle,
          debugShowCheckedModeBanner: false,
          routes: {
            '/nav_bar_page':(context) => NavigationBarPage(exUserRepository: exUserRepository, name: name, infoRepository: infoRepository, uid: '',),
             '/forgot_password_page': (context) => NewPasswordPage(newPasswordRepository: newPasswordRepository),
             '/student_home': (context) =>  HomePage(exUserRepository: exUserRepository, name: name, infoRepository: infoRepository,),
             '/sign_up_page': (context) =>  SignUpPage(credential: credential, authRepository: authRepository, exUserRepository: exUserRepository, infoRepository: infoRepository,),
             '/sign_in_page':(context) =>  SignInPage(authRepository: authRepository),
             '/welcome_page':(context) => const WelcomePage()
          },
          home: 
         // SignInPage(authRepository: authRepository)
          //NewPasswordPage(newPasswordRepository: newPasswordRepository,)
         authRepository.currentUser != null ? NavigationBarPage(exUserRepository: exUserRepository, name: name, infoRepository: infoRepository, uid: '',) : const WelcomePage()
          
          /* BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state){
                if(state is UnAuthenticateState){
                  return const WelcomePage();
                }
                else if(state is AuthenticateState){
                    return HomePage(exUserRepository: exUserRepository);
                }
                return const WelcomePage();
            })*/
      
      ),
    );  
  }
}
 