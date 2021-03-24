import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/components/photo_select.dart';
import 'package:hortum_mobile/view/register_announcement/components/announ_register_form.dart';

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
          height: size.height,
          child: Stack(
            children: [
              Container(
                height: size.height,
                child: Column(
                  children: <Widget>[
                    PhotoSelecter(),
                    Container(
                        height: size.height * 0.43,
                        child: ListView(children: [AnnounRegisterForm()])),
                  ],
                ),
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
