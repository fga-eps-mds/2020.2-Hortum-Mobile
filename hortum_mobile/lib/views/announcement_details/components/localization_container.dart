import 'package:flutter/material.dart';

class LocalizationContainer extends StatefulWidget {
  final List localizations;
  const LocalizationContainer({@required this.localizations, Key key})
      : super(key: key);
  @override
  _LocalizationContainerState createState() => _LocalizationContainerState();
}

class _LocalizationContainerState extends State<LocalizationContainer> {
  @override
  Widget build(BuildContext context) {
    String allLocalizations = widget.localizations[0];
    for (int i = 1; i < widget.localizations.length; i++) {
      allLocalizations += '\n' + widget.localizations[i];
    }
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Container(
          margin: EdgeInsets.only(bottom: size.height * 0.03),
          padding: EdgeInsets.only(top: 10),
          width: size.width * 0.9,
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: size.width * 0.02),
                    child: Text(
                      "Localizações",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'Comfortaa-Regular',
                          letterSpacing: -0.33,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.08, vertical: 5),
                child: Text(
                  allLocalizations,
                  style: TextStyle(
                      color: Colors.black,
                      height: 1.45,
                      fontSize: 15,
                      fontFamily: 'Comfortaa-Regular',
                      letterSpacing: -0.33,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          )),
    );
  }
}
