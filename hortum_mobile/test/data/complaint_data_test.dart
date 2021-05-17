import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/complaint_data_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  TestWidgetsFlutterBinding.ensureInitialized();
  actualUser.tokenAccess = 'token';
  actualUser.isProductor = false;

  group('Testing complaints data:', () {
    ComplaintDataAPI complaintDataApi = ComplaintDataAPI(dio);
    actualUser.tokenAccess = 'token';
    actualUser.isProductor = false;
    complaint_picture = File('./assets/images/perfil.jpg');

    test('registerComplaint', () async {
      String responseMatcher = '';

      when(dio.post(any, data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: jsonEncode(responseMatcher),
              requestOptions: null,
              statusCode: 200));
      int responseActual = await complaintDataApi.registerComplaint(
          name: '', description: '', emailProductor: '');

      expect(responseActual, 200);
    });

    test('listComplaint', () async {
      ComplaintDataAPI complaintDataApi = ComplaintDataAPI(dio);
      String emailProductor = 'productor@teste.com';
      List<dynamic> responseMatcher = [
        {
          'author': "user",
          'description': 'description',
        }
      ];
      List<dynamic> responseActual = [
        {
          'author': "user",
          'description': 'description',
        }
      ];

      when(dio.get(any, options: anyNamed('options'))).thenAnswer((_) async =>
          Response(
              data: responseMatcher, requestOptions: null, statusCode: 200));
      await complaintDataApi.listComplaint(emailProductor: emailProductor);

      expect(responseActual, responseMatcher);
    });
  });
}
