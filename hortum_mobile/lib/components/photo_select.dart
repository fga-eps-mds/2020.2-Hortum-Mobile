import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/announcements_data.dart';
import 'package:hortum_mobile/data/announcements/announcements_backend.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class PhotoSelecter extends StatefulWidget {
  final AnnouncementsApi announcementsApi;
  final String title;
  const PhotoSelecter({@required this.title, this.announcementsApi, Key key})
      : super(key: key);
  @override
  _PhotoSelecterState createState() => _PhotoSelecterState();
}

class _PhotoSelecterState extends State<PhotoSelecter> {
  List<Asset> images = <Asset>[];
  File image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Asset> resultList = <Asset>[];
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
                child: Icon(
                  Icons.add_a_photo,
                  size: size.height * 0.06,
                ),
                onPressed: () async {
                  resultList = await MultiImagePicker.pickImages(
                    maxImages: 300,
                    enableCamera: true,
                    selectedAssets: images,
                    cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
                    materialOptions: MaterialOptions(
                      actionBarColor: "#abcdef",
                      actionBarTitle: "Example App",
                      allViewTitle: "All Photos",
                      useDetailsView: false,
                      selectCircleStrokeColor: "#000000",
                    ),
                  );
                  print(widget.announcementsApi.hashCode);
                  resultList.forEach((element) {
                    image = File(element.identifier);
                    widget.announcementsApi.addImages(image);
                  });
                },
                //   onPressed: () async {
                //     final pickedFile =
                //         await picker.getImage(source: ImageSource.gallery);

                //     setState(() {
                //       if (pickedFile != null) {
                //         //  _image = File(pickedFile.path);
                //       } else {
                //         print('No image selected.');
                //       }
                //     });
                //   },
              ),
            )
          ],
        ),
      ),
    );
  }
}
