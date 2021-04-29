import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/complaint/complaint_page.dart';
import 'package:hortum_mobile/views/register_complaint/services/complaint_services.dart';
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
    String name = 'raimundo';
    String description = 'description';
    String emailProductor = 'productor@teste.com';
    return MaterialButton(
        key: Key('botão'),
        onPressed: () async {
          await ComplaintServices.registerComplaint(
              dio: widget.dio,
              name: name,
              description: description,
              emailProductor: emailProductor,
              context: context);
        });
  }
}

main() {
  final dio = DioMock();
  TestWidgetsFlutterBinding.ensureInitialized();
  actualUser.tokenAccess = 'token';
  actualUser.isProductor = false;
  String emailProductor = 'cHJvZHVjdG9yQHRlc3RlLmNvbQ==';
  List<dynamic> responseMatcher = [
    {
      'author': "user",
      'description': 'description',
    }
  ];
  Widget makeTestable() {
    return MaterialApp(
      home: Scaffold(
        body: ComplaintPage(dio: dio, emailProductor: emailProductor),
      ),
    );
  }

  group('Testing Complaint components:', () {
    testWidgets('Create Complaint button', (WidgetTester tester) async {
      when(dio.get(any, options: anyNamed('options'))).thenAnswer((_) async =>
          Response(
              data: responseMatcher, requestOptions: null, statusCode: 200));

      await tester.pumpWidget(makeTestable());
      await tester.tap(find.byKey(Key('createcomplaintButton')));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('ComplaintPage')), findsOneWidget);
    });
  });
}
