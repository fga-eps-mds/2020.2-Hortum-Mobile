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

  group('Design Tests', () {
    testWidgets('Testing the AdvancedSettingsPage rendering',
        (WidgetTester tester) async {
      actualUser.isProductor = true;
      await tester.pumpWidget(makeTestable());
      await tester.pump();
      expect(find.text('AVANÇADO'), findsOneWidget);
      expect(find.text('MUDAR SENHA'), findsOneWidget);
      expect(find.text('EXCLUIR CONTA'), findsOneWidget);
      expect(find.text('SAIR'), findsOneWidget);
    });
  });
}
