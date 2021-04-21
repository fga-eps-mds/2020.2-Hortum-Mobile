import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/components/custom_desc_field.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/data/reclamation_register_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/reclamation/components/reclamation_form.dart';
import 'package:mockito/mockito.dart';
import 'dart:convert';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  TestWidgetsFlutterBinding.ensureInitialized();
  var url = 'http://$ip:8000/reclamation/create/';

  group('Testing class RegisterReclamationAPI:', () {
    RegisterReclamationAPI registerReclamation = RegisterReclamationAPI(dio);
    actualUser.tokenAccess = 'token';
    String responseMatcher = '';
    test('Register Reclamation Successful', () async {
      when(dio.post(url, data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: jsonEncode(responseMatcher),
              requestOptions: null,
              statusCode: 200));
      int responseActual = await registerReclamation.registerReclamation(
          name: '', description: '', emailProductor: '');

      expect(responseActual, 200);
    });
  });

  group('Testing reclamation_form:', () {
    Widget makeTestable() {
      return MaterialApp(home: Scaffold(body: ReclamationForm(dio: dio)));
    }

    testWidgets('CustomFormFields, CustomDescField e MaterialButton',
        (WidgetTester tester) async {
      actualUser.tokenAccess = 'token';
      actualUser.isProductor = false;
      await tester.pumpWidget(makeTestable());
      expect(find.byType(CustomFormField), findsOneWidget);
      expect(find.byType(CustomDescField), findsOneWidget);
      expect(find.byType(MaterialButton), findsNWidgets(2));
    });
  });

  group('Testing reclamationServices:', () {
    TextEditingController name = TextEditingController(text: 'teste');
    TextEditingController description =
        TextEditingController(text: 'description');
    String emailProductor = 'productor@teste.com';
    Widget makeTestable() {
      return MaterialApp(
        home: Scaffold(
          body: ReclamationForm(
            dio: dio,
            name: name,
            description: description,
            emailProductor: emailProductor,
          ),
        ),
      );
    }

    testWidgets('CustomFormField, CustomDescField e MaterialButton',
        (WidgetTester tester) async {
      actualUser.tokenAccess = 'token';
      actualUser.isProductor = false;
      String responseMatcher =
          "Você já realizou uma reclamação contra este produtor";
      actualUser.email = 'user@user.com';
      actualUser.username = null;

      when(dio.post(url, data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: jsonEncode(responseMatcher),
              requestOptions: null,
              statusCode: 400));

      await tester.pumpWidget(makeTestable());
      await tester.tap(find.byKey(Key('entrarButton')));
      await tester.pump();
      expect(find.byKey(Key('ReclamationAlreadyExists')), findsOneWidget);
    });
  });
}
