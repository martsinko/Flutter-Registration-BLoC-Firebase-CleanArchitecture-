import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'src/core/config/app_config.dart';
import 'src/core/config/firebase/firebase_options.dart';
import 'src/features/auth/sign_up/presentation/pages/sign_up_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,
  required this.title
  });

final String title;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    title: subtitle,
      debugShowCheckedModeBanner: false,
      home:  SignUpPage()
    );  
  }
}
 