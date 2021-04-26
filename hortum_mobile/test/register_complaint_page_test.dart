import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/components/custom_desc_field.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/data/complaint_data_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/home_customer/home_customer_page.dart';
import 'package:hortum_mobile/views/register_complaint/components/photo_selecter_complaint.dart';
import 'package:hortum_mobile/views/register_complaint/register_complaint_page.dart';
import 'package:hortum_mobile/views/register_complaint/services/complaint_services.dart';
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
    return MaterialButton(
        key: Key('botão'),
        onPressed: () async {
          await ComplaintServices.registerComplaint(
              dio: widget.dio,
              name: name,
              description: description,
              emailProductor: emailProductor,
              context: context);
        });
  }
}

main() {
  final dio = DioMock();
  TestWidgetsFlutterBinding.ensureInitialized();
  actualUser.tokenAccess = 'token';
  actualUser.isProductor = false;
  // actualUser.email = 'user@gmail.com';

  group('Testing Complaint data:', () {
    test('registerComplaint', () async {
      ComplaintDataAPI complaintDataApi = ComplaintDataAPI(dio);
      String responseMatcher = '';
      var url = 'http://$ip:8000/complaint/create/';

      when(dio.post(url, data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: jsonEncode(responseMatcher),
              requestOptions: null,
              statusCode: 200));
      int responseActual = await complaintDataApi.registerComplaint(
          name: '', description: '', emailProductor: '');

      expect(responseActual, 200);
    });
  });

  group('Testing RegisterComplaintServices:', () {
    var url = 'http://$ip:8000/complaint/create/';
    Widget makeTestable() {
      return MaterialApp(
        home: Teste(dio: dio),
      );
    }

    testWidgets('dialogErrorComplaint', (WidgetTester tester) async {
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

      expect(find.byKey(Key('complaintAlreadyExists')), findsOneWidget);
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

      when(dio.get(any, options: anyNamed('options'))).thenAnswer(
          (_) async => Response(data: responseMatcher2, requestOptions: null));

      await tester.pumpWidget(makeTestable());
      await tester.tap(find.byKey(Key('botão')));
      await tester.pump();
      await tester.pump();
      expect(find.byType(CustomerHomePage), findsOneWidget);
    });
  });

  group('Testing RegisterComplaintPage:', () {
    Widget makeTestable() {
      return MaterialApp(
        home: Scaffold(
          body: RegisterComplaintPage(dio: dio),
        ),
      );
    }

    testWidgets('Renderização da página', (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable());
      expect(find.byType(CustomFormField), findsOneWidget);
      expect(find.byType(CustomDescField), findsOneWidget);
      expect(find.byKey(Key('enviarReclamButton')), findsOneWidget);
    });
  });

  group('Testing RegisterComplaintComponent:', () {
    testWidgets('PhotoSelecter', (WidgetTester tester) async {
      Widget makeTestable() {
        return MaterialApp(
          home: Scaffold(
            body: PhotoSelecterComplaint(),
          ),
        );
      }

      await tester.pumpWidget(makeTestable());
      expect(find.byKey(Key('adicionarImagem')), findsOneWidget);
    });
  });
}
