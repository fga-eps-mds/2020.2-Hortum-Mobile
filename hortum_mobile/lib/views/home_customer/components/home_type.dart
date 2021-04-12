import 'package:flutter/material.dart';

class HomeType extends StatefulWidget {
  final bool isAnnouncements;
  final onPressed;

  const HomeType(
      {@required this.isAnnouncements, @required this.onPressed, Key key})
      : super(key: key);
  @override
  _HomeTypeState createState() => _HomeTypeState();
}

class _HomeTypeState extends State<HomeType> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      child: Padding(
        padding: EdgeInsets.only(left: size.width * 0.12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                      widget.isAnnouncements ? 'Anúncios' : 'Produtores',
                      style: TextStyle(
                          fontFamily: 'Comfortaa-Bold',
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * 0.022))),
              margin: EdgeInsets.only(top: size.height * 0.05),
              width: size.width * 0.5,
              height: size.height * 0.04,
              decoration: BoxDecoration(
                  color: Color(0xffA7DDB7),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
            ),
            Container(
              margin: EdgeInsets.only(top: 35),
              child: IconButton(
                  icon: Icon(Icons.cached, color: Color(0xff72C98C)),
                  onPressed: widget.onPressed,
                  alignment: Alignment.center),
            ),
          ],
        ),
      ),
    );
  }
}
