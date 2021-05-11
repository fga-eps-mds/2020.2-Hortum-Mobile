import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/register_backend.dart';
import 'package:hortum_mobile/views/introScreen_page.dart';
import 'package:mockito/mockito.dart';

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
    TestWidgetsFlutterBinding.ensureInitialized();
    RegisterApi registerApi = RegisterApi(widget.dio);
    return MaterialButton(
        key: Key('botão'),
        onPressed: () async {
          await registerApi.register("username", "email@gmail.com", "123456",
              "12345678910", widget.isProductor, context);
        });
  }
}

class DioMock extends Mock implements Dio {}

main() {
  final dioMock = DioMock();
  Widget makeTestable(bool isProductor) {
    return MaterialApp(
      home: Teste(
        dio: dioMock,
        isProductor: isProductor,
      ),
    );
  }

  group('RegisterApi register customer', () {
    dynamic response = {"msg": "User created"};
    testWidgets('Testing the method register on RegisterApi',
        (WidgetTester tester) async {
      when(dioMock.post(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async =>
              Response(data: response, requestOptions: null, statusCode: 201));
      await tester.pumpWidget(makeTestable(isProductor = false));
      await tester.tap(find.byKey(Key('botão')));
      await tester.pumpAndSettle();
      ;
    });
  });

  group('RegisterApi register productor', () {
    dynamic response = {"msg": "User created"};
    testWidgets('Testing the method register on RegisterApi',
        (WidgetTester tester) async {
      when(dioMock.post(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async =>
              Response(data: response, requestOptions: null, statusCode: 201));
      await tester.pumpWidget(makeTestable(isProductor = true));
      await tester.tap(find.byKey(Key('botão')));
      await tester.pumpAndSettle();
    });
  });
}
