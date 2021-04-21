import 'package:flutter/material.dart';

class CircleStyle extends StatelessWidget {
  final Color color;

  const CircleStyle({this.color});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        height: 120,
        width: 100,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: color,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(250))),
      ),
    );
  }
}
