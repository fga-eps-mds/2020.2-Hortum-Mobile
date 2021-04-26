import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/change_password/change_password_page.dart';
import 'package:hortum_mobile/views/change_password/components/password_form.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dioMock = DioMock();
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Testing PasswordForm:', () {
    Widget makeTestable() {
      return MaterialApp(home: Scaffold(body: PasswordForm()));
    }

    testWidgets('CustomFormFields e MaterialButton',
        (WidgetTester tester) async {
      actualUser.tokenAccess = 'token';
      actualUser.isProductor = true;
      await tester.pumpWidget(makeTestable());
      expect(find.byType(CustomFormField), findsNWidgets(3));
      expect(find.byType(MaterialButton), findsOneWidget);
    });
  });

  group('Testing ChangePasswordPage', () {
    Widget makeTestable() {
      return MaterialApp(
          home: ChangePasswordPage(
        dio: dioMock,
      ));
    }

    testWidgets('Testing if ChangePasswordPage render correctly',
        (WidgetTester tester) async {
      actualUser.isProductor = false;

      await tester.pumpWidget(makeTestable());
      await tester.pump();
      expect(find.byKey(Key('changePasswordContent')), findsOneWidget);
    });
  });
}
