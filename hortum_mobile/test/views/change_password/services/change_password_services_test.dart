import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/change_password/components/password_form.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
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

    group('ChangePasswordService return status code 400', () {
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

      testWidgets('Testing the TextButton on Dialog',
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
        await tester.tap(find.byKey(Key('confirmButton')));
        await tester.pump();
        expect(find.byKey(Key('changePasswordForm')), findsOneWidget);
      });
    });

    group('ChangePasswordService return status code 200', () {
      testWidgets(
          'Testing navigation to HomeCostumerPage after changing password succesfuly',
          (WidgetTester tester) async {
        actualUser.tokenAccess = 'token';
        actualUser.isProductor = false;

        when(dioMock.patch(any,
                data: anyNamed('data'), options: anyNamed('options')))
            .thenAnswer(
                (_) async => Response(requestOptions: null, statusCode: 200));
        await tester.pumpWidget(makeTestable());
        await tester.tap(find.byType(MaterialButton));
        await tester.pumpAndSettle();
        expect(find.byKey(Key('categoryCarr')), findsOneWidget);
      });

      testWidgets(
          'Testing navigation to ProducotrHomePage after changing password succesfuly',
          (WidgetTester tester) async {
        actualUser.tokenAccess = 'token';
        actualUser.isProductor = true;

        when(dioMock.patch(any,
                data: anyNamed('data'), options: anyNamed('options')))
            .thenAnswer(
                (_) async => Response(requestOptions: null, statusCode: 200));
        await tester.pumpWidget(makeTestable());
        await tester.tap(find.byType(MaterialButton));
        await tester.pumpAndSettle();
        expect(find.text('MEUS ANÚNCIOS'), findsOneWidget);
      });
    });
  });
}
