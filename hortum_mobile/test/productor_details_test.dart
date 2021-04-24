import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/productor_details_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/productor_details/services/productor_details_services.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final dioMock = DioMock();

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

  group('Testing ProductorDetails Api Backend', () {
    test('Testing the ProductorDetailsApi', () async {
      ProductorsDetailsApi prodData = ProductorsDetailsApi(dioMock);
      when(dioMock.get(any, options: anyNamed('options')))
          .thenAnswer((_) async => Response(data: param, requestOptions: null));
      actualUser.tokenAccess = 'token';
      await prodData.getDetails("email@teste.com");
      expect(prodData.announcements, param);
    });

    testWidgets('Testing the ProductorDetailsService',
        (WidgetTester tester) async {
      actualUser.isProductor = false;
      Widget result = ProductorDetaislService.completeAnnouncements(param);
      Widget pump = MaterialApp(home: result);
      await tester.pumpWidget(pump);
      expect(find.byKey(Key('columnAnnoun')), findsOneWidget);
    });
  });
}
