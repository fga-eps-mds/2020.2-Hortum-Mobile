import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/announcements/announcements_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/register_announcement/services/register_announcements_services.dart';
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
    AnnouncementsApi announcementsApi = AnnouncementsApi(widget.dio);
    return MaterialButton(
        key: Key('botão'),
        onPressed: () async {
          await registerAnnounServices(
              'name',
              'description',
              [TextEditingController(text: 'brasilia')],
              2.8,
              'Banana',
              context,
              announcementsApi);
        });
  }
}

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  actualUser.tokenAccess = 'token';
  actualUser.isProductor = false;
  actualUser.email = 'user@user.com';
  final dioMock = DioMock();

  group('Testing RegisterAnnounServices:', () {
    Widget makeTestable() {
      return MaterialApp(
        home: Teste(dio: dioMock),
      );
    }

    testWidgets('Testing Announcement register', (WidgetTester tester) async {
      when(dioMock.post(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer(
              (_) async => Response(requestOptions: null, statusCode: 201));

      await tester.pumpWidget(makeTestable());
      await tester.tap(find.byKey(Key('botão')));
      await tester.pumpAndSettle();

      expect(find.text('MEUS ANÚNCIOS'), findsOneWidget);
    });

    testWidgets('Testing dialogRepeatedError', (WidgetTester tester) async {
      when(dioMock.post(any,
              data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer(
              (_) async => Response(requestOptions: null, statusCode: 400));

      await tester.pumpWidget(makeTestable());
      await tester.tap(find.byKey(Key('botão')));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('erroNomeAnnoun')), findsOneWidget);
      await tester.tap(find.byKey(Key('okButton')));
    });
  });
}
