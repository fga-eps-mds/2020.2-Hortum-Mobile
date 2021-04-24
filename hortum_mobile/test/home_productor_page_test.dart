import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/prod_log_data_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/home_productor/home_productor_page.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final dioMock = DioMock();

  List<dynamic> response = [
    {
      "email": "usuário@gmail.com",
      "username": "Usuário Teste",
      "idPictureProductor": null,
      "name": "Folha Verde",
      "type_of_product": "Alface",
      "description": "Alface plantado na fazenda",
      "price": 5.0,
      "idPicture": null,
      "likes": 0
    },
  ];

  Widget makeTestable() {
    return MaterialApp(
      home: ProductorHomePage(dio: dioMock),
    );
  }

  testWidgets('Testing dialog to delete Announcement',
      (WidgetTester tester) async {
    actualUser.isProductor = true;
    actualUser.tokenAccess = 'token';
    actualUser.email = 'productor@email.com';
    when(dioMock.get(any, options: anyNamed('options'))).thenAnswer(
        (_) async => Response(data: response, requestOptions: null));
    await tester.pumpWidget(makeTestable());
    await tester.pump();
    await tester.tap(find.byIcon(Icons.delete).first);
    await tester.pump();

    expect(find.byKey(Key('removeAnnoun')), findsOneWidget);
  });

  test('Testing the method manipulateData on ProdLoggedAnnounDataApi', () {
    ProdLoggedAnnounDataApi announProd = ProdLoggedAnnounDataApi();
    dynamic element = {
      "username": "Usuário Teste",
      "email": "usuário@gmail.com",
      "idPicture": null,
      "announcements": [
        {
          "username": "Usuário Teste",
          "idPictureProductor": null,
          "name": "Folha Verde",
          "type_of_product": "Alface",
          "description": "Alface plantado na fazenda",
          "price": 5.0,
          "idPicture": null
        }
      ]
    };
    announProd.announcements = element['announcements'];

    announProd.manipulateData();

    expect(announProd.announcements[0]['price'], "R\$ 5,00");
    expect(announProd.announcements[0]['username'], "Usuário");
  });
}
