import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';

import 'package:hortum_mobile/views/productor_details/productor_details_page.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dioMock = DioMock();

  final List<dynamic> response = [
    {
      "name": "Anúncio Teste",
      "description": "Descrição do anúncio teste",
      "type_of_product": "Banana",
      "price": 15.0,
      "likes": 2,
      "idPicture": null,
      "username": "Usuário Teste",
      "email": "usuario@email.com",
      "idPictureProductor": null,
      "localizations": ["Lugar", "Outro Lugar"]
    }
  ];

  Widget makeTestable() {
    return MaterialApp(
      home: ProductorDetails(
          email: "emailteste@gmail.com", name: "Produtor", dio: dioMock),
    );
  }

  testWidgets('Testing if ProductorDetailsPage renders correctly',
      (WidgetTester tester) async {
    actualUser.isProductor = false;
    actualUser.tokenAccess = 'token';
    when(dioMock.get(any, options: anyNamed('options'))).thenAnswer(
        (_) async => Response(data: response, requestOptions: null));
    await tester.pumpWidget(makeTestable());
    await tester.pumpAndSettle();
    expect(find.byKey(Key('productorDetails')), findsOneWidget);
  });
}
