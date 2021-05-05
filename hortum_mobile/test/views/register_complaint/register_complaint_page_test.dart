import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/components/custom_desc_field.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/register_complaint/register_complaint_page.dart';

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  actualUser.tokenAccess = 'token';
  actualUser.isProductor = false;

  group('Testing RegisterComplaintPage:', () {
    Widget makeTestable() {
      return MaterialApp(
        home: Scaffold(
          body: RegisterComplaintPage(),
        ),
      );
    }

    testWidgets('Renderização da página', (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable());
      expect(find.byType(CustomFormField), findsOneWidget);
      expect(find.byType(CustomDescField), findsOneWidget);
      expect(find.byKey(Key('enviarReclamButton')), findsOneWidget);
    });
  });
}
