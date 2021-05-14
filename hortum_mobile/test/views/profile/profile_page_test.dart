import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/profile/profile_page.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  actualUser.isProductor = false;

  Widget makeTestableWidget({Widget widget}) {
    return MaterialApp(
      home: UserProfile(),
    );
  }

  group('Design Tests', () {
    testWidgets("Render ProfilePage with controllerPicture null",
        (WidgetTester tester) async {
      actualUser.profile_picture = './assets/images/perfil.jpg';

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(makeTestableWidget());
        expect(find.byKey(Key('profileContent')), findsOneWidget);
      });
    });

    testWidgets("Render ProfilePage with controllerPicture not null",
        (WidgetTester tester) async {
      actualUser.profile_picture = './assets/images/perfil.jpg';
      controllerPicture.newPictureNotifier.value =
          File('./assets/images/perfil.jpg');

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(makeTestableWidget());
        expect(find.byKey(Key('profileContent')), findsOneWidget);
      });
    });
  });
}
