import 'package:flutter/material.dart';

class ProductorLocalization extends StatefulWidget {
  @override
  _ProductorLocalizationState createState() => _ProductorLocalizationState();
}

class _ProductorLocalizationState extends State<ProductorLocalization> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: size.height * 0.17,
      margin: EdgeInsets.only(top: size.height * 0.02),
      padding:
          EdgeInsets.only(top: size.height * 0.01, left: size.width * 0.03),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
          border: Border.all(color: Colors.black.withOpacity(0.25)),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.25),
                offset: Offset(0, 4))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.room),
              Text('Meus Locais',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline)),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 10),
            child: Text(
              'Asa Norte 404, Feira Matinal',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 10),
            child: Text(
              'Asa Norte 404, Feira Matinal',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 10),
            child: Text(
              'Asa Norte 404, Feira Matinal',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
