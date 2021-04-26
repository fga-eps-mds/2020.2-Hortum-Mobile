import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/data/change_password_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/change_password/components/password_form.dart';
import 'package:mockito/mockito.dart';
import 'dart:convert';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  TestWidgetsFlutterBinding.ensureInitialized();
  var url = 'http://$ip:8000/users/change-password/';

  group('Testing class ChangePasswordAPI:', () {
    ChangePasswordAPI changePassword = ChangePasswordAPI(dio);
    actualUser.tokenAccess = 'token';
    String responseMatcher = "Senha alterada!";
    test('Change Password Successful', () async {
      when(dio.patch(url, data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: jsonEncode(responseMatcher),
              requestOptions: null,
              statusCode: 200));
      int responseActual = await changePassword.changePassword('', '');

      expect(responseActual, 200);
    });
  });

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
