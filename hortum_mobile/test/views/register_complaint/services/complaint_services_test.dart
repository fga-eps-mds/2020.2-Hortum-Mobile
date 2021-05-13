import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/register_complaint/services/complaint_services.dart';
import 'package:mockito/mockito.dart';
import 'dart:convert';

import 'package:network_image_mock/network_image_mock.dart';

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

  group('Testing RegisterComplaintServices:', () {
    var url = '$ip/complaint/create/';
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

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(makeTestable());
        await tester.tap(find.byKey(Key('botão')));
        await tester.pump();
        await tester.tap(find.byKey(Key('okButton')));

        expect(find.byKey(Key('complaintAlreadyExists')), findsOneWidget);
      });
    });

    testWidgets('Return to CustomerHomePage', (WidgetTester tester) async {
      complaint_picture = null;
      String responseMatcher1 = "";
      List<dynamic> responseMatcher2 = [
        {
          "username": "Usuário Teste",
          "pictureProductor": "http://localhost:8000/images/perfil.jpg",
          "name": "Anúncio Teste",
          "type_of_product": "Abelhas",
          "description": "Abelhas",
          "price": 10.0,
          "images": [
            {"picture": "http://localhost:8000/images/perfil.jpg"}
          ],
          "localizations": ["Lugar", "Outro Lugar"]
        }
      ];

      when(dio.post(url, data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: jsonEncode(responseMatcher1),
              requestOptions: null,
              statusCode: 200));

      when(dio.get(any, options: anyNamed('options'))).thenAnswer(
          (_) async => Response(data: responseMatcher2, requestOptions: null));

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(makeTestable());
        await tester.tap(find.byKey(Key('botão')));
        await tester.pump();
        await tester.pump();
        expect(find.byKey(Key('categoryCarr')), findsOneWidget);
      });
    });
  });
}
