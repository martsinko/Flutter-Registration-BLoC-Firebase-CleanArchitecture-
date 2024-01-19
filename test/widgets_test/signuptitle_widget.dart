import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_identificator/src/core/config/app_config.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/widgets/sign_up_title_widget.dart';

void main() {

  testWidgets('SignUpTitle Widget Test', (WidgetTester tester) async {

   const double screenHeight = 1000;

    await tester.pumpWidget(
    const  MaterialApp(
        home: Scaffold(
          body: SignUpTitle(screenHeight: screenHeight),
        ),
      ),
    );

    final Finder signUpTitleFinder = find.text(titleSignUp);

   
    expect(signUpTitleFinder, findsOneWidget);

 
    final Text signUpTitleText = tester.widget(signUpTitleFinder);
    expect(signUpTitleText.style?.fontSize, screenHeight / 32);
    expect(signUpTitleText.style?.fontWeight, FontWeight.w800);
    expect(signUpTitleText.style?.color, colorCustomBlack);
  });
}
