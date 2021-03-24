import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoSelecter extends StatefulWidget {
  @override
  _PhotoSelecterState createState() => _PhotoSelecterState();
}

class _PhotoSelecterState extends State<PhotoSelecter> {
  File _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                'CRIAR ANÚNCIO',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontFamily: 'Comfortaa-Regular',
                    letterSpacing: -0.33,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              child: MaterialButton(
                height: size.height * 0.15,
                minWidth: size.width * 0.3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70)),
                child: Icon(
                  Icons.add_a_photo,
                  size: size.height * 0.05,
                ),
                onPressed: () async {
                  final pickedFile =
                      await picker.getImage(source: ImageSource.gallery);

                  setState(() {
                    if (pickedFile != null) {
                      _image = File(pickedFile.path);
                    } else {
                      print('No image selected.');
                    }
                  });
                },
                color: Colors.grey.withOpacity(0.5),
              ),
            )
          ],
        ),
      ),
    );
  }
}