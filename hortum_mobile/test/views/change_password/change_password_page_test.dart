import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/change_password/change_password_page.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dioMock = DioMock();
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Testing ChangePasswordPage', () {
    Widget makeTestable() {
      return MaterialApp(
          home: ChangePasswordPage(
        dio: dioMock,
      ));
    }

    testWidgets('Testing if ChangePasswordPage render correctly',
        (WidgetTester tester) async {
      actualUser.isProductor = false;

      await tester.pumpWidget(makeTestable());
      await tester.pump();
      expect(find.byKey(Key('changePasswordContent')), findsOneWidget);
    });
  });
}
