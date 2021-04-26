import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/views/login/login_page.dart';

void main() {
  LoginPage loginPage = LoginPage();

  Widget makeTestableWidget({Widget widget}) {
    return MaterialApp(
      home: widget,
    );
  }

  group('Design Tests', () {
    testWidgets("On button 'Não tenho uma conta' pressed",
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(widget: loginPage));
      await tester.tap(find.byKey(Key('newAccount')));
      await tester.pump();

      expect(find.byKey(Key('typeUser')), findsOneWidget);
    });

    testWidgets(
        'Given empty email and password the screen return an error text',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(widget: loginPage));

      await tester.tap(find.byKey(Key('signIn')));
      await tester.pump();

      expect(find.text('Informe o email'), findsOneWidget);
    });

    testWidgets('On obscure button click change the icon',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(widget: loginPage));

      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();

      expect(find.byIcon(Icons.visibility_off), findsNothing);
      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });
  });
}
