import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: size.height * 0.03,
        width: size.width * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          color: Color(0xffF46A6A).withOpacity(0.3),
        ),
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(top: size.height * 0.07),
        child: MaterialButton(
          key: Key('buttonArrowback'),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
