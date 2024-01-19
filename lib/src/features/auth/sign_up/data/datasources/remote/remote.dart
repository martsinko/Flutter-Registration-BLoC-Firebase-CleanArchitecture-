import 'package:firebase_auth/firebase_auth.dart';
import '../../models/user_model.dart';


abstract class FirebaseRemoteDataSource {
  Future<UserModel> registerUser(String email, String password);
}

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  FirebaseRemoteDataSourceImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<UserModel> registerUser(String email, String password) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        throw Exception("Електронна пошта та пароль не можуть бути порожніми");
      }

      UserCredential newUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel userModel = UserModel(
        email: newUser.user!.email ?? '', 
        password: password,
      );
      return userModel;

    } catch (e, stackTrace) {
      print('Firebase Error: $e\n$stackTrace');
      throw Exception("Не вдалося зареєструвати користувача");
    }
  }
}


/*catch (e) {
      if (e is FirebaseAuthException) {
     print('FirebaseAuthException: ${e.code}, ${e.message}');
   } else {
     print('Не вдалося зареєструвати користувача: $e');
   }
   throw Exception("Не вдалося зареєструвати користувача");
    }*/