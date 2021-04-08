import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/home_productor/home_productor_page.dart';

main() {
  Widget makeTestable(Widget widget) {
    return MaterialApp(
      home: widget,
    );
  }

  testWidgets('Testing dialog to delete Announcement',
      (WidgetTester tester) async {
    ProductorHomePage productorPage = ProductorHomePage();
    actualUser.isProductor = true;
    await tester.pumpWidget(makeTestable(productorPage));

    await tester.tap(find.byIcon(Icons.delete).first);
    await tester.pump();

    expect(find.byKey(Key('removeAnnoun')), findsOneWidget);
  });
}
