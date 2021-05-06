import 'package:flutter/material.dart';

class FormFieldLogin extends StatefulWidget {
  final bool isObscure;
  final TextEditingController controller;
  final onPressed;
  final String label;
  final IconData icon;
  final bool suffixIcon;
  final Function validator;
  final Key keyIdentifier;
  const FormFieldLogin(
      {@required this.controller,
      @required this.isObscure,
      @required this.label,
      @required this.icon,
      @required this.validator,
      @required this.suffixIcon,
      @required this.keyIdentifier,
      this.onPressed,
      Key key})
      : super(key: key);
  @override
  _FormFieldLoginState createState() => _FormFieldLoginState();
}

class _FormFieldLoginState extends State<FormFieldLogin> {
  @override
  Widget build(BuildContext context) {
    bool obscure = widget.isObscure;
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: TextFormField(
        key: widget.keyIdentifier,
        obscureText: obscure,
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(0xFF, 244, 156, 0))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(0xFF, 244, 156, 0))),
          prefixIcon: Icon(
            widget.icon,
            color: Color.fromARGB(0xFF, 244, 156, 0),
          ),
          suffixIcon: widget.suffixIcon
              ? IconButton(
                  icon: Icon(
                    widget.isObscure ? Icons.visibility_off : Icons.visibility,
                    color: Color.fromARGB(0xFF, 244, 156, 0),
                  ),
                  onPressed: widget.onPressed)
              : null,
        ),
      ),
    );
  }
}
