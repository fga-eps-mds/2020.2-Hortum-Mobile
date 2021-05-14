import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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
        "likes": 1,
        "localizations": ["Lugar", "Outro Lugar"]
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
        "likes": 1,
        "localizations": ["Lugar", "Outro Lugar"]
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
