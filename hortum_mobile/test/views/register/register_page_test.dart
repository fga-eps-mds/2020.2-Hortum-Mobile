import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/views/register/register_page.dart';

main() {
  Widget makeTestable() {
    return MaterialApp(
      home: RegisterPage(false),
    );
  }

  testWidgets('Testing if RegisterPage renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestable());
    await tester.pump();
    expect(find.byKey(Key('registerFormPage')), findsOneWidget);
  });
}
