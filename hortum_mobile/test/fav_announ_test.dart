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

  group('Design Tests', () {
    testWidgets('Testing the announcements on FavPage',
        (WidgetTester tester) async {
      actualUser.isProductor = false;
      actualUser.tokenAccess = 'token';
      when(dioMock.get(any, options: anyNamed('options'))).thenAnswer(
          (_) async => Response(data: response, requestOptions: null));
      await tester.pumpWidget(makeTestable());
      await tester.pump();
      expect(find.text('Anúncio Teste'), findsOneWidget);
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
      List<dynamic> productorsResponse = [
        {
          "username": "Usuário Teste",
          "email": "email@email.com",
          "idPicture": null
        }
      ];
      actualUser.isProductor = false;
      actualUser.tokenAccess = 'token';
      when(dioMock.get('http://$ip:8000/customer/favorites/productors',
              options: anyNamed('options')))
          .thenAnswer(
              (_) async => Response(data: response, requestOptions: null));
      when(dioMock.get('http://$ip:8000/customer/favorites/announcements',
              options: anyNamed('options')))
          .thenAnswer((_) async =>
              Response(data: productorsResponse, requestOptions: null));
      await tester.pumpWidget(makeTestable());
      await tester.tap(find.text('Produtores'));
      await tester.pump();
      await tester.pump();
      expect(find.byKey(Key('Usuário Teste key')), findsOneWidget);
    });

    testWidgets('Testing the spin kit while the connection state is not done',
        (WidgetTester tester) async {
      actualUser.isProductor = false;
      actualUser.tokenAccess = 'token';
      when(dioMock.get('http://$ip:8000/customer/favorites/productors',
              options: anyNamed('options')))
          .thenAnswer(
              (_) async => Response(data: response, requestOptions: null));
      when(dioMock.get('http://$ip:8000/customer/favorites/announcements',
              options: anyNamed('options')))
          .thenAnswer((_) async => Response(data: [{}], requestOptions: null));
      await tester.pumpWidget(makeTestable());
      await tester.tap(find.byIcon(Icons.cached));
      await tester.pump();
      expect(find.byKey(Key('spin')), findsOneWidget);
    });
  });
}
