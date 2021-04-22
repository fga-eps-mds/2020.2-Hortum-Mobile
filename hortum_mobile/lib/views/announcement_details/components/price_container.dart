import 'package:flutter/material.dart';

class PriceContainer extends StatefulWidget {
  final String price;
  const PriceContainer({@required this.price, Key key}) : super(key: key);
  @override
  _PriceContainerState createState() => _PriceContainerState();
}

class _PriceContainerState extends State<PriceContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin:
          EdgeInsets.only(bottom: size.height * 0.04, top: size.height * 0.01),
      width: size.width * 0.9,
      height: size.height * 0.04,
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
      child: Row(children: [
        Container(
          margin: EdgeInsets.only(
              left: size.width * 0.05, right: size.width * 0.02),
          height: size.height * 0.03,
          width: size.width * 0.06,
          child: Icon(
            Icons.credit_card_outlined,
            size: 25,
            color: Colors.black,
          ),
        ),
        Container(
          child: Text(
            "Preço:",
            style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontFamily: 'Comfortaa-Regular',
                letterSpacing: -0.33,
                fontWeight: FontWeight.w300),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: size.width * 0.02, right: size.width * 0.02),
          child: Text(
            widget.price,
            style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontFamily: 'Comfortaa-Regular',
                letterSpacing: -0.33,
                fontWeight: FontWeight.w300),
          ),
        )
      ]),
    );
  }
}
