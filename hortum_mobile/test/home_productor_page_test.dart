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

  dynamic response = {
    "username": "victor",
    "email": "victor@gmail.com",
    "idPicture": "uma ai",
    "announcements": {
      "username": "victor",
      "idPictureProductor": "uma ai",
      "name": "folha Verde",
      "type_of_product": "Alface",
      "description": "nao aguento mais",
      "price": 5.0,
      "idPicture": "uma ai"
    }
  };

  Widget makeTestable() {
    return MaterialApp(
      home: ProductorHomePage(dio: dioMock),
    );
  }

  testWidgets('Testing dialog to delete Announcement',
      (WidgetTester tester) async {
    actualUser.isProductor = true;
    actualUser.tokenAccess = 'token';
    when(dioMock.get(any, options: anyNamed('options'))).thenAnswer(
        (_) async => Response(data: response, requestOptions: null));
    await tester.pumpWidget(makeTestable());
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();

    expect(find.byKey(Key('removeAnnoun')), findsOneWidget);
  });

  test('Testing the information of the productor logged', () {
    ProdLoggedAnnounDataApi announProd = ProdLoggedAnnounDataApi();
    dynamic element = {
      "username": "victor",
      "email": "victor@gmail.com",
      "idPicture": "uma ai",
      "announcements": {
        "username": "victor",
        "idPictureProductor": "uma ai",
        "name": "folha Verde",
        "type_of_product": "Alface",
        "description": "nao aguento mais",
        "price": 5.0,
        "idPicture": "uma ai"
      }
    };
    announProd.productor = element;

    announProd.manipulateData();

    expect(response, announProd.productor);
  });
}
