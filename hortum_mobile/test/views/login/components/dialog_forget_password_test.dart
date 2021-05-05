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

  group('Testing LoginComponents:', () {
    testWidgets("OnPressed forgetPassword Button render dialog",
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(widget: loginPage));
      await tester.tap(find.byKey(Key('forgetPassButton')));
      await tester.pump();
      expect(find.byKey(Key('dialogForgetPassword')), findsOneWidget);
      await tester.tap(find.byKey(Key('redirectButton')));
    });
  });
}
