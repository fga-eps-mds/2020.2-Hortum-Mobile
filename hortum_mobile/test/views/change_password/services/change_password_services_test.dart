import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/change_password/components/password_form.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dioMock = DioMock();
  group('Testing ChangePasswordService:', () {
    TextEditingController actualPassword = TextEditingController(text: ' ');
    TextEditingController password = TextEditingController(text: ' ');
    TextEditingController confirmPassword = TextEditingController(text: ' ');
    Widget makeTestable() {
      return MaterialApp(
          home: Scaffold(
              body: PasswordForm(
                  dio: dioMock,
                  actualPassword: actualPassword,
                  password: password,
                  confirmPassword: confirmPassword)));
    }

    testWidgets('CustomFormFields e MaterialButton',
        (WidgetTester tester) async {
      actualUser.tokenAccess = 'token';
      actualUser.isProductor = true;
      String responseMatcher = "Senha incorreta!";

      when(dioMock.patch(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: jsonEncode(responseMatcher),
              requestOptions: null,
              statusCode: 400));

      await tester.pumpWidget(makeTestable());
      await tester.tap(find.byType(MaterialButton));
      await tester.pump();
      expect(find.byKey(Key('senhaIncorreta')), findsOneWidget);
    });
  });
}
