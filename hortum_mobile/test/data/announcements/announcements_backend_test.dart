import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/announcements/announcements_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dioMock = DioMock();
  AnnouncementsApi announcementsApi = AnnouncementsApi(dioMock);

  List<dynamic> response = [
    {
      "username": "Usuário Teste",
      "idPictureProductor": null,
      "name": "Anúncio Teste",
      "type_of_product": "Abelhas",
      "description": "Abelhas",
      "price": 10.0,
      "idPicture": null,
      "localizations": ["Lugar", "Outro Lugar"]
    }
  ];

  group('AnnouncementsApi getData', () {
    test('Given a list of announcements manipulate correctly the data', () {
      dynamic element = {
        "username": "Usuário Teste",
        "idPictureProductor": null,
        "name": "Anúncio Teste",
        "type_of_product": "Banana",
        "description": "Descrição teste",
        "price": 15.0,
        "idPicture": null,
        "localizations": ["Lugar", "Outro Lugar"]
      };

      announcementsApi.announcements.add(element);

      announcementsApi.manipulateData();
      dynamic result = {
        "username": "Usuário",
        "idPictureProductor": null,
        "name": "Anúncio Teste",
        "type_of_product": "Banana",
        "description": "Descrição teste",
        "price": "R\$ 15,00",
        "idPicture": null,
        "localizations": ["Lugar", "Outro Lugar"]
      };
      expect(result, announcementsApi.announcements[0]);
    });

    test('Testing method getAnnoun of AnnouncementsApi without filter',
        () async {
      actualUser.tokenAccess = 'token';
      when(dioMock.get(any, options: anyNamed('options'))).thenAnswer(
          (_) async => Response(data: response, requestOptions: null));
      await announcementsApi.getAnnoun('', '');
      expect(announcementsApi.announcements, response);
    });

    test('Testing method getAnnoun of AnnouncementsApi with filter', () async {
      actualUser.tokenAccess = 'token';
      List<dynamic> response = [
        {
          "username": "Usuário Teste",
          "idPictureProductor": null,
          "name": "Anúncio Teste",
          "type_of_product": "Abelhas",
          "description": "Abelhas",
          "price": 10.0,
          "idPicture": null,
          "localizations": ["Lugar", "Outro Lugar"]
        }
      ];
      when(dioMock.get(any, options: anyNamed('options'))).thenAnswer(
          (_) async => Response(data: response, requestOptions: null));
      await announcementsApi.getAnnoun('Banana', 'name');
      expect(announcementsApi.announcements, response);
    });

    test('Testing method manipulateData of AnnouncementsApi', () async {
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
      announcementsApi.announcements = response;
      announcementsApi.manipulateData();
      response[0]['username'] = "Usuário";
      response[0]['price'] = "R\$ 10,00";
      expect(announcementsApi.announcements, response);
    });
  });

  group('AnnouncementsApi deleteAnnoun', () {
    test('Testing method deleteAnnoun from AnnouncementsApi', () async {
      actualUser.tokenAccess = 'token';
      when(dioMock.delete(any, options: anyNamed('options'))).thenAnswer(
          (_) async => Response(requestOptions: null, statusCode: 200));
      int statusCode = await announcementsApi.deleteAnnoun('Teste');
      expect(200, statusCode);
    });
  });

  group('AnnouncementsApi editAnnoun', () {
    test('Testing method editAnnoun from AnnouncementsApi', () async {
      var url = '$ip/announcement/update/Banana';

      actualUser.tokenAccess = 'token';
      String responseMatcher = 'Anuncio editado';
      String name = 'Banana prata';
      double preco = 12.90;

      when(dioMock.patch(url,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: jsonEncode(responseMatcher),
              requestOptions: null,
              statusCode: 200));
      var responseActual = await announcementsApi.editAnnoun('Banana',
          name: name,
          price: preco,
          localizations: [TextEditingController(text: 'brasilia')]);

      expect(responseActual.statusCode, 200);
    });
  });

  group('AnnouncementsApi registerAnnoun', () {
    dynamic response = {"msg": "Announcement created"};
    Map request = {
      "email": "email@teste.com",
      "name": "Teste",
      "description": "Decrição de anúncio teste",
      "price": 15.0,
      "type_of_product": "Alface",
      "localizations": [TextEditingController(text: "Lugar")]
    };
    test('Testing the method registerAnnoun on RegisterAnnounApi', () async {
      actualUser.tokenAccess = 'token';
      actualUser.email = "email@teste.com";

      when(dioMock.post(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async =>
              Response(data: response, requestOptions: null, statusCode: 200));
      Response result = await announcementsApi.registerAnnoun(
          request['name'],
          request['description'],
          request['localizations'],
          request['price'],
          request['type_of_product']);
      expect(result.data['msg'], "Announcement created");
    });
  });
}
