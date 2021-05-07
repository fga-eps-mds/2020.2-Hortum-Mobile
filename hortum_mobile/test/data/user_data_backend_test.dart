import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/user_data_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dioMock = DioMock();
  group('Testing UserAPI:', () {
    UserAPI userAPI = UserAPI(dioMock);
    actualUser.tokenAccess = 'token';
    test('Change Password Successful', () async {
      String responseMatcher = "Senha alterada!";
      when(dioMock.patch(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: jsonEncode(responseMatcher),
              requestOptions: null,
              statusCode: 200));
      int responseActual = await userAPI.changePassword('', '');

      expect(responseActual, 200);
    });

    test('Update User Successful', () async {
      String responseMatcher = 'Dados alterados';
      controllerPicture.newPictureNotifier.value =
          File('./assets/images/perfil.jpg');
      when(dioMock.patch(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: jsonEncode(responseMatcher),
              requestOptions: null,
              statusCode: 200));
      Response responseActual =
          await userAPI.updateUser(email: '', username: '');

      expect(responseActual.statusCode, 200);
    });

    test('Delete User Successful', () async {
      when(dioMock.delete(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer(
              (_) async => Response(requestOptions: null, statusCode: 204));
      Response responseExp = await userAPI.deleteUser('123');

      expect(responseExp.statusCode, 204);
    });
  });
}
