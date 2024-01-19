import 'package:flutter_test/flutter_test.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/pages/sign_up_page.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/widgets/sign_up_widgets.dart';

final TextEditingController emailController = TextEditingController();

void main() {
  testWidgets('EmailTextField Widget Test', (WidgetTester tester) async {
    const double screenHeight = 600;
    const double screenWidth = 800;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmailTextField(
            screenHeight: screenHeight,
            screenWidth: screenWidth, 
           emailFieldKey: const Key('emailFieldKey'),
          ),
        ),
      ),
    );

    final Finder emailTextFieldFinder = find.byType(TextField);
    expect(emailTextFieldFinder, findsOneWidget);
    await tester.enterText(emailTextFieldFinder, 'test@example.com');
    expect(SignUpPage.email, 'test@example.com');
  });
}
