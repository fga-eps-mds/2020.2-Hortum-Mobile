import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/views/login/services/login_services.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

class Teste extends StatefulWidget {
  final Dio dio;
  const Teste({this.dio});
  @override
  _TestState createState() {
    return _TestState();
  }
}

class _TestState extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    String emailForm = 'teste@gmail.com';
    String passwordForm = 'teste';

    return MaterialButton(
      key: Key('botão'),
      onPressed: () async {
        await LoginServices.login(emailForm, passwordForm, context, widget.dio);
      },
    );
  }
}

main() {
  final dio = DioMock();
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Testing LoginServices:', () {
    Widget makeTestable() {
      return MaterialApp(
        home: Teste(dio: dio),
      );
    }

    testWidgets('show dialog errorLogin', (WidgetTester tester) async {
      var responseMatcher = null;

      when(dio.post(any, data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: responseMatcher, requestOptions: null, statusCode: 400));

      await tester.pumpWidget(makeTestable());
      await tester.tap(find.byKey(Key('botão')));
      await tester.pump();
      expect(find.byKey(Key('errorLogin')), findsOneWidget);
      await tester.tap(find.byKey(Key('okButton')));
    });

    group('LoginServices return status code 200', () {
      testWidgets('Return to CustomerHomePage', (WidgetTester tester) async {
        dynamic responseMatcher = {
          'email': 'teste@gmail.com',
          'password': 'senha',
          'tokenAccess': 'abc',
          'tokenRefresh': 'cba',
          'username': 'teste',
          'is_productor': false,
        };

        when(dio.post(any,
                data: anyNamed('data'), options: anyNamed('options')))
            .thenAnswer((_) async => Response(
                data: responseMatcher, requestOptions: null, statusCode: 200));

        await tester.pumpWidget(makeTestable());
        await tester.tap(find.byKey(Key('botão')));
        await tester.pumpAndSettle();
        expect(find.byKey(Key('categoryCarr')), findsOneWidget);
      });

      testWidgets('Return to ProductorHomePage', (WidgetTester tester) async {
        dynamic responseMatcher = {
          'email': 'teste@gmail.com',
          'password': 'senha',
          'tokenAccess': 'abc',
          'tokenRefresh': 'cba',
          'username': 'teste',
          'is_productor': true,
        };

        when(dio.post(any,
                data: anyNamed('data'), options: anyNamed('options')))
            .thenAnswer((_) async => Response(
                data: responseMatcher, requestOptions: null, statusCode: 200));

        await tester.pumpWidget(makeTestable());
        await tester.tap(find.byKey(Key('botão')));
        await tester.pumpAndSettle();
        expect(find.text('MEUS ANÚNCIOS'), findsOneWidget);
      });
    });
  });
}
