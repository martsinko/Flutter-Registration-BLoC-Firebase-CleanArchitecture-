import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../info_page.dart';
import '../../../../../auth/sign_up/presentation/pages/sign_up_page.dart';

class InfoRepository {

  Future<void> saveInfoForStudent() async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      print('Користувач не автентифікований');
      return;
    }

    CollectionReference studentCollection = FirebaseFirestore.instance.collection('students');
    try {
      DocumentReference studentDocRef = studentCollection.doc(uid);

      await studentDocRef.set({
        'name': InfoPage.name,
        'surname': InfoPage.surname,
        'group': InfoPage.selectedGroup,
        'course': InfoPage.selectedCourse,
        'spec': InfoPage.selectedSpec,
        'teacher': InfoPage.teacher,
        'numberPhone': InfoPage.phoneNumber,
        'telegram': InfoPage.telegram,
        'instagram': InfoPage.instagram,
        'facebook': InfoPage.facebook
      }, SetOptions(merge: true));

      print('Дані успішно збережені для користувача з UID: $uid');
    } catch (e) {
      print('Помилка при записуванні до БД: $e');
    }
  }
}
