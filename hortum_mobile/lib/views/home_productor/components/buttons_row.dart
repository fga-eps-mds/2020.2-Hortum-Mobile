import 'package:flutter/material.dart';

class ButtonsRow extends StatefulWidget {
  final String title;

  const ButtonsRow({@required this.title, Key key}) : super(key: key);
  @override
  _ButtonRowState createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonsRow> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Color(0xFFECF87F).withOpacity(0.4),
      height: size.height * 0.03,
      width: size.width * 0.26,
      margin: EdgeInsets.only(left: size.width * 0.55),
      child: Row(
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
      ),
    );
  }
}
