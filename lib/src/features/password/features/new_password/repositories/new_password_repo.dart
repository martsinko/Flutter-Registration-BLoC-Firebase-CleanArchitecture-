import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/pages/sign_up_page.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/widgets/sign_up_widgets.dart';
import '../../../../../../firebase_options.dart';

class NewPasswordRepository{

 final TextEditingController newEmailController;
  NewPasswordRepository({required this.newEmailController});
  
  Future passwordReset(BuildContext context) async{
    try{
        await FirebaseAuth.instance.sendPasswordResetEmail(email: newEmailController.text);
        showDialog(
          context: context, 
          builder: (context){
            return AlertDialog(
              content: Text('Посилання для зміни пароля надіслано! Перевірте свою електронну пошту'),
            );
          }
          );
    } on FirebaseAuthException catch (e, stackTrace){
      print('Firebase Error: $e\n$stackTrace');
      showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('Firebase Error: $e\n$stackTrace'),
        );
      },
    );
      //print('Помилка - $e');
    }
  }
}