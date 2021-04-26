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
      expect(find.text('Mudar senha'), findsOneWidget);
      expect(find.text('Excluir conta'), findsOneWidget);
      expect(find.text('Sair'), findsOneWidget);
    });
    testWidgets('Testing the LogoutButton', (WidgetTester tester) async {
      actualUser.isProductor = true;
      await tester.pumpWidget(makeTestable());
      await tester.pump();
      await tester.tap(find.text('Sair'));
      await tester.pump();
      await tester.pump();
      expect(find.text('ENTRAR'), findsOneWidget);
    });

    testWidgets('Testing the DeleteAccountButton', (WidgetTester tester) async {
      actualUser.isProductor = true;
      await tester.pumpWidget(makeTestable());
      await tester.pump();
      await tester.tap(find.text('Excluir conta'));
      await tester.pump();
      await tester.pump();
      expect(find.text('EXCLUIR CONTA'), findsOneWidget);
    });

    testWidgets('Testing the ChangePasswordButton',
        (WidgetTester tester) async {
      actualUser.isProductor = true;
      await tester.pumpWidget(makeTestable());
      await tester.pump();
      await tester.tap(find.text('Mudar senha'));
      await tester.pump();
      await tester.pump();
      expect(find.text('MUDAR SENHA'), findsOneWidget);
    });
  });
}
