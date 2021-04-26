import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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
}
