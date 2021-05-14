import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hortum_mobile/globals.dart';

class ProfilePicture extends StatefulWidget {
  final double width;
  final double heigth;
  final double radius;
  final double bottomMargin;
  final String productorProfile;

  const ProfilePicture(
      {@required this.width,
      @required this.heigth,
      @required this.radius,
      @required this.bottomMargin,
      this.productorProfile,
      Key key})
      : super(key: key);
  @override
  _ProfilePictureState createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ValueListenableBuilder<File>(
      valueListenable: controllerPicture.newPictureNotifier,
      builder: (context, value, _) => Container(
        margin: EdgeInsets.only(
            top: size.height * 0.1, bottom: widget.bottomMargin),
        width: widget.width,
        height: widget.heigth,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
          child: Material(
            child: widget.productorProfile == null
                ? InkWell(
                    child: controllerPicture.newPictureNotifier.value == null
                        ? Image.network(
                            actualUser.profile_picture,
                            fit: BoxFit.fill,
                          )
                        : Image.file(
                            controllerPicture.newPictureNotifier.value,
                            fit: BoxFit.fill,
                          ))
                : InkWell(
                    child: Image.network(
                    widget.productorProfile,
                    fit: BoxFit.fill,
                  )),
          ),
        ),
      ),
    );
  }
}
