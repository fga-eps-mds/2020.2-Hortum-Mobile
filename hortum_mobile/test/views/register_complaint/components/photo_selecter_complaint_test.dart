import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/register_complaint/components/photo_selecter_complaint.dart';

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  actualUser.tokenAccess = 'token';
  actualUser.isProductor = false;

  group('Testing RegisterComplaintComponent:', () {
    testWidgets('PhotoSelecter', (WidgetTester tester) async {
      Widget makeTestable() {
        return MaterialApp(
          home: Scaffold(
            body: PhotoSelecterComplaint(),
          ),
        );
      }

      await tester.pumpWidget(makeTestable());
      expect(find.byKey(Key('adicionarImagem')), findsOneWidget);
    });
  });
}
