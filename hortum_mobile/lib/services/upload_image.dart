import 'dart:io';

import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class UploadImage {
  static Future uploadImage(int maxImages) async {
    List<Asset> resultList = <Asset>[];
    List<File> images = <File>[];
    File image;
    resultList = await MultiImagePicker.pickImages(
      maxImages: maxImages,
      enableCamera: true,
      selectedAssets: resultList,
      cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
      materialOptions: MaterialOptions(
        actionBarColor: "#abcdef",
        actionBarTitle: "Example App",
        allViewTitle: "All Photos",
        useDetailsView: false,
        selectCircleStrokeColor: "#000000",
      ),
    );

    for (int i = 0; i < resultList.length; i++) {
      var path =
          await FlutterAbsolutePath.getAbsolutePath(resultList[i].identifier);
      image = File(path);
      images.add(image);
    }
    return images;
  }
}
