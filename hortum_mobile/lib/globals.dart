import 'dart:io';

import 'package:hortum_mobile/model/user.dart';
import 'package:hortum_mobile/views/profile/services/add_picture_controller.dart';

User actualUser = User();
String ip = 'IPLOCAL';
File profile_picture;
File complaint_picture;
List<File> announImages = [];
AddPictureController controllerPicture = AddPictureController();
