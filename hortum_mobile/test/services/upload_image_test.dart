import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hortum_mobile/services/upload_image.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

main() {
  enableFlutterDriverExtension();

  const MethodChannel channel = MethodChannel('multi_image_picker');
  List<File> resultList = <File>[];
  List<Asset> assets = <Asset>[];

  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    File file = await File('./assets/images/perfil.jpg');
    resultList.add(file);
    return assets;
  });
  test('Testing the method UploadImage', () async {
    List<File> images = await UploadImage.uploadImage(1);
    expect(images, isEmpty);
  });
}
