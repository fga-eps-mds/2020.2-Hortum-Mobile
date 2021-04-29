import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/delete_account/components/delete_user_form.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Testing DeleteUserForm:', () {
    Widget makeTestable() {
      return MaterialApp(home: Scaffold(body: DeleteUserForm(dio: dio)));
    }

    testWidgets('CustomFormFields e MaterialButton',
        (WidgetTester tester) async {
      actualUser.tokenAccess = 'token';
      actualUser.isProductor = true;
      await tester.pumpWidget(makeTestable());
      expect(find.byType(CustomFormField), findsNWidgets(2));
      expect(find.byType(MaterialButton), findsOneWidget);
    });
  });
}
