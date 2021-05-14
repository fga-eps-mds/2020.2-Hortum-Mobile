import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/announ_favorite_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dioMock = DioMock();
  group('AnnounFavAPI methods tests', () {
    test('Testing method favAnnoun of AnnounFavAPI', () async {
      AnnounFavAPI announFavData = AnnounFavAPI(dioMock);
      String responseMatcher = "Anúncio atualizado com sucesso";
      actualUser.tokenAccess = 'token';
      when(dioMock.patch(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: jsonEncode(responseMatcher),
              requestOptions: null,
              statusCode: 200));
      int responseActual =
          await announFavData.favAnnoun('user@email.com', 'Melancia');

      expect(responseActual, 200);
    });
  });
}
