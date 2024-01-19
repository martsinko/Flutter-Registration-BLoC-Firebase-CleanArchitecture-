import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_identificator/src/features/auth/sign_up/domain/repositories/user_repository.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/pages/sign_up_page.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/widgets/sign_up_widgets.dart';

import 'sign_up_bloc_test.dart';

class MockSignUpBloc extends MockBloc<SignUpEvent, SignUpState> implements SignUpBloc {}

void main() {
  late MockSignUpBloc mockSignUpBloc;
   // ignore: unused_local_variable
   late UserRepository mockUserRepository;

  setUp(() {
    mockSignUpBloc = MockSignUpBloc();
    mockUserRepository = MockUserRepository();
  });

  testWidgets('RegisterButton Widget Test', (WidgetTester tester) async {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

  when(
      mockSignUpBloc.add(SignUpButtonPressed(
        email: SignUpPage.email,
        password: SignUpPage.password,
      )),
        );
     
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider<SignUpBloc>(
            create: (context) => mockSignUpBloc,
            child: RegisterButton(
              screenWidth: 1200, 
              screenHeight: 1100, 
              emailController: emailController,
              passwordController: passwordController,
            ),
          ),
        ),
      ),
    );

    expect(find.byType(RegisterButton), findsOneWidget);
    await tester.tap(find.byType(RegisterButton));
    await tester.pump();
    
  });
}
