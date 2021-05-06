import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/home_customer/home_customer_page.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

class DioMock extends Mock implements Dio {}

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final dioMock = DioMock();

  List<dynamic> response = [
    {
      "username": "Usuário Teste",
      "pictureProductor": "http://localhost:8000/images/perfil.jpg",
      "name": "Anúncio Teste",
      "type_of_product": "Abelhas",
      "description": "Abelhas",
      "price": 10.0,
      "images": [
        {"picture": "http://localhost:8000/images/perfil.jpg"}
      ]
    }
  ];

  Widget makeTestable() {
    return MaterialApp(
      home: CustomerHomePage(dio: dioMock),
    );
  }

  group('Design Tests', () {
    testWidgets('Testing the announcements on CustomerHomePage',
        (WidgetTester tester) async {
      actualUser.isProductor = false;
      actualUser.tokenAccess = 'token';
      when(dioMock.get(any, options: anyNamed('options'))).thenAnswer(
          (_) async => Response(data: response, requestOptions: null));
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(makeTestable());
        await tester.pump();
        expect(find.text('Anúncio Teste'), findsOneWidget);
      });
    });

    testWidgets('Testing the state when response is empty on CustomerHomePage',
        (WidgetTester tester) async {
      actualUser.isProductor = false;
      actualUser.tokenAccess = 'token';
      when(dioMock.get(any, options: anyNamed('options')))
          .thenAnswer((_) async => Response(data: [], requestOptions: null));
      await tester.pumpWidget(makeTestable());
      await tester.pump();
      expect(
          find.text(
              'Infelizmente!!\nNão encontramos nenhum resultado para a sua busca'),
          findsOneWidget);
    });

    testWidgets('Testing the change from announcements to productors',
        (WidgetTester tester) async {
      actualUser.isProductor = false;
      actualUser.tokenAccess = 'token';
      when(dioMock.get(any, options: anyNamed('options'))).thenAnswer(
          (_) async => Response(data: response, requestOptions: null));
      await tester.pumpWidget(makeTestable());
      await tester.tap(find.byIcon(Icons.cached));
      await tester.pump();
      expect(find.text('Produtores'), findsOneWidget);
    });

    testWidgets('Testing the productors list on CustomerHomePage',
        (WidgetTester tester) async {
      List<dynamic> productorsResponse = [
        {
          "username": "Usuário Teste",
          "email": "email@email.com",
          "profile_picture": 'http://localhost:8000/images/perfil.jpg'
        }
      ];
      actualUser.isProductor = false;
      actualUser.tokenAccess = 'token';
      when(dioMock.get('http://$ip:8000/announcement/list',
              options: anyNamed('options')))
          .thenAnswer(
              (_) async => Response(data: response, requestOptions: null));
      when(dioMock.get('http://$ip:8000/productor/list',
              options: anyNamed('options')))
          .thenAnswer((_) async =>
              Response(data: productorsResponse, requestOptions: null));
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(makeTestable());
        await tester.tap(find.byIcon(Icons.cached));
        await tester.pump();
        await tester.pump();
        expect(find.byKey(Key('Usuário Teste key')), findsOneWidget);
      });
    });

    testWidgets('Testing an empty list of productors on CustomerHomePage',
        (WidgetTester tester) async {
      actualUser.isProductor = false;
      actualUser.tokenAccess = 'token';
      when(dioMock.get('http://$ip:8000/announcement/list',
              options: anyNamed('options')))
          .thenAnswer(
              (_) async => Response(data: response, requestOptions: null));
      when(dioMock.get('http://$ip:8000/productor/list',
              options: anyNamed('options')))
          .thenAnswer((_) async => Response(data: [], requestOptions: null));
      await tester.pumpWidget(makeTestable());
      await tester.tap(find.byIcon(Icons.cached));
      await tester.pump();
      await tester.pump();
      expect(find.byKey(Key('noProductors')), findsOneWidget);
    });

    testWidgets('Testing the spin kit while the connection state is not done',
        (WidgetTester tester) async {
      actualUser.isProductor = false;
      actualUser.tokenAccess = 'token';
      when(dioMock.get('http://$ip:8000/announcement/list',
              options: anyNamed('options')))
          .thenAnswer(
              (_) async => Response(data: response, requestOptions: null));
      when(dioMock.get('http://$ip:8000/productor/list',
              options: anyNamed('options')))
          .thenAnswer((_) async => Response(data: [{}], requestOptions: null));
      await tester.pumpWidget(makeTestable());
      await tester.tap(find.byIcon(Icons.cached));
      await tester.pump();
      expect(find.byKey(Key('spin')), findsOneWidget);
    });
  });
}
