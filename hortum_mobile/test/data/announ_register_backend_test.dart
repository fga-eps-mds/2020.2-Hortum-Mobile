import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/announ_register_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dioMock = DioMock();
  dynamic response = {"msg": "Announcement created"};
  Map request = {
    "email": "email@teste.com",
    "name": "Teste",
    "description": "Decrição de anúncio teste",
    "price": 15.0,
    "type_of_product": "Alface"
  };

  test('Testing the method registerAnnoun on RegisterAnnounApi', () async {
    RegisterAnnounApi registerAnnounApi = RegisterAnnounApi(dioMock);
    actualUser.tokenAccess = 'token';
    actualUser.email = "email@teste.com";

    when(dioMock.post(any,
            data: anyNamed('data'), options: anyNamed('options')))
        .thenAnswer((_) async =>
            Response(data: response, requestOptions: null, statusCode: 200));
    Response result = await registerAnnounApi.registerAnnoun(request['name'],
        request['description'], request['price'], request['type_of_product']);
    expect(result.data['msg'], "Announcement created");
  });
}
