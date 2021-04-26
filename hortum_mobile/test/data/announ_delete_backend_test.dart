import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/announ_delete_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dioMock = DioMock();
  test('Testing method deleteAnnoun from DeleteAnnounApi', () async {
    DeleteAnnounApi deleteAnnounApi = DeleteAnnounApi(dioMock);
    actualUser.tokenAccess = 'token';
    when(dioMock.delete(any, options: anyNamed('options'))).thenAnswer(
        (_) async => Response(requestOptions: null, statusCode: 200));
    int statusCode = await deleteAnnounApi.deleteAnnoun('Teste');
    expect(200, statusCode);
  });
}
