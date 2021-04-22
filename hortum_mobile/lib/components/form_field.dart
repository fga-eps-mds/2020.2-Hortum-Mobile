import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final String labelText;
  final Icon icon;
  final Function validator;
  final bool obscureText;
  final TextEditingController controller;
  final bool suffixIcon;
  final onPressed;
  const CustomFormField(
      {@required this.labelText,
      @required this.icon,
      @required this.validator,
      this.obscureText,
      @required this.controller,
      @required this.suffixIcon,
      this.onPressed,
      Key key})
      : super(key: key);
  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: (widget.obscureText == null ? false : widget.obscureText),
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5)),
          prefixIcon: widget.icon,
          suffixIcon: widget.suffixIcon
              ? IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  onPressed: widget.onPressed)
              : null,
          labelText: widget.labelText,
          contentPadding: EdgeInsets.only(top: 2)),
      validator: widget.validator,
      controller: widget.controller,
    );
  }
}
