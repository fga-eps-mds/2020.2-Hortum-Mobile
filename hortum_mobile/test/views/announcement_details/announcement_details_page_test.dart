import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/announcement_details/announcement_details_page.dart';
import 'package:hortum_mobile/views/announcement_details/components/custom_carrousel.dart';
import 'package:hortum_mobile/views/announcement_details/components/localization_container.dart';
import 'package:hortum_mobile/views/announcement_details/components/price_container.dart';
import 'package:hortum_mobile/views/announcement_details/components/title_buttons_row.dart';

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  String profilePic = 'assets/images/perfil.jpg';
  String name = 'Victor';
  String title = 'titulo';
  String productPic = 'assets/images/banana.jpg';
  String localization = 'localizacao';
  String price = '15.00';
  String description = 'descricao';
  String email = 'victor@gmail.com';
  actualUser.isProductor = false;
  group('Testing AnnouncementDetailsPage:', () {
    Widget makeTestable() {
      return MaterialApp(
          home: AnnouncementDetails(
        email: email,
        profilePic: profilePic,
        name: name,
        productPic: productPic,
        title: title,
        localization: localization,
        description: description,
        price: price,
      ));
    }

    testWidgets('Testing widgets on AnnouncementDetails',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable());
      expect(find.byType(TitleButtonsRow), findsOneWidget);
      expect(find.byType(PriceContainer), findsOneWidget);
      expect(find.byType(LocalizationContainer), findsOneWidget);
      expect(find.byType(CustomCarrousel), findsOneWidget);
      expect(find.byType(MaterialButton), findsNWidgets(6));
    });
    testWidgets('Testing the Return Button', (WidgetTester tester) async {
      actualUser.tokenAccess = 'token';
      actualUser.isProductor = true;

      await tester.pumpWidget(makeTestable());
      await tester.tap(find.byKey(Key('announcementReturn')));
      await tester.pumpAndSettle();
      expect(find.text('MEUS ANÚNCIOS'), findsOneWidget);
    });
  });
}
