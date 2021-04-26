import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/change_password_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dioMock = DioMock();
  group('Testing class ChangePasswordAPI:', () {
    ChangePasswordAPI changePassword = ChangePasswordAPI(dioMock);
    actualUser.tokenAccess = 'token';
    String responseMatcher = "Senha alterada!";
    test('Change Password Successful', () async {
      when(dioMock.patch(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: jsonEncode(responseMatcher),
              requestOptions: null,
              statusCode: 200));
      int responseActual = await changePassword.changePassword('', '');

      expect(responseActual, 200);
    });
  });
}
