import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/productor_favorite_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dioMock = DioMock();
  group('ProductorFavAPI methods tests', () {
    test('Testing method favProductor of ProductorFavAPI', () async {
      ProductorFavAPI prodFavData = ProductorFavAPI(dioMock);
      String responseMatcher = "Produtores favoritos atualizados com sucesso";
      actualUser.tokenAccess = 'token';
      when(dioMock.patch(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: jsonEncode(responseMatcher),
              requestOptions: null,
              statusCode: 200));
      int responseActual = await prodFavData.favProductor('user@email.com');

      expect(responseActual, 200);
    });
  });
}
