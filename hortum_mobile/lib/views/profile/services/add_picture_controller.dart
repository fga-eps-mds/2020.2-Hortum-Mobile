import 'dart:io';

import 'package:flutter/foundation.dart';

class AddPictureController {
  final newPictureNotifier = ValueNotifier<File>(null);
  File get editPicture => newPictureNotifier.value;
  set currentPage(File value) => newPictureNotifier.value = value;
}
