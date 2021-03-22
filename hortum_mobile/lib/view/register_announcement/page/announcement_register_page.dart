import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hortum_mobile/components/photo_select.dart';

class RegisterAnnounPage extends StatefulWidget {
  @override
  _RegisterAnnounPageState createState() => _RegisterAnnounPageState();
}

class _RegisterAnnounPageState extends State<RegisterAnnounPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: size.height * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              PhotoSelecter(),
            ],
          ),
        ),
      ),
    );
  }
}
