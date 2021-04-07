import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/login_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/model/user.dart';
import 'package:hortum_mobile/views/login/login_page.dart';
import 'package:hortum_mobile/views/login/services/login_services.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  LoginPage loginPage = LoginPage();

  Widget makeTestableWidget({Widget widget}) {
    return MaterialApp(
      home: widget,
    );
  }

  testWidgets("On button 'Não tenho uma conta' pressed",
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(widget: loginPage));
    await tester.tap(find.byKey(Key('newAccount')));
    await tester.pump();

    expect(find.byKey(Key('typeUser')), findsOneWidget);
  });

  testWidgets('Given empty email and password the screen return an error text',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(widget: loginPage));

    await tester.tap(find.byKey(Key('signIn')));
    await tester.pump();

    expect(find.text('Informe o email'), findsOneWidget);
  });

  testWidgets('On obscure button click change the icon',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(widget: loginPage));

    await tester.tap(find.byIcon(Icons.visibility_off));
    await tester.pump();

    expect(find.byIcon(Icons.visibility_off), findsNothing);
    expect(find.byIcon(Icons.visibility), findsOneWidget);
  });

  testWidgets('Given a valid email and password sign in the user',
      (WidgetTester tester) async {
    BuildContext context;
    String response = ''' 
      {
        "username": "Consumidor",
        "email": "consumidor@gmail.com",
        "access": "tokenAccess",
        "refresh": "tokenRefresh",
        "is_productor": false
      }
    ''';
    MockHttpClient httpClient = MockHttpClient();
    when(httpClient.post(any,
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(
                {"email": "emailteste@email.com", "password": "Teste1234"})))
        .thenAnswer((_) => Future.value(Response(response, 200)));

    await tester.pumpWidget(makeTestableWidget(widget: loginPage));
    var user = LoginServices.login(
        "emailteste@email.com", "Teste1234", context, httpClient);

    expect(user, !null);
  });

  testWidgets('Given an invalid email and password return an error',
      (WidgetTester tester) async {
    String response = ''' 
      {
        "username": "Consumidor",
        "email": "consumidor@gmail.com",
        "access": "tokenAccess",
        "refresh": "tokenRefresh",
        "is_productor": false
      }
    ''';

    MockHttpClient httpClient = MockHttpClient();
    when(httpClient.post(any,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": "emailteste@email.com",
          "password": "Consumidor123"
        }))).thenAnswer((_) => Future.value(Response(response, 400)));

    await tester.pumpWidget(makeTestableWidget(widget: loginPage));

    LoginApi.login("emailteste@email.com", "Consumidor123", httpClient);
    User result = User();
    result = null;
    expect(actualUser, result);
  });
}
