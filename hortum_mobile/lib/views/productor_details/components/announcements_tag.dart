import 'package:flutter/material.dart';

class AnnouncementTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Align(
          alignment: Alignment.center,
          child: Text('Anúncios',
              style: TextStyle(
                  fontFamily: 'Comfortaa-Bold',
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.022))),
      margin:
          EdgeInsets.only(top: size.height * 0.05, bottom: size.height * 0.03),
      width: size.width * 0.5,
      height: size.height * 0.04,
      decoration: BoxDecoration(
          color: Color(0xffA7DDB7),
          borderRadius: BorderRadius.all(Radius.circular(15))),
    );
  }
}
