import 'package:flutter/material.dart';

class CustomDescField extends StatefulWidget {
  final Function validator;
  final TextEditingController controller;
  const CustomDescField(
      {@required this.validator, @required this.controller, Key key})
      : super(key: key);
  @override
  _CustomDescFieldState createState() => _CustomDescFieldState();
}

class _CustomDescFieldState extends State<CustomDescField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 6,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.circular(15)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1.5),
              borderRadius: BorderRadius.circular(15)),
          contentPadding: EdgeInsets.all(8)),
      validator: widget.validator,
      controller: widget.controller,
    );
  }
}
