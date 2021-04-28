import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPictureButton extends StatefulWidget {
  @override
  _AddPictureButtonState createState() => _AddPictureButtonState();
}

class _AddPictureButtonState extends State<AddPictureButton> {
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            final pickedFile =
                await picker.getImage(source: ImageSource.gallery);

            super.setState(() {
              if (pickedFile != null) {
                // _image = File(pickedFile.path);
              } else {
                print('No image selected.');
              }
            });
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
