import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/announ_data_backend.dart';
import 'package:hortum_mobile/data/announ_favorite_backend.dart';
import 'package:hortum_mobile/data/productor_favorite_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/favorites/components/select_favorite_button.dart';
import 'package:hortum_mobile/views/favorites/fav_page.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final dioMock = DioMock();

  dynamic response = {
    "idAnunFav": [
      {
        "email": "usuario@example.com",
        "username": "usuario1",
        "idPictureProductor": null,
        "name": "Abóbora Japonesa",
        "type_of_product": "Abóbora",
        "description": "Abóbora Japonesa, unidade",
        "price": 6.9,
        "idPicture": null,
        "likes": 1
      },
      {
        "email": "usuario2@example.com",
        "username": "usuario2",
        "idPictureProductor": null,
        "name": "Amora Silvestre",
        "type_of_product": "Amora",
        "description": "Amora Silvestre, dúzia",
        "price": 25.4,
        "idPicture": null,
        "likes": 1
      }
    ]
  };

  dynamic productorsResponse = {
    "idProdFav": [
      {
        "username": "usuario2",
        "email": "usuario2@example.com",
        "idPicture": null
      }
    ]
  };

  Widget makeTestable() {
    return MaterialApp(
      home: FavPage(isAnnouncement: true, dio: dioMock),
    );
  }

  group('AnnounDataApi methods tests', () {
    test('Testing method getFavAnnoun of AnnounDataApi', () async {
      actualUser.tokenAccess = 'token';
      AnnounDataApi announData = AnnounDataApi(dioMock);
      when(dioMock.get(any, options: anyNamed('options'))).thenAnswer(
          (_) async => Response(data: response, requestOptions: null));
      await announData.getFavAnnoun();
      expect(announData.announcements, response['idAnunFav']);
    });
  });

  group('ProductorFavAPI methods tests', () {
    test('Testing method favProductor of ProductorFavAPI', () async {
      ProductorFavAPI prodFavData = ProductorFavAPI(dioMock);
      String responseMatcher = "Produtores favoritos atualizados com sucesso";
      actualUser.tokenAccess = 'token';
      when(dioMock.patch(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: jsonEncode(responseMatcher),
              requestOptions: null,
              statusCode: 200));
      int responseActual = await prodFavData.favProductor('user@email.com');

      expect(responseActual, 200);
    });
  });

  group('AnnounFavAPI methods tests', () {
    test('Testing method favAnnoun of AnnounFavAPI', () async {
      AnnounFavAPI announFavData = AnnounFavAPI(dioMock);
      String responseMatcher = "Anúncio atualizado com sucesso";
      actualUser.tokenAccess = 'token';
      when(dioMock.patch(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: jsonEncode(responseMatcher),
              requestOptions: null,
              statusCode: 200));
      int responseActual =
          await announFavData.favAnnoun('user@email.com', 'Melancia');

      expect(responseActual, 200);
    });
  });

  group('Design Tests', () {
    testWidgets('Testing the announcements on FavPage',
        (WidgetTester tester) async {
      actualUser.isProductor = false;
      actualUser.tokenAccess = 'token';
      when(dioMock.get(any, options: anyNamed('options'))).thenAnswer(
          (_) async => Response(data: response, requestOptions: null));
      await tester.pumpWidget(makeTestable());
      await tester.pump();
      expect(find.text('Amora Silvestre'), findsOneWidget);
    });

    testWidgets('Testing the FavPage rendering', (WidgetTester tester) async {
      actualUser.isProductor = false;
      actualUser.tokenAccess = 'token';
      when(dioMock.get(any, options: anyNamed('options'))).thenAnswer(
          (_) async => Response(data: response, requestOptions: null));
      await tester.pumpWidget(makeTestable());
      expect(find.byType(FavSelectButton), findsOneWidget);
      await tester.pump();
      expect(find.text('FAVORITOS'), findsOneWidget);
    });

    testWidgets(
        'Testing the productors list on CustomerHomePage and announcements after',
        (WidgetTester tester) async {
      actualUser.isProductor = false;
      actualUser.tokenAccess = 'token';
      when(dioMock.get('http://$ip:8000/customer/favorites/productors',
              options: anyNamed('options')))
          .thenAnswer((_) async =>
              Response(data: productorsResponse, requestOptions: null));
      when(dioMock.get('http://$ip:8000/customer/favorites/announcements',
              options: anyNamed('options')))
          .thenAnswer(
              (_) async => Response(data: response, requestOptions: null));
      await tester.pumpWidget(makeTestable());
      await tester.tap(find.text('Produtores'));
      await tester.pump();
      await tester.pump();
      expect(find.text('usuario2'), findsOneWidget);
      await tester.tap(find.text('Anúncios'));
      await tester.pump();
      await tester.pump();
      expect(find.text('Abóbora Japonesa'), findsOneWidget);
    });
  });
}
