import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
//import 'package:smart_identificator/main.dart' as app;
import 'package:smart_identificator/src/core/config/firebase/firebase_options.dart';
import 'package:smart_identificator/src/features/auth/sign_up/data/datasources/remote/remote.dart';
import 'package:smart_identificator/src/features/auth/sign_up/data/repositories/user_repository_impl.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/pages/sign_up_page.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/widgets/sign_up_widgets.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  testWidgets('SignUpPage Integration Test', (WidgetTester tester) async {
    final String testEmail = 'exampletest@gmail.com';
    final String testPassword = '1234567';

    
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: SignUpBloc(
            userRepository: UserRepositoryImpl(
              remoteDataSource: FirebaseRemoteDataSourceImpl(firebaseAuth: firebaseAuth),
            ),
          ),
          child: const SignUpPage(),
        ),
      ),
    );

    await tester.pumpAndSettle(const Duration(seconds: 3));

    expect(find.byType(SignUpPage), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 8));

    // Use keys for TextFields
  await tester.enterText(find.byKey(const Key('emailFieldKey')), testEmail);
  await tester.pumpAndSettle();
  await tester.pump();
   await Future.delayed(const Duration(seconds: 3));

    await tester.enterText(find.byKey(const Key('passwordFieldKey')), testPassword);
    await tester.pumpAndSettle();
      await tester.pump();
    // await Future.delayed(const Duration(seconds: 3));

    expect(find.text(testEmail), findsOneWidget);
    expect(find.text(testPassword), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 4));

    await tester.runAsync(() async {
      SignUpBloc(
        userRepository: UserRepositoryImpl(remoteDataSource: FirebaseRemoteDataSourceImpl(firebaseAuth: firebaseAuth)),
      ).add(SignUpButtonPressed(
        email: testEmail,
        password: testPassword,
      ));

      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.byType(ScaffoldMessenger).first, findsOneWidget);
    });
  });
}




