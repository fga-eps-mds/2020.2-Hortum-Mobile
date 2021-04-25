import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/data/update_user_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/profile/components/profile_form.dart';
import 'package:mockito/mockito.dart';
import 'dart:convert';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  TestWidgetsFlutterBinding.ensureInitialized();
  var url = 'http://$ip:8000/users/update/';

  group('Testing class UpdateUserAPI:', () {
    UpdateUserAPI updateUser = UpdateUserAPI(dio);
    actualUser.tokenAccess = 'token';
    String responseMatcher = 'Dados alterados';
    test('Update User Successful', () async {
      when(dio.patch(url, data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: jsonEncode(responseMatcher),
              requestOptions: null,
              statusCode: 200));
      int responseActual = await updateUser.updateUser(email: '', username: '');

      expect(responseActual, 200);
    });
  });

  group('Testing profile_form:', () {
    Widget makeTestable() {
      return MaterialApp(home: Scaffold(body: ProfileForm(dio: dio)));
    }

    testWidgets('CustomFormFields e MaterialButton',
        (WidgetTester tester) async {
      actualUser.tokenAccess = 'token';
      actualUser.isProductor = true;
      await tester.pumpWidget(makeTestable());
      expect(find.byType(CustomFormField), findsNWidgets(2));
      expect(find.byType(MaterialButton), findsNWidgets(2));
    });
  });

  group('Testing Service:', () {
    TextEditingController email =
        TextEditingController(text: 'teste@email.com');
    TextEditingController username = TextEditingController(text: 'Nome');
    Widget makeTestable() {
      return MaterialApp(
          home: Scaffold(
              body: ProfileForm(dio: dio, email: email, username: username)));
    }

    testWidgets('CustomFormFields e MaterialButton',
        (WidgetTester tester) async {
      actualUser.tokenAccess = 'token';
      actualUser.isProductor = true;
      String responseMatcher = "Email já registrado!";
      actualUser.email = 'user@user.com';
      actualUser.username = null;

      when(dio.patch(url, data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: jsonEncode(responseMatcher),
              requestOptions: null,
              statusCode: 400));

      await tester.pumpWidget(makeTestable());
      await tester.tap(find.byKey(Key('salvarButton')));
      await tester.pump();
      expect(find.byKey(Key('emailJaExistente')), findsOneWidget);
    });
  });
}
