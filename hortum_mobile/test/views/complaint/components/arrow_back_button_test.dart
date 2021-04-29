import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/complaint/complaint_page.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  TestWidgetsFlutterBinding.ensureInitialized();
  actualUser.tokenAccess = 'token';
  actualUser.isProductor = false;

  group('Testing Complaint components:', () {
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

    testWidgets('ArrowBack button', (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable());
      await tester.tap(find.byKey(Key('buttonArrowback')));
      expect(find.byKey(Key('textReclamações')), findsOneWidget);
    });
  });
}
