import 'package:flutter/material.dart';

class EditPicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin:
          EdgeInsets.only(top: size.height * 0.1, bottom: size.height * 0.05),
      width: size.width * 0.3,
      height: size.width * 0.3,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16.8)),
        child: Material(
          child: InkWell(
              child: Image.asset(
            'assets/images/banana.jpg',
            fit: BoxFit.fill,
          )),
        ),
      ),
    );
  }
}
