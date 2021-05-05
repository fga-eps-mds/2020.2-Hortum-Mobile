import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/views/edit_announ/components/dialog_empty_localizations.dart';

class Teste extends StatefulWidget {
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
      onPressed: () async {
        await showDialog(
            context: context, builder: (context) => DialogEmptyLocalizations());
      },
    );
  }
}

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Testing EditPageComponent:', () {
    Widget makeTestable() {
      return MaterialApp(home: Teste());
    }

    testWidgets('DialogEmptyLocalizations', (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable());
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key("botão")));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('emptyLocalizations')), findsOneWidget);
      await tester.tap(find.byKey(Key("okButton")));
    });
  });
}
