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
    await tester.enterText(find.byType(CustomFormField).at(0), 'Consumidor');
    await tester.enterText(
        find.byType(CustomFormField).at(1), 'consumidor@gmail.com');
    await tester.enterText(find.byType(CustomFormField).at(2), '12345');
    await tester.enterText(find.byType(CustomFormField).at(3), '12345');
    await tester.enterText(find.byType(CustomFormField).at(4), '12345678910');
    await tester.tap(find.byType(ConfirmButton));
    await tester.pumpAndSettle();

    expect(find.text('ENTRAR'), findsOneWidget);
  });

  testWidgets('Testing Register confirm button for productor',
      (WidgetTester tester) async {
    when(dioMock.post(any,
            data: anyNamed('data'), options: anyNamed('options')))
        .thenAnswer(
            (_) async => Response(requestOptions: null, statusCode: 201));
    await tester.pumpWidget(makeTestable(true));
    await tester.pump();
    await tester.enterText(find.byType(CustomFormField).at(0), 'Produtor');
    await tester.enterText(
        find.byType(CustomFormField).at(1), 'produtor@gmail.com');
    await tester.enterText(find.byType(CustomFormField).at(2), '12345');
    await tester.enterText(find.byType(CustomFormField).at(3), '12345');
    await tester.enterText(find.byType(CustomFormField).at(4), '12345678910');
    await tester.tap(find.byType(ConfirmButton));
    await tester.pumpAndSettle();

    expect(find.text('ENTRAR'), findsOneWidget);
  });

  testWidgets('Testing if RegisterPage renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestable(false));
    await tester.pump();
    expect(find.byKey(Key('registerFormPage')), findsOneWidget);
  });
}
