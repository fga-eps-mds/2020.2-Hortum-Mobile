import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hortum_mobile/globals.dart';

class EditPicture extends StatelessWidget {
  final String image;

  EditPicture({@required this.image});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ValueListenableBuilder<File>(
      valueListenable: controllerPicture.newPictureAnnounNotifier,
      builder: (context, value, _) => Container(
          margin: EdgeInsets.only(
              top: size.height * 0.1, bottom: size.height * 0.05),
          width: size.width * 0.3,
          height: size.width * 0.3,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16.8)),
            child: Material(
              child: InkWell(
                  child:
                      controllerPicture.newPictureAnnounNotifier.value == null
                          ? Image.network(
                              image,
                              fit: BoxFit.fill,
                            )
                          : Image.file(
                              controllerPicture.newPictureAnnounNotifier.value,
                              fit: BoxFit.fill,
                            )),
            ),
          )),
    );
  }
}
