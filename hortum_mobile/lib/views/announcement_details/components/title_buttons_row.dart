import 'package:flutter/material.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/home_customer/home_customer_page.dart';
import 'package:hortum_mobile/views/home_productor/home_productor_page.dart';

class TitleButtonsRow extends StatefulWidget {
  final String title;
  const TitleButtonsRow({@required this.title, Key key}) : super(key: key);
  @override
  _TitleButtonsRowState createState() => _TitleButtonsRowState();
}

class _TitleButtonsRowState extends State<TitleButtonsRow> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Container(
        margin: EdgeInsets.only(top: size.height * 0.028),
        height: size.height * 0.03,
        width: size.width * 0.06,
        child: MaterialButton(
          key: Key('announcementReturn'),
          padding: EdgeInsets.all(0),
          child: Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              if (actualUser.isProductor == true) {
                return ProductorHomePage();
              } else {
                return CustomerHomePage();
              }
            }));
          },
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: size.height * 0.028),
        child: Text(
          widget.title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: 'Roboto-Regular',
              letterSpacing: -0.33,
              fontWeight: FontWeight.w300),
        ),
      ),
    ]);
  }
}
