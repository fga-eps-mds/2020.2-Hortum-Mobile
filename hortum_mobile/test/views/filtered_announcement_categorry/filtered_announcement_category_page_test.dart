import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/announcements/announcements_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/filtered_announcements_categories/filtered_announcements_categories_page.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

class DioMock extends Mock implements Dio {}

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final dioMock = DioMock();
  AnnouncementsApi announcementsApi = AnnouncementsApi(dioMock);

  Widget makeTestable() {
    return MaterialApp(
      home: FilteredAnnounCategoryPage(
        dio: dioMock,
        filter: "Outros",
      ),
    );
  }

  group('AnnounDataApi methods tests', () {
    test('Testing method categoryAnnoun of AnnouncementsApi with filter',
        () async {
      actualUser.tokenAccess = 'token';
      List<dynamic> response = [
        {
          "username": "Usuário Teste",
          "pictureProductor": "$ip/images/perfil.jpg",
          "name": "Anúncio Teste",
          "type_of_product": "Outros",
          "description": "Abelhas",
          "price": 10.0,
          "images": ["$ip/images/perfil.jpg"],
          "localizations": ["Lugar", "Outro Lugar"]
        }
      ];
      when(dioMock.get(any, options: anyNamed('options'))).thenAnswer(
          (_) async => Response(data: response, requestOptions: null));
      await announcementsApi.categoryAnnoun('Outros');
      expect(announcementsApi.announcements, response);
    });
    testWidgets('Testing the announcement_category_page rendering',
        (WidgetTester tester) async {
      List<dynamic> response = [
        {
          "username": "Usuário Teste",
          "pictureProductor": "$ip/images/perfil.jpg",
          "name": "Anúncio Teste",
          "type_of_product": "Outros",
          "description": "Abelhas",
          "price": 10.0,
          "images": ["$ip/images/perfil.jpg"],
          "localizations": ["Lugar", "Outro Lugar"]
        }
      ];
      actualUser.isProductor = false;
      actualUser.tokenAccess = 'token';
      when(dioMock.get(any, options: anyNamed('options'))).thenAnswer(
          (_) async => Response(data: response, requestOptions: null));
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(makeTestable());
        await tester.pump();
        expect(find.text('Outros'), findsOneWidget);
      });
    });
  });
}
