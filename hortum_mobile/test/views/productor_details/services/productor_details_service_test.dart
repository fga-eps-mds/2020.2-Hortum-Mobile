import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/productor_details/services/productor_details_services.dart';
import 'package:network_image_mock/network_image_mock.dart';

main() {
  dynamic param = [
    {
      "email": "email@gmail.com",
      "username": "Usuário Teste",
      "pictureProductor": './assets/images/profile.jpg',
      "name": "Anúncio Teste",
      "type_of_product": "Alface",
      "description": "Alface da fazenda",
      "price": 15.0,
      "images": ["http://localhost:8000/images/perfil.jpg"],
      "likes": 0,
      "localizations": ["Lugar", "Outro Lugar"]
    }
  ];
  testWidgets(
      'Testing the ProductorDetailsService when the productor has announcements',
      (WidgetTester tester) async {
    actualUser.isProductor = false;
    Widget result = ProductorDetaislService.completeAnnouncements(
        param, Size(360.0, 692.0));
    Widget pump = MaterialApp(home: result);
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(pump);
      expect(find.byKey(Key('columnAnnoun')), findsOneWidget);
    });
  });

  testWidgets(
      "Testing the ProductorDetailsService when the productor hasn't announcements",
      (WidgetTester tester) async {
    Widget result =
        ProductorDetaislService.completeAnnouncements([], Size(360.0, 692.0));
    Widget pump = MaterialApp(home: result);
    await tester.pumpWidget(pump);
    expect(
        find.text('Este produtor não possui anúncios disponíveis no momento !'),
        findsOneWidget);
  });
}
