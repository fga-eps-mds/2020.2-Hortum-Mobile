import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/favorites/components/select_favorite_button.dart';
import 'package:hortum_mobile/views/favorites/fav_page.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

class DioMock extends Mock implements Dio {}

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final dioMock = DioMock();

  dynamic response = {
    "idAnunFav": [
      {
        "username": "Usuário Teste",
        "pictureProductor": "$ip/images/perfil.jpg",
        "name": "Abóbora Japonesa",
        "type_of_product": "Abóbora Japonesa",
        "description": "Abelhas",
        "price": 10.0,
        "images": ["$ip/images/perfil.jpg"],
        "localizations": ["Lugar"]
      },
      {
        "username": "Usuário Teste",
        "pictureProductor": "$ip/images/perfil.jpg",
        "name": "Amora Silvestre",
        "type_of_product": "Abelhas",
        "description": "Abelhas",
        "price": 10.0,
        "images": ["$ip/images/perfil.jpg"],
        "localizations": ["Lugar"]
      }
    ]
  };

  dynamic productorsResponse = {
    "idProdFav": [
      {
        "username": "Usuário Teste",
        "email": "email@email.com",
        "profile_picture": 'http://localhost:8000/images/perfil.jpg'
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
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(makeTestable());
        await tester.pump();
        expect(find.text('Amora Silvestre'), findsOneWidget);
      });
    });

    testWidgets('Testing the FavPage rendering', (WidgetTester tester) async {
      actualUser.isProductor = false;
      actualUser.tokenAccess = 'token';
      when(dioMock.get(any, options: anyNamed('options'))).thenAnswer(
          (_) async => Response(data: response, requestOptions: null));
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(makeTestable());
        expect(find.byType(FavSelectButton), findsOneWidget);
        await tester.pump();
        expect(find.text('FAVORITOS'), findsOneWidget);
      });
    });

    testWidgets(
        'Testing the productors list on CustomerHomePage and announcements after',
        (WidgetTester tester) async {
      actualUser.isProductor = false;
      actualUser.tokenAccess = 'token';
      when(dioMock.get('$ip/customer/favorites/productors', options: anyNamed('options'))).thenAnswer(
          (_) async =>
              Response(data: productorsResponse, requestOptions: null));
      when(dioMock.get('$ip/customer/favorites/announcements', options: anyNamed('options'))).thenAnswer(
          (_) async => Response(data: response, requestOptions: null));
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(makeTestable());
        await tester.tap(find.text('Produtores'));
        await tester.pumpAndSettle();
        expect(find.text('Usuário Teste'), findsOneWidget);
        await tester.tap(find.text('Anúncios'));
        await tester.pump();
        await tester.pump();
        expect(find.text('Abóbora Japonesa'), findsOneWidget);
      });
    });
  });
}
