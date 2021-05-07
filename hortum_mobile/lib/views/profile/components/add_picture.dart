import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/services/upload_image.dart';

class AddPictureButton extends StatefulWidget {
  final bool isProfilePicture;

  const AddPictureButton({@required this.isProfilePicture});

  @override
  _AddPictureButtonState createState() => _AddPictureButtonState();
}

class _AddPictureButtonState extends State<AddPictureButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<File> images = <File>[];

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin:
            EdgeInsets.only(top: size.height * 0.21, left: size.width * 0.25),
        width: size.height * 0.06,
        height: size.height * 0.06,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
        child: MaterialButton(
          padding: EdgeInsets.all(0),
          onPressed: () async {
            if (widget.isProfilePicture) {
              images = await UploadImage.uploadImage(1);
              profile_picture = images[0];
              controllerPicture.newPictureNotifier.value = profile_picture;
            } else {
              images = await UploadImage.uploadImage(5);
              announImages = images;
              controllerPicture.newPictureAnnounNotifier.value = images[0];
            }
          },
          child: Icon(
            Icons.add_photo_alternate,
            size: 25,
            color: Color(0xff75CE90),
          ),
        ),
      ),
    );
  }
}
