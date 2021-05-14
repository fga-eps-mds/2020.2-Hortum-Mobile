import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/components/announcement_box.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:network_image_mock/network_image_mock.dart';

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  String profilePic = 'assets/images/perfil.jpg';
  String name = 'Victor';
  String title = 'titulo';
  List<dynamic> productPic = ['assets/images/banana.jpg'];
  List<String> localizations = ['localizacao'];
  String price = '15.00';
  String description = 'descricao';
  String email = 'joao@gmail.com';
  actualUser.isProductor = false;
  group('Testing AnnouncementDetailsPage:', () {
    Widget makeTestable() {
      return MaterialApp(
          home: AnnouncementBox(
        profilePic: profilePic,
        name: name,
        productPic: productPic,
        title: title,
        localizations: localizations,
        description: description,
        price: price,
        email: email,
      ));
    }

    testWidgets('Testing widgets on AnnouncementDetails',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(makeTestable()));
      expect(find.byType(MaterialButton), findsNWidgets(2));
      expect(find.text(title), findsOneWidget);
    });
    testWidgets('Testing the Announcement Button', (WidgetTester tester) async {
      actualUser.tokenAccess = 'token';
      actualUser.isProductor = true;

      await mockNetworkImagesFor(() => tester.pumpWidget(makeTestable()));
      await tester.tap(find.byKey(Key('announcementDetailsButton')));
      await tester.pumpAndSettle();
      expect(find.text(title), findsOneWidget);
    });
  });
}
