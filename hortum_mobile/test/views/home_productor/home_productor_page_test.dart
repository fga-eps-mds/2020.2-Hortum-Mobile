import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/home_productor/home_productor_page.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

class DioMock extends Mock implements Dio {}

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final dioMock = DioMock();

  List<dynamic> response = [
    {
      "email": "usuário@gmail.com",
      "username": "Usuário Teste",
      "pictureProductor": "http://localhost:8000/images/perfil.jpg",
      "name": "Folha Verde",
      "type_of_product": "Alface",
      "description": "Alface plantado na fazenda",
      "price": 5.0,
      "images": [
        {"picture": "http://localhost:8000/images/perfil.jpg"}
      ],
      "likes": 0,
      "localizations": ["Lugar", "Outro lugar"]
    },
  ];

  Widget makeTestable() {
    return MaterialApp(
      home: ProductorHomePage(dio: dioMock),
    );
  }

  testWidgets('Testing if the page renders correctly',
      (WidgetTester tester) async {
    actualUser.isProductor = true;
    actualUser.tokenAccess = 'token';
    actualUser.email = 'productor@email.com';
    when(dioMock.get(any, options: anyNamed('options'))).thenAnswer(
        (_) async => Response(data: response, requestOptions: null));
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(makeTestable());
      await tester.pump();
      expect(find.text('MEUS ANÚNCIOS'), findsOneWidget);
    });
  });

  group('Testing component ButtonsRow', () {
    group('Trash icon tests', () {
      testWidgets('Testing dialog to delete announcement',
          (WidgetTester tester) async {
        actualUser.isProductor = true;
        actualUser.tokenAccess = 'token';
        actualUser.email = 'productor@email.com';
        when(dioMock.get(any, options: anyNamed('options'))).thenAnswer(
            (_) async => Response(data: response, requestOptions: null));
        await mockNetworkImagesFor(() async {
          await tester.pumpWidget(makeTestable());
          await tester.pump();
          await tester.tap(find.byIcon(Icons.delete).first);
          await tester.pump();
          expect(find.byKey(Key('removeAnnoun')), findsOneWidget);
        });
      });

      testWidgets("Testing button 'Não' on Dialog",
          (WidgetTester tester) async {
        actualUser.isProductor = true;
        actualUser.tokenAccess = 'token';
        actualUser.email = 'productor@email.com';
        when(dioMock.get(any, options: anyNamed('options'))).thenAnswer(
            (_) async => Response(data: response, requestOptions: null));
        await mockNetworkImagesFor(() async {
          await tester.pumpWidget(makeTestable());
          await tester.pump();
          await tester.tap(find.byIcon(Icons.delete).first);
          await tester.pump();
          await tester.tap(find.text('Não'));
          await tester.pumpAndSettle();

          expect(find.byKey(Key('removeAnnoun')), findsNothing);
          expect(find.text('MEUS ANÚNCIOS'), findsOneWidget);
        });
      });
    });

    group('Edit icon tests', () {
      testWidgets('Testing Navigator to EditPage when clicking edit button',
          (WidgetTester tester) async {
        actualUser.isProductor = true;
        actualUser.tokenAccess = 'token';
        actualUser.email = 'productor@email.com';
        when(dioMock.get(any, options: anyNamed('options'))).thenAnswer(
            (_) async => Response(data: response, requestOptions: null));
        await mockNetworkImagesFor(() async {
          await tester.pumpWidget(makeTestable());
          await tester.pump();
          await tester.tap(find.byIcon(Icons.edit).first);
          await tester.pumpAndSettle();
          expect(find.byKey(Key('salvarAnnoun')), findsOneWidget);
        });
      });
    });
  });
}
