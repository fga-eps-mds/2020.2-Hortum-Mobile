import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/advanced_settings/advanced_settings_page.dart';

main() {
  Widget makeTestable() {
    return MaterialApp(
      home: AdvancedSettingsPage(),
    );
  }

  group("Testing AdvancedSettings components:", () {
    testWidgets('Testing the LogoutButton', (WidgetTester tester) async {
      actualUser.isProductor = true;
      await tester.pumpWidget(makeTestable());
      await tester.pumpAndSettle();
      await tester.tap(find.text('SAIR'));
      await tester.pumpAndSettle();
      expect(find.text('ENTRAR'), findsOneWidget);
    });
  });
}
