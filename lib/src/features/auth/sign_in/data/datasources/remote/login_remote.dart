import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_identificator/src/features/auth/sign_in/data/models/existing_user_model.dart';
import 'package:smart_identificator/src/features/auth/sign_in/presentation/pages/sing_in_page.dart';

abstract class LoginRemoteDataSource {
  Future<ExUserModel> loginUser(String email, String password);
  Future<void> signOut();
  Future<bool> isSignedIn();
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final FirebaseAuth loginFirebase;

  LoginRemoteDataSourceImpl({required FirebaseAuth firebaseAuth})
      : loginFirebase = firebaseAuth;

  @override
  Future<ExUserModel> loginUser(String email, String password) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        throw Exception("Поля пусті"); // Викидаємо помилку для порожніх полів
      }

      UserCredential userCredential = await loginFirebase.signInWithEmailAndPassword(
        email: email, 
        password: password,
      );

      if (userCredential.user == null) {
        throw Exception("Немає такого обл запису"); // Викидаємо помилку для невірних облікових даних
      }

      ExUserModel exUserModel = ExUserModel(
        email: userCredential.user!.email ?? '', 
        password: password,
      );
      return exUserModel;
    } catch (e, stackTrace) {
      print('Помилка Firebase: $e\n$stackTrace');
      throw Exception("Не вдалося авторизуватись"); // Викидаємо помилку для інших серверних помилок
    }
  }
  Future<void> signOut() async{
    try{
    return await loginFirebase.signOut();
    } catch(e){
      throw Exception("Не вдалося вийти");
    }
  }

  @override
  Future<bool> isSignedIn() async{
       final user = firebaseAuth.currentUser;
       return user != null;
  }
}
