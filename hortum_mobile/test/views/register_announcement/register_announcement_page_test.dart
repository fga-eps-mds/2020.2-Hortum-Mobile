import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/register_announcement/announcement_register_page.dart';

main() {
  Widget makeTestable() {
    return MaterialApp(
      home: RegisterAnnounPage(),
    );
  }

  testWidgets('Testing if RegisterAnnouncementPage renders correctly',
      (WidgetTester tester) async {
    actualUser.isProductor = true;
    await tester.pumpWidget(makeTestable());
    await tester.pump();
    expect(find.byKey(Key('registerAnnouncementForm')), findsOneWidget);
  });
}
