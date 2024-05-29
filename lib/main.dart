import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_identificator/my_app.dart';
import 'package:smart_identificator/src/core/config/components/app_config.dart';
import 'package:smart_identificator/src/features/auth/sign_in/data/datasources/remote/login_remote.dart';
import 'package:smart_identificator/src/features/auth/sign_in/data/repositories/login_repository_impl.dart';
import 'package:smart_identificator/src/features/auth/sign_up/data/repositories/user_repository_impl.dart';
import 'package:smart_identificator/src/features/auth/sign_up/domain/repositories/user_repository.dart';
import 'package:smart_identificator/src/features/password/features/new_password/repositories/new_password_repo.dart';
import 'package:smart_identificator/src/features/student_home/presentation/pages/navigation_bar_pages/repositories/info_repository.dart';
import 'firebase_options.dart';
import 'src/features/auth/auth_user/repositories/auth_repository.dart';
import 'src/features/auth/sign_in/domain/repositories/login_repository.dart';
import 'src/features/auth/sign_up/data/datasources/remote/remote.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
    
   final InfoRepository infoRepository = InfoRepository();
   final AuthRepository authRepository = AuthRepository();
   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final TextEditingController newEmailController = TextEditingController();
    final NewPasswordRepository newPasswordRepository = NewPasswordRepository(newEmailController: newEmailController);
   final FirebaseRemoteDataSource remoteDataSource = FirebaseRemoteDataSourceImpl(firebaseAuth: firebaseAuth);
   final LoginRemoteDataSource loginDataSource = LoginRemoteDataSourceImpl(firebaseAuth: firebaseAuth);
   final ExUserRepository exUserRepository = ExUserRepositoryImpl(loginDataSource: loginDataSource);
   final UserRepository userRepository = UserRepositoryImpl(remoteDataSource: remoteDataSource);

runApp( 
  MyApp(
    title: subtitle, 
    exUserRepository:  exUserRepository, 
    authRepository:  authRepository,
    userRepository: userRepository, name: '', infoRepository: infoRepository, newPasswordRepository: newPasswordRepository, credential: '' ,)
);
}