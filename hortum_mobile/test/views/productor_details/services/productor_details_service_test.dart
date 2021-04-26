import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/views/productor_details/services/productor_details_services.dart';

main() {
  dynamic param = [
    {
      "email": "email@gmail.com",
      "username": "Usuário Teste",
      "idPictureProductor": null,
      "name": "Anúncio Teste",
      "type_of_product": "Alface",
      "description": "Alface da fazenda",
      "price": 15.0,
      "idPicture": null,
      "likes": 0
    }
  ];
  testWidgets('Testing the ProductorDetailsService',
      (WidgetTester tester) async {
    Widget result = ProductorDetaislService.completeAnnouncements(param);
    Widget pump = MaterialApp(home: result);
    await tester.pumpWidget(pump);
    expect(find.byKey(Key('columnAnnoun')), findsOneWidget);
  });
}