import 'package:flutter/material.dart';

class LocalizationContainer extends StatefulWidget {
  final String localization;
  const LocalizationContainer({@required this.localization, Key key})
      : super(key: key);
  @override
  _LocalizationContainerState createState() => _LocalizationContainerState();
}

class _LocalizationContainerState extends State<LocalizationContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(bottom: size.height * 0.03),
        width: size.width * 0.9,
        height: size.height * 0.1496,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: Colors.black.withOpacity(0.25)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.35),
                  spreadRadius: 0,
                  offset: Offset(0, 4))
            ]),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: size.width * 0.05,
                  ),
                  height: size.height * 0.03,
                  width: size.width * 0.06,
                  child: Icon(
                    Icons.place,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
                Container(
                  child: Text(
                    "Localização",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Comfortaa-Regular',
                        letterSpacing: -0.33,
                        fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: size.width * 0.2),
              child: Text(
                widget.localization,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Comfortaa-Regular',
                    letterSpacing: -0.33,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: size.width * 0.2),
              child: Text(
                widget.localization,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Comfortaa-Regular',
                    letterSpacing: -0.33,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: size.width * 0.2),
              child: Text(
                widget.localization,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Comfortaa-Regular',
                    letterSpacing: -0.33,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: size.width * 0.2),
              child: Text(
                widget.localization,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Comfortaa-Regular',
                    letterSpacing: -0.33,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ));
  }
}
