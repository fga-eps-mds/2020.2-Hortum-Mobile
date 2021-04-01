import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/views/home_productor/components/list_announcements.dart';

class ProductorHomePage extends StatefulWidget {
  @override
  _ProductorHomePageState createState() => _ProductorHomePageState();
}

class _ProductorHomePageState extends State<ProductorHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.08),
                child: Text(
                  'MEUS ANÚNCIOS',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontFamily: 'Comfortaa-Regular',
                      letterSpacing: -0.33,
                      fontWeight: FontWeight.w300),
                ),
              ),
              Container(
                  height: size.height * 0.75,
                  margin: EdgeInsets.only(bottom: size.height * 0.05),
                  child: ListAnnouncement()),
            ],
          ),
        ),
        Footer()
      ]),
    );
  }
}
