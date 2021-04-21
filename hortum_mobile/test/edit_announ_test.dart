import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/components/custom_desc_field.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/data/announ_edit_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/edit_announ/edit_page.dart';
import 'package:mockito/mockito.dart';
import 'dart:convert';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  TestWidgetsFlutterBinding.ensureInitialized();
  String nomeOriginal = 'Banana';
  var url = 'http://$ip:8000/announcement/update/$nomeOriginal';

  group('Testing class UpdateUserAPI:', () {
    EditAnnounApi editAnnoun = EditAnnounApi(dio);
    actualUser.tokenAccess = 'token';
    String responseMatcher = 'Anuncio editado';
    String name = 'Banana prata';
    double preco = 12.90;

    test('Edit announcement Successful', () async {
      when(dio.patch(url, data: anyNamed('data'), options: anyNamed('options')))
          .thenAnswer((_) async => Response(
              data: jsonEncode(responseMatcher),
              requestOptions: null,
              statusCode: 200));
      var responseActual =
          await editAnnoun.editAnnoun(nomeOriginal, name: name, price: preco);

      expect(responseActual.statusCode, 200);
    });
  });

  group('Testing EditPage:', () {
    Widget makeTestable() {
      return MaterialApp(
          home: EditPage(
        dio: dio,
        category: new TextEditingController(text: 'Banana'),
        description: new TextEditingController(text: 'Banana Prata'),
        localization: new TextEditingController(text: 'Feira'),
        originalTitle: 'A',
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
