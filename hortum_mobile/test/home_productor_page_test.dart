import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/prod_log_data_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/home_productor/home_productor_page.dart';

main() {
  Widget makeTestable(Widget widget) {
    return MaterialApp(
      home: widget,
    );
  }

  testWidgets('Testing dialog to delete Announcement',
      (WidgetTester tester) async {
    ProductorHomePage productorPage = ProductorHomePage();
    actualUser.isProductor = true;
    await tester.pumpWidget(makeTestable(productorPage));

    await tester.tap(find.byIcon(Icons.delete).first);
    await tester.pump();

    expect(find.byKey(Key('removeAnnoun')), findsOneWidget);
  });

  test('Testing the informations of the productor logged', () {
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
    dynamic result = {
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

    expect(result, announProd.productor);
  });
}
