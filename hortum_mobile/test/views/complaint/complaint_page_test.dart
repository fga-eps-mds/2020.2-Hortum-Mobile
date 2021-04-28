import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/complaint_data_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/complaint/components/list_complaints.dart';
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

  group('Testing complaints data:', () {
    ComplaintDataAPI complaintDataApi = ComplaintDataAPI(dio);
    String emailProductor = 'productor@teste.com';
    var url = 'http://$ip:8000/complaint/list/';
    List<dynamic> responseMatcher = [
      {
        'author': "user",
        'description': 'description',
      }
    ];
    List<dynamic> responseActual = [
      {
        'author': "user",
        'description': 'description',
      }
    ];
    test('listComplaint', () async {
      when(dio.get(url, options: anyNamed('options'))).thenAnswer((_) async =>
          Response(
              data: responseMatcher, requestOptions: null, statusCode: 200));
      await complaintDataApi.listComplaint(emailProductor: emailProductor);

      expect(responseActual, responseMatcher);
    });
  });

  group('Testing complaintPage:', () {
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

    when(dio.get(any, options: anyNamed('options'))).thenAnswer((_) async =>
        Response(data: responseMatcher, requestOptions: null, statusCode: 200));

    testWidgets('Renderização da página e botão voltar',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable());
      await tester.tap(find.byKey(Key('buttonArrowback')));
      expect(find.byKey(Key('textReclamações')), findsOneWidget);
    });

    testWidgets('Botão Criar reclamação', (WidgetTester tester) async {
      when(dio.get(any, options: anyNamed('options'))).thenAnswer((_) async =>
          Response(
              data: responseMatcher, requestOptions: null, statusCode: 200));

      await tester.pumpWidget(makeTestable());
      await tester.tap(find.byKey(Key('createcomplaintButton')));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('ComplaintPage')), findsOneWidget);
    });
  });

  group('Testing complaintComponents:', () {
    ComplaintDataAPI complaintDataAPI = new ComplaintDataAPI();
    complaintDataAPI.complaints = [
      {
        'author': "user",
        'description': 'description',
      }
    ];

    testWidgets('complaintList e complaintBox', (WidgetTester tester) async {
      Widget makeTestable() {
        return MaterialApp(
          home: Scaffold(
            body: ComplaintsList(
              complaintAPI: complaintDataAPI,
            ),
          ),
        );
      }

      await tester.pumpWidget(makeTestable());
      expect(find.byKey(Key('containerComplaintBox')), findsOneWidget);
    });
  });
}
