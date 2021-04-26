import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/announ_edit_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final mockDio = DioMock();
  test('Testing EditAnnounApi class', () async {
    var url = 'http://$ip:8000/announcement/update/Banana';

    EditAnnounApi editAnnoun = EditAnnounApi(mockDio);
    actualUser.tokenAccess = 'token';
    String responseMatcher = 'Anuncio editado';
    String name = 'Banana prata';
    double preco = 12.90;

    when(mockDio.patch(url,
            data: anyNamed('data'), options: anyNamed('options')))
        .thenAnswer((_) async => Response(
            data: jsonEncode(responseMatcher),
            requestOptions: null,
            statusCode: 200));
    var responseActual =
        await editAnnoun.editAnnoun('Banana', name: name, price: preco);

    expect(responseActual.statusCode, 200);
  });
}
