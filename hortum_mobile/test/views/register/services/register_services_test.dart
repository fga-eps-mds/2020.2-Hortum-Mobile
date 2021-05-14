import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/register_backend.dart';
import 'package:hortum_mobile/views/introScreen_page.dart';
import 'package:hortum_mobile/views/register/services/register_services.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

class Teste extends StatefulWidget {
  final Dio dio;
  final bool isProductor;
  const Teste({this.dio, this.isProductor});
  @override
  _TestState createState() {
    return _TestState();
  }
}

class _TestState extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    RegisterApi registerApi = RegisterApi(widget.dio);
    return MaterialButton(
        key: Key('botão'),
        onPressed: () async {
          await resgisterUser('User', 'user@user.com', 'password',
              '61123456789', isProductor, context, registerApi);
        });
  }
}

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final dioMock = DioMock();

  group('Testing RegisterServices:', () {
    Widget makeTestable(bool isProductor) {
      return MaterialApp(
        home: Teste(dio: dioMock),
      );
    }

    testWidgets('Testing dialogErroCadastrado', (WidgetTester tester) async {
      when(dioMock.post(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer(
              (_) async => Response(requestOptions: null, statusCode: 400));

      await tester.pumpWidget(makeTestable(isProductor = true));
      await tester.tap(find.byKey(Key('botão')));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('dialogErroCadastrado')), findsOneWidget);
      await tester.tap(find.byKey(Key('okButton')));
    });

    testWidgets('Testing dialogEmailEnviado', (WidgetTester tester) async {
      when(dioMock.post(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer(
              (_) async => Response(requestOptions: null, statusCode: 201));

      await tester.pumpWidget(makeTestable(isProductor = false));
      await tester.tap(find.byKey(Key('botão')));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('dialogEmailEnviado')), findsOneWidget);
      await tester.tap(find.byKey(Key('okButton')));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('signIn')), findsOneWidget);
    });
  });
}
