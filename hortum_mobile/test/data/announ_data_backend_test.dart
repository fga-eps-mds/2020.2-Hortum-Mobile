import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/announ_data_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dioMock = DioMock();
  List<dynamic> response = [
    {
      "username": "Usuário Teste",
      "idPictureProductor": null,
      "name": "Anúncio Teste",
      "type_of_product": "Abelhas",
      "description": "Abelhas",
      "price": 10.0,
      "idPicture": null
    }
  ];

  group('AnnounDataApi', () {
    test('Given a list of announcements manipulate correctly the data', () {
      AnnounDataApi annouData = new AnnounDataApi();
      dynamic element = {
        "username": "Usuário Teste",
        "idPictureProductor": null,
        "name": "Anúncio Teste",
        "type_of_product": "Banana",
        "description": "Descrição teste",
        "price": 15.0,
        "idPicture": null
      };

      annouData.announcements.add(element);

      annouData.manipulateData();
      dynamic result = {
        "username": "Usuário",
        "idPictureProductor": null,
        "name": "Anúncio Teste",
        "type_of_product": "Banana",
        "description": "Descrição teste",
        "price": "R\$ 15,00",
        "idPicture": null
      };
      expect(result, annouData.announcements[0]);
    });

    test('Testing method getAnnoun of AnnounDataApi', () async {
      actualUser.tokenAccess = 'token';
      AnnounDataApi announData = AnnounDataApi(dioMock);
      when(dioMock.get(any, options: anyNamed('options'))).thenAnswer(
          (_) async => Response(data: response, requestOptions: null));
      await announData.getAnnoun('');
      expect(announData.announcements, response);
    });

    test('Testing method manipulateData of AnnounDataApi', () async {
      List<dynamic> response = [
        {
          "username": "Usuário Teste",
          "idPictureProductor": null,
          "name": "Anúncio Teste",
          "type_of_product": "Abelhas",
          "description": "Abelhas",
          "price": 10.0,
          "idPicture": null
        }
      ];
      AnnounDataApi announData = AnnounDataApi();
      announData.announcements = response;
      announData.manipulateData();
      response[0]['username'] = "Usuário";
      response[0]['price'] = "R\$ 10,00";
      expect(announData.announcements, response);
    });
  });
}
