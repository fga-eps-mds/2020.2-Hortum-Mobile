import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArrowBackButton extends StatefulWidget {
  const ArrowBackButton({Key key}) : super(key: key);
  @override
  _ArrowBackButtonState createState() => _ArrowBackButtonState();
}

class _ArrowBackButtonState extends State<ArrowBackButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.03,
      width: size.width * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        color: Color(0xffF46A6A).withOpacity(0.3),
      ),
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: size.height * 0.07, left: size.width * 0.05),
      child: MaterialButton(
        key: Key('buttonArrowback'),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Align(
          alignment: Alignment.topLeft,
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
