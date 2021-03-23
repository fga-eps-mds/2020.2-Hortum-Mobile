import 'package:flutter/material.dart';

class ConfirmButton extends StatefulWidget {
  final String labelButton;
  final Color colorButton;
  final Function onClickAction;
  const ConfirmButton(
      {@required this.labelButton,
      @required this.colorButton,
      @required this.onClickAction,
      Key key})
      : super(key: key);
  @override
  _ConfirmButtonState createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(85, 8, 85, 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
          primary: widget.colorButton,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
        onPressed: widget.onClickAction,
        child: Text(
          widget.labelButton,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto-Bold',
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
