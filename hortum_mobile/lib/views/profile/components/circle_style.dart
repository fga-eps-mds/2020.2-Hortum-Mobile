import 'package:flutter/material.dart';

class CircleStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        height: 120,
        width: 100,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Color(0xff478C5C).withOpacity(0.2),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(250))),
      ),
    );
  }
}
