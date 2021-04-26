import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/globals.dart';

void main() {
  Widget makeWidgetTestable({Widget widget}) {
    return MaterialApp(
      home: widget,
    );
  }

  testWidgets('Footer icons when user is a Customer',
      (WidgetTester tester) async {
    actualUser.isProductor = false;
    Footer footer = Footer();

    await tester.pumpWidget(makeWidgetTestable(widget: footer));

    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });

  testWidgets('Footer icons when user is a Productor',
      (WidgetTester tester) async {
    actualUser.isProductor = true;
    Footer footer = Footer();

    await tester.pumpWidget(makeWidgetTestable(widget: footer));

    expect(find.byIcon(Icons.note_add_rounded), findsOneWidget);
  });
}
