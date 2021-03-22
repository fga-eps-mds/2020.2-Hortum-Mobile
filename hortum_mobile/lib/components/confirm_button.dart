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

    // return Container(
    //   width: size.width * 0.44,
    //   height: size.height * 0.05,
    //   child: MaterialButton(
    //       onPressed: widget.onClickAction,
    //       shape:
    //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
    //       elevation: 0.0,
    //       padding: EdgeInsets.all(0.0),
    //       child: Ink(
    //         decoration: BoxDecoration(
    //           color: widget.colorButton,
    //           boxShadow: [
    //             BoxShadow(
    //                 color: Colors.black.withOpacity(0.25),
    //                 spreadRadius: 0,
    //                 blurRadius: 4.0,
    //                 offset: Offset(0, 4))
    //           ],
    //           borderRadius: BorderRadius.circular(30.0),
    //         ),
    //         child: Container(
    //           constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
    //           alignment: Alignment.center,
    //           child: Text(
    //             widget.labelButton,
    //             style: TextStyle(
    //                 color: Colors.white,
    //                 fontFamily: 'Roboto-Bold',
    //                 fontSize: 16.0,
    //                 fontWeight: FontWeight.bold),
    //           ),
    //         ),
    //       )),
    // );
  }
}
