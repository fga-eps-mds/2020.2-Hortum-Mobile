import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/components/custom_desc_field.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/views/edit_announ/edit_page.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Testing EditPage:', () {
    Widget makeTestable() {
      return MaterialApp(
          home: EditPage(
        dio: dio,
        category: new TextEditingController(text: 'Banana'),
        description: new TextEditingController(text: 'Banana Prata'),
        localization: new TextEditingController(text: 'Feira'),
        originaltitle: 'A',
        price: new TextEditingController(text: '21.50'),
        title: new TextEditingController(text: 'Banana Prata'),
      ));
    }

    testWidgets('CustomFormFields, MaterialButton e CustomDescField',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable());
      expect(find.byType(CustomFormField), findsNWidgets(3));
      expect(find.byType(CustomDescField), findsOneWidget);
      expect(find.byType(MaterialButton), findsNWidgets(2));
    });
  });
}
