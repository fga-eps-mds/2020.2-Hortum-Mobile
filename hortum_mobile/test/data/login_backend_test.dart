import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/login_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/model/user.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dioMock = DioMock();
  LoginApi loginApi = LoginApi(dioMock);
  User userMatcher;

  testWidgets("Test LoginApi", (WidgetTester tester) async {
    String email = 'teste@gmail.com';
    String password = 'senha';
    dynamic responseMatcher = {
      'email': 'teste@gmail.com',
      'password': 'senha',
      'access': 'abc',
      'refresh': 'cba',
      'username': 'teste',
      'is_productor': false,
    };
    when(dioMock.post(any,
            data: anyNamed('data'), options: anyNamed('options')))
        .thenAnswer((_) async => Response(
            data: responseMatcher, requestOptions: null, statusCode: 200));

    userMatcher = await loginApi.login(email, password);

    expect(actualUser.email, userMatcher.email);
    expect(actualUser.password, userMatcher.password);
    expect(actualUser.username, userMatcher.username);
    expect(actualUser.tokenAccess, userMatcher.tokenAccess);
    expect(actualUser.tokenRefresh, userMatcher.tokenRefresh);
    expect(actualUser.isProductor, userMatcher.isProductor);
  });
}
