import 'package:flutter/material.dart';

class CustomDescField extends StatefulWidget {
  final Function validator;
  final bool obscureText;
  final TextEditingController controller;
  const CustomDescField(
      {@required this.validator,
      this.obscureText,
      @required this.controller,
      Key key})
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
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(15)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 3.0),
          ),
          contentPadding: EdgeInsets.only(top: 2)),
      validator: widget.validator,
      controller: widget.controller,
    );
  }
}
