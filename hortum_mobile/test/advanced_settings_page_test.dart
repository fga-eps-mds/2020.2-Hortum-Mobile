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
    testWidgets('Testing the LogoutButton', (WidgetTester tester) async {
      actualUser.isProductor = true;
      await tester.pumpWidget(makeTestable());
      await tester.pumpAndSettle();
      await tester.tap(find.text('SAIR'));
      await tester.pumpAndSettle();
      expect(find.text('ENTRAR'), findsOneWidget);
    });

    testWidgets('Testing the DeleteAccountButton', (WidgetTester tester) async {
      actualUser.isProductor = true;
      await tester.pumpWidget(makeTestable());
      await tester.pumpAndSettle();
      await tester.tap(find.text('EXCLUIR CONTA'));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('deleteAccountPage')), findsOneWidget);
    });

    testWidgets('Testing the ChangePasswordButton',
        (WidgetTester tester) async {
      actualUser.isProductor = true;
      await tester.pumpWidget(makeTestable());
      await tester.pumpAndSettle();
      await tester.tap(find.text('MUDAR SENHA'));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('profileContent')), findsOneWidget);
    });
  });
}
