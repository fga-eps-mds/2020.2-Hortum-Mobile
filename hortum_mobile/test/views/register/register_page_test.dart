import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/components/confirm_button.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/views/register/register_page.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dioMock = DioMock();
  Widget makeTestable(bool isProductor) {
    return MaterialApp(
      home: RegisterPage(isProductor: isProductor, dio: dioMock),
    );
  }

  testWidgets('Testing Register confirm button for customer',
      (WidgetTester tester) async {
    when(dioMock.post(any,
            data: anyNamed('data'), options: anyNamed('options')))
        .thenAnswer(
            (_) async => Response(requestOptions: null, statusCode: 201));
    await tester.pumpWidget(makeTestable(false));
    await tester.pump();
    expect(find.byType(CustomFormField), findsNWidgets(4));
    expect(find.byType(ConfirmButton), findsOneWidget);
    await tester.pumpAndSettle();
  });

  testWidgets('Testing if RegisterPage renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestable(false));
    await tester.pump();
    expect(find.byKey(Key('registerFormPage')), findsOneWidget);
  });
}
