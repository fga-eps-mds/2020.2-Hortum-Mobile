import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/delete_account/components/delete_user_form.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Testing deleteUser Service:', () {
    TextEditingController password = TextEditingController(text: '123');
    TextEditingController confirmPassword = TextEditingController(text: '123');
    Widget makeTestable() {
      return MaterialApp(
          home: Scaffold(
              body: DeleteUserForm(
        dio: dio,
        password: password,
        confirmPassword: confirmPassword,
      )));
    }

    testWidgets('Testing user delete fail', (WidgetTester tester) async {
      actualUser.tokenAccess = 'token';
      actualUser.isProductor = true;
      when(dio.delete(any,
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
      expect(find.byKey(Key('erroAoDeletar')), findsOneWidget);
      await tester.tap(find.byKey(Key('okButton')));
    });

    testWidgets('Testing user delete success', (WidgetTester tester) async {
      actualUser.tokenAccess = 'token';
      actualUser.isProductor = true;
      when(dio.delete(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer(
              (_) async => Response(requestOptions: null, statusCode: 204));
      await tester.pumpWidget(makeTestable());
      await tester.tap(find.text('EXCLUIR'));
      await tester.pump();
      await tester.pump();
      expect(find.byKey(Key('deleteUser')), findsOneWidget);
      await tester.tap(find.byKey(Key('yesButton')));
      await tester.pump();
      await tester.pump();
      expect(find.text('ENTRAR'), findsOneWidget);
    });

    testWidgets('Testing tap "Não" button on dialogDelete',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable());
      await tester.tap(find.text('EXCLUIR'));
      await tester.pump();
      await tester.pump();
      expect(find.byKey(Key('deleteUser')), findsOneWidget);
      await tester.tap(find.byKey(Key('noButton')));
      await tester.pump();
      expect(find.text('EXCLUIR'), findsOneWidget);
    });
  });
}
