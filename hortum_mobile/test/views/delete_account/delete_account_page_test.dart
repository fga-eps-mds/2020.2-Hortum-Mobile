import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/delete_account/delete_account_page.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  Widget makeTestable() {
    return MaterialApp(
      home: DeleteAccountPage(),
    );
  }

  group('Design Tests', () {
    testWidgets('Testing the DeleteAccountPage rendering',
        (WidgetTester tester) async {
      actualUser.isProductor = true;
      await tester.pumpWidget(makeTestable());
      await tester.pump();
      expect(find.byKey(Key('deleteAccountPage')), findsOneWidget);
    });
  });
}
