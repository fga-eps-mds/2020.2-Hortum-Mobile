import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final String labelText;
  final Icon icon;
  final Function validator;
  final Function onChanged;
  final bool obscureText;

  const CustomFormField(
      {@required this.labelText,
      @required this.icon,
      @required this.validator,
      @required this.onChanged,
      @required this.obscureText,
      Key key})
      : super(key: key);
  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: widget.obscureText,
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.5)),
            prefixIcon: widget.icon,
            labelText: widget.labelText,
            contentPadding: EdgeInsets.only(top: 2)),
        validator: widget.validator,
        onChanged: widget.onChanged);
  }
}
