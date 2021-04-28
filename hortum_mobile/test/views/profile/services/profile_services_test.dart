import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/profile/components/profile_form.dart';
import 'package:mockito/mockito.dart';
import 'dart:convert';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  TestWidgetsFlutterBinding.ensureInitialized();
  TextEditingController email = TextEditingController(text: 'teste@email.com');
  TextEditingController username = TextEditingController(text: 'Nome');
  actualUser.email = 'user@user.com';
  actualUser.username = "user";
  actualUser.tokenAccess = 'token';

  group('Testing ProfileServices:', () {
    Widget makeTestable() {
      return MaterialApp(
          home: Scaffold(
              body: ProfileForm(dio: dio, email: email, username: username)));
    }

    testWidgets('Show dialog error', (WidgetTester tester) async {
      actualUser.isProductor = true;
      String responseMatcher = "Email já registrado!";

      when(dio.patch(any, data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: jsonEncode(responseMatcher),
              requestOptions: null,
              statusCode: 400));

      await tester.pumpWidget(makeTestable());
      await tester.tap(find.byKey(Key('salvarButton')));
      await tester.pump();
      expect(find.byKey(Key('emailJaExistente')), findsOneWidget);
    });

    group('Testing ProfileServices response.status_code 400:', () {
      testWidgets('Return to CustomerHomePage', (WidgetTester tester) async {
        actualUser.isProductor = false;
        String responseMatcher = "";

        when(dio.patch(any,
                data: anyNamed('data'), options: anyNamed('options')))
            .thenAnswer((_) async => Response(
                data: jsonEncode(responseMatcher),
                requestOptions: null,
                statusCode: 200));

        await tester.pumpWidget(makeTestable());
        await tester.tap(find.byKey(Key('salvarButton')));
        await tester.pumpAndSettle();
        expect(find.byKey(Key('categoryCarr')), findsOneWidget);
      });
    });
  });
}
