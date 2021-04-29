import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/profile/components/profile_form.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  TestWidgetsFlutterBinding.ensureInitialized();
  Widget makeTestable() {
    return MaterialApp(home: Scaffold(body: ProfileForm(dio: dio)));
  }

  group("Testing Profile components:", () {
    testWidgets('Testing AdvancedSettingsButton', (WidgetTester tester) async {
      actualUser.isProductor = true;
      await tester.pumpWidget(makeTestable());
      await tester.tap(find.text('Avançado'));
      await tester.pump();
      await tester.pump();
      expect(find.text('MUDAR SENHA'), findsOneWidget);
    });
  });
}
