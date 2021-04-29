import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/profile/profile_page.dart';

void main() {
  UserProfile userProfile = UserProfile();
  actualUser.isProductor = false;

  Widget makeTestableWidget({Widget widget}) {
    return MaterialApp(
      home: widget,
    );
  }

  group('Design Tests', () {
    testWidgets("Render ProfilePage", (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(widget: userProfile));
      expect(find.byKey(Key('profileContent')), findsOneWidget);
    });
  });
}
