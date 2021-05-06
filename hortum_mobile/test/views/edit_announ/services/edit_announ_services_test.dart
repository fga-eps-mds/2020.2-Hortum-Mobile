import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/edit_announ/services/edit_announ_services.dart';
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
    return MaterialButton(
        key: Key('botão'),
        onPressed: () {
          ChangeServices.editAnnoun(
              widget.dio,
              'banana',
              'arroz',
              22,
              'Arroz',
              'arroz fresco',
              [TextEditingController(text: 'Brasilia')],
              context);
        });
  }
}

main() {
  final dio = DioMock();
  TestWidgetsFlutterBinding.ensureInitialized();
  actualUser.tokenAccess = 'token';
  actualUser.isProductor = true;

  group('Testing EditAnnounServices:', () {
    Widget makeTestable() {
      return MaterialApp(
        home: Teste(dio: dio),
      );
    }

    testWidgets('dialogErrorEditAnnoun', (WidgetTester tester) async {
      String responseMatcher = "";

      when(dio.patch(any, data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: responseMatcher, requestOptions: null, statusCode: 400));

      await tester.pumpWidget(makeTestable());
      await tester.tap(find.byKey(Key('botão')));
      await tester.pump();
      expect(find.byKey(Key('erroAoEditar')), findsOneWidget);
      await tester.tap(find.byType(TextButton));
    });
  });
}
