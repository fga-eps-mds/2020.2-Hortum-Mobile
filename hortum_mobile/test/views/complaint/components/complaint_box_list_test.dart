import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/data/complaint_data_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/complaint/components/list_complaints.dart';
import 'package:network_image_mock/network_image_mock.dart';

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  actualUser.tokenAccess = 'token';
  actualUser.isProductor = false;

  group('Testing complaintComponents:', () {
    ComplaintDataAPI complaintDataAPI = new ComplaintDataAPI();
    complaintDataAPI.complaints = [
      {
        'author': "user",
        'description': 'description',
        'image': 'http://localhost:8000/images/perfil.jpg'
      }
    ];

    testWidgets('complaintList e complaintBox', (WidgetTester tester) async {
      Widget makeTestable() {
        return MaterialApp(
          home: Scaffold(
            body: ComplaintsList(
              complaintAPI: complaintDataAPI,
            ),
          ),
        );
      }

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(makeTestable());
        expect(find.byKey(Key('containerComplaintBox')), findsOneWidget);
      });
    });
  });
}
