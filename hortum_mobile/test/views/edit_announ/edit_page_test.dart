import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/components/custom_desc_field.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/views/edit_announ/edit_page.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Testing EditPage:', () {
    Widget makeTestable() {
      return MaterialApp(
          home: EditPage(
        image: 'http://localhost:8000/images/perfil.jpg',
        dio: dio,
        category: new TextEditingController(text: 'Outros'),
        description: new TextEditingController(text: 'Banana Prata'),
        localization: [TextEditingController(text: "Brasilia")],
        originaltitle: 'A',
        price: new TextEditingController(text: '21.50'),
        title: new TextEditingController(text: 'Banana Prata'),
      ));
    }

    testWidgets('CustomFormFields, MaterialButton e CustomDescField',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(makeTestable());
        await tester.tap(find.byIcon(Icons.add));
        await tester.tap(find.byIcon(Icons.remove));
        expect(find.byType(CustomFormField), findsNWidgets(3));
        expect(find.byType(CustomDescField), findsOneWidget);
        expect(find.byType(MaterialButton), findsNWidgets(2));
      });
    });
  });
}
