import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/change_password/components/password_form.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
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
}
