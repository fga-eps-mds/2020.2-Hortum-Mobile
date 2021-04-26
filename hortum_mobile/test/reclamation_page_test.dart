import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/components/custom_desc_field.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/data/reclamation_data_backend.dart';
import 'package:hortum_mobile/data/reclamation_register_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/reclamation/components/list_reclamations.dart';
import 'package:hortum_mobile/views/reclamation/components/photo_selecter_reclamation.dart';
import 'package:hortum_mobile/views/reclamation/components/reclamation_form.dart';
import 'package:hortum_mobile/views/reclamation/reclamation_page.dart';
import 'package:hortum_mobile/views/reclamation/services/reclamation_services.dart';
import 'package:mockito/mockito.dart';
import 'dart:convert';

class DioMock extends Mock implements Dio {}

class Teste extends StatefulWidget {
  final Dio dio;
  const Teste({this.dio});
  @override
  _TestState createState() {
    return _TestState();
  }
}

class _TestState extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    String name = 'raimundo';
    String description = 'description';
    String emailProductor = 'productor@teste.com';
    return Scaffold(
      body: Container(
        child: MaterialButton(
            key: Key('botão'),
            onPressed: () async {
              await ReclamationServices.registerReclamation(
                  dio: widget.dio,
                  name: name,
                  description: description,
                  emailProductor: emailProductor,
                  context: context);
            }),
      ),
    );
  }
}

main() {
  final dio = DioMock();
  TestWidgetsFlutterBinding.ensureInitialized();
  actualUser.tokenAccess = 'token';
  actualUser.isProductor = false;
  actualUser.email = 'user@gmail.com';

  group('Testing Reclamations data:', () {
    RegisterReclamationAPI registerReclamation = RegisterReclamationAPI(dio);
    String responseMatcher = '';
    test('RegisterReclamationAPI', () async {
      var url = 'http://$ip:8000/reclamation/create/';
      when(dio.post(url, data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: jsonEncode(responseMatcher),
              requestOptions: null,
              statusCode: 200));
      int responseActual = await registerReclamation.registerReclamation(
          name: '', description: '', emailProductor: '');

      expect(responseActual, 200);
    });

    test('ReclamationDataAPI', () async {
      ReclamationDataAPI reclamDataApi = ReclamationDataAPI(dio);
      String emailProductor = 'productor@teste.com';
      var url = 'http://$ip:8000/reclamation/list/';
      List<dynamic> responseMatcher = [
        {
          'author': "user",
          'description': 'description',
        }
      ];
      List<dynamic> responseActual = [
        {
          'author': "user",
          'description': 'description',
        }
      ];

      when(dio.get(url, options: anyNamed('options'))).thenAnswer((_) async =>
          Response(
              data: responseMatcher, requestOptions: null, statusCode: 200));
      await reclamDataApi.listReclamation(emailProductor: emailProductor);

      expect(responseActual, responseMatcher);
    });
  });

  group('Testing ReclamationServices:', () {
    var url = 'http://$ip:8000/reclamation/create/';
    Widget makeTestable() {
      return MaterialApp(
        home: Teste(dio: dio),
      );
    }

    testWidgets('Show dialogue', (WidgetTester tester) async {
      String responseMatcher =
          "Você já realizou uma reclamação contra este produtor";

      when(dio.post(url, data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: jsonEncode(responseMatcher),
              requestOptions: null,
              statusCode: 400));

      await tester.pumpWidget(makeTestable());
      await tester.tap(find.byKey(Key('botão')));
      await tester.pump();
      await tester.tap(find.byKey(Key('okButton')));

      expect(find.byKey(Key('ReclamationAlreadyExists')), findsOneWidget);
    });

    testWidgets('Return to CustomerHomePage', (WidgetTester tester) async {
      String responseMatcher1 = "";
      List<dynamic> responseMatcher2 = [
        {
          "username": "Usuário Teste",
          "idPictureProductor": null,
          "name": "Anúncio Teste",
          "type_of_product": "Abelhas",
          "description": "Abelhas",
          "price": 10.0,
          "idPicture": null
        }
      ];

      when(dio.post(url, data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: jsonEncode(responseMatcher1),
              requestOptions: null,
              statusCode: 200));

      when(dio.get(any, options: anyNamed('options'))).thenAnswer((_) async =>
          Response(
              data: responseMatcher2, requestOptions: null, statusCode: 201));

      await tester.pumpWidget(makeTestable());
      await tester.tap(find.byKey(Key('botão')));
      await tester.pump();

      expect(find.byType(Scaffold), findsOneWidget);
    });
  });

  group('Testing ReclamationPage:', () {
    String emailProductor = 'cHJvZHVjdG9yQHRlc3RlLmNvbQ==';
    List<dynamic> responseMatcher = [
      {
        'author': "user",
        'description': 'description',
      }
    ];

    Widget makeTestable() {
      return MaterialApp(
        home: Scaffold(
          body: ReclamationPage(dio: dio, emailProductor: emailProductor),
        ),
      );
    }

    when(dio.get(any, options: anyNamed('options'))).thenAnswer((_) async =>
        Response(data: responseMatcher, requestOptions: null, statusCode: 200));

    testWidgets('Renderização da página e botão voltar',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable());
      await tester.tap(find.byKey(Key('buttonArrowback')));
      expect(find.byKey(Key('textReclamações')), findsOneWidget);
    });

    testWidgets('Botão Criar reclamação', (WidgetTester tester) async {
      when(dio.get(any, options: anyNamed('options'))).thenAnswer((_) async =>
          Response(
              data: responseMatcher, requestOptions: null, statusCode: 200));

      await tester.pumpWidget(makeTestable());
      await tester.tap(find.byKey(Key('createReclamationButton')));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('reclamationPage')), findsOneWidget);
    });
  });

  group('Testing ReclamationComponents:', () {
    testWidgets('PhotoSelecter', (WidgetTester tester) async {
      Widget makeTestable() {
        return MaterialApp(
          home: Scaffold(
            body: PhotoSelecterReclamation(),
          ),
        );
      }

      await tester.pumpWidget(makeTestable());
      expect(find.byKey(Key('adicionarImagem')), findsOneWidget);
    });

    ReclamationDataAPI reclamDataAPI = new ReclamationDataAPI();
    reclamDataAPI.reclamations = [
      {
        'author': "user",
        'description': 'description',
      }
    ];

    testWidgets('ReclamationList e ReclamationBox',
        (WidgetTester tester) async {
      Widget makeTestable() {
        return MaterialApp(
          home: Scaffold(
            body: ReclamationsList(
              reclamAPI: reclamDataAPI,
            ),
          ),
        );
      }

      await tester.pumpWidget(makeTestable());
      expect(find.byKey(Key('containerReclamationBox')), findsOneWidget);
    });

    testWidgets('ReclamationForm', (WidgetTester tester) async {
      Widget makeTestable() {
        return MaterialApp(
          home: Scaffold(
            body: ReclamationForm(dio: dio),
          ),
        );
      }

      await tester.pumpWidget(makeTestable());
      expect(find.byType(CustomFormField), findsOneWidget);
      expect(find.byType(CustomDescField), findsOneWidget);
      expect(find.byKey(Key('enviarReclamButton')), findsOneWidget);
    });
  });
}
