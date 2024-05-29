
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();
  User? currentUser = FirebaseAuth.instance.currentUser;
 
   signInWithGoogle() async{
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken,
          idToken: gAuth.idToken
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }

    /*Future<UserCredential> signInWithFacebook() async{
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    }*/
    Future<UserCredential> signInWithFacebook() async {
    // Виконати авторизацію з Facebook
    final LoginResult result = await FacebookAuth.instance.login();

    // Перевірити результат
    if (result.status == LoginStatus.success) {
      // Отримати дані для авторизації
      final AccessToken accessToken = result.accessToken!;
      final OAuthCredential credential = FacebookAuthProvider.credential(accessToken.tokenString);

      // Виконати авторизацію у Firebase
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } else {
      throw FirebaseAuthException(
        message: result.message,
        code: result.status.toString(),
      );
    }
  }
      

    Future<bool> isSignedIn() async {
    var currentUser = await firebaseAuth.currentUser;
    return currentUser != null;
  }

   Future<User?> getCurrentUser() async {
    return await firebaseAuth.currentUser;  
  } 



}