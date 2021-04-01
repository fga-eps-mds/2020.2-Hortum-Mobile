import 'package:flutter/material.dart';

class ButtonsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: size.height * 0.03,
          width: size.width * 0.06,
          child: MaterialButton(
            padding: EdgeInsets.all(0),
            child: Icon(
              Icons.edit,
              size: 25,
              color: Color(0xFF478C5C),
            ),
            onPressed: () {},
          ),
        ),
        Container(
          height: size.height * 0.03,
          width: size.width * 0.06,
          child: MaterialButton(
            padding: EdgeInsets.all(0),
            child: Icon(
              Icons.visibility_off,
              size: 25,
              color: Color(0xFF478C5C),
            ),
            onPressed: () {},
          ),
        ),
        Container(
          height: size.height * 0.03,
          width: size.width * 0.06,
          child: MaterialButton(
            padding: EdgeInsets.all(0),
            child: Icon(
              Icons.delete,
              size: 25,
              color: Color(0xFF478C5C),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
