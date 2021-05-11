import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/register_backend.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dioMock = DioMock();
  RegisterApi registerApi = RegisterApi(dioMock);

  group('RegisterApi register customer', () {
    dynamic response = {"msg": "User created"};
    testWidgets('Testing the method register on RegisterApi',
        (WidgetTester tester) async {
      when(dioMock.post(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async =>
              Response(data: response, requestOptions: null, statusCode: 201));
      Response result = await registerApi.register(
          "username", "email@gmail.com", "123456", "12345678910", false);

      expect(result.data, {"msg": "User created"});
    });
  });

  group('RegisterApi register productor', () {
    dynamic response = {"msg": "User created"};
    testWidgets('Testing the method register on RegisterApi',
        (WidgetTester tester) async {
      when(dioMock.post(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async =>
              Response(data: response, requestOptions: null, statusCode: 201));
      Response result = await registerApi.register(
          "username", "email@gmail.com", "123456", "12345678910", true);

      expect(result.data, {"msg": "User created"});
    });
  });
}
