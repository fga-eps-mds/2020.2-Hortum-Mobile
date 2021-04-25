import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/data/user_delete_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/delete_account/components/delete_user_form.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  TestWidgetsFlutterBinding.ensureInitialized();
  var url = 'http://$ip:8000/users/delete/';

  group('Testing class DeleteUserAPI:', () {
    DeleteUserAPI deleteUser = DeleteUserAPI(dio);
    actualUser.tokenAccess = 'token';
    test('Delete User Successful', () async {
      when(dio.delete(url,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer(
              (_) async => Response(requestOptions: null, statusCode: 204));
      Response responseExp = await deleteUser.deleteUser('123');

      expect(responseExp.statusCode, 204);
    });
  });

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

  group('Testing deleteUser Service:', () {
    TextEditingController actualPassword = TextEditingController(text: '123');
    TextEditingController confirmPassword = TextEditingController(text: '123');
    Widget makeTestable() {
      return MaterialApp(
          home: Scaffold(
              body: DeleteUserForm(
        dio: dio,
        actualPassword: actualPassword,
        confirmPassword: confirmPassword,
      )));
    }

    testWidgets('Testing user delete fail', (WidgetTester tester) async {
      actualUser.tokenAccess = 'token';
      actualUser.isProductor = true;
      when(dio.delete(url,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer(
              (_) async => Response(requestOptions: null, statusCode: 400));

      await tester.pumpWidget(makeTestable());
      await tester.tap(find.text('EXCLUIR'));
      await tester.pump();
      await tester.pump();
      expect(find.byKey(Key('deleteUser')), findsOneWidget);
      await tester.tap(find.byKey(Key('yesButton')));
      await tester.pump();
      await tester.pump();
      expect(find.byKey(Key('erroAoDeletar')), findsOneWidget);
    });
  });
}
