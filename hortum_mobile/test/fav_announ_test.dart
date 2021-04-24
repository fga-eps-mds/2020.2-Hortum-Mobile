import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/announ_data_backend.dart';
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
        "email": "nome11@example.com",
        "username": "jdjd",
        "idPictureProductor": null,
        "name": "fddvtvf dvf",
        "type_of_product": "Abóbora",
        "description": "bdchy",
        "price": 21.8,
        "idPicture": null,
        "likes": 1
      },
      {
        "email": "nome11@example.com",
        "username": "jdjd",
        "idPictureProductor": null,
        "name": "dudhd",
        "type_of_product": "Amora",
        "description": "zuhzhzxh",
        "price": 99.0,
        "idPicture": null,
        "likes": 1
      }
    ]
  };

  dynamic productorsResponse = {
    "idProdFav": [
      {"username": "jdjd", "email": "nome11@example.com", "idPicture": null}
    ]
  };

  Widget makeTestable() {
    return MaterialApp(
      home: FavPage(dio: dioMock),
    );
  }

  group('AnnounDataApi methods tests', () {
    test('Testing method getAnnoun of AnnounDataApi', () async {
      actualUser.tokenAccess = 'token';
      AnnounDataApi announData = AnnounDataApi(dioMock);
      when(dioMock.get(any, options: anyNamed('options'))).thenAnswer(
          (_) async => Response(data: response, requestOptions: null));
      await announData.getFavAnnoun();
      expect(announData.announcements, response['idAnunFav']);
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
      expect(find.text('fddvtvf dvf'), findsOneWidget);
    });

    testWidgets('Testing the change from announcements to productors',
        (WidgetTester tester) async {
      actualUser.isProductor = false;
      actualUser.tokenAccess = 'token';
      when(dioMock.get(any, options: anyNamed('options'))).thenAnswer(
          (_) async => Response(data: response, requestOptions: null));
      await tester.pumpWidget(makeTestable());
      expect(find.byType(FavSelectButton), findsOneWidget);
      await tester.pump();
      expect(find.text('FAVORITOS'), findsOneWidget);
    });

    testWidgets('Testing the productors list on CustomerHomePage',
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
      expect(find.text('jdjd'), findsOneWidget);
    });
  });
}
