import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/services/upload_image.dart';

class PhotoSelecter extends StatefulWidget {
  final bool isAnnounRegister;
  final String title;

  const PhotoSelecter(
      {@required this.title, @required this.isAnnounRegister, Key key})
      : super(key: key);
  @override
  _PhotoSelecterState createState() => _PhotoSelecterState();
}

class _PhotoSelecterState extends State<PhotoSelecter> {
  File image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<File> images = <File>[];
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Container(
        width: double.infinity,
        height: size.height * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  bottom: size.height * 0.05, top: size.height * 0.02),
              child: Text(
                widget.title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontFamily: 'Comfortaa-Regular',
                    letterSpacing: -0.33,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black.withOpacity(0.25)),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: Offset(0, 4),
                        color: Colors.black.withOpacity(0.25))
                  ]),
              child: MaterialButton(
                height: size.height * 0.15,
                minWidth: size.width * 0.3,
                padding: EdgeInsets.all(0),
                child: Container(
                  width: size.width * 0.3,
                  height: size.height * 0.15,
                  child: image == null
                      ? Icon(
                          Icons.add_a_photo,
                          size: size.height * 0.06,
                        )
                      : Image.file(
                          image,
                          fit: BoxFit.fill,
                        ),
                ),
                onPressed: () async {
                  if (widget.isAnnounRegister) {
                    images = await UploadImage.uploadImage(5);
                    announImages = images;
                    image = images[0];
                  } else {
                    images = await UploadImage.uploadImage(1);
                    profile_picture = images[0];
                    image = images[0];
                  }
                  setState(() {});
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
