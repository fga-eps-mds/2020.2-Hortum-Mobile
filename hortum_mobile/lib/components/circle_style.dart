import 'package:flutter/material.dart';

class CircleStyle extends StatefulWidget {
  final Color color;
  final double opacity;

  const CircleStyle({@required this.color, @required this.opacity, Key key})
      : super(key: key);
  @override
  _CircleStyleState createState() => _CircleStyleState();
}

class _CircleStyleState extends State<CircleStyle> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        height: 120,
        width: 100,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: widget.color.withOpacity(widget.opacity),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(250))),
      ),
    );
  }
}
