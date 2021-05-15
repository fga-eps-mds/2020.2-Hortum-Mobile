import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PhoneNumberBox extends StatelessWidget {
  final String phone_number;
  const PhoneNumberBox({this.phone_number});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.01),
      child: Container(
        width: size.width * 0.4,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: Colors.black12),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.20),
                  spreadRadius: 0,
                  offset: Offset(0, 4))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.phone),
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                phone_number,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
