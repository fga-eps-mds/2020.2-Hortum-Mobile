import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/views/favorites/components/select_favorite_button.dart';

class FavAnnounPage extends StatefulWidget {
  @override
  _FavAnnounPageState createState() => _FavAnnounPageState();
}

class _FavAnnounPageState extends State<FavAnnounPage> {
  bool isAnnouncement = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Scaffold(
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.08),
                  child: Text(
                    'FAVORITOS',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontFamily: 'Comfortaa-Regular',
                        letterSpacing: -0.33,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                FavSelectButton(
                  isAnnouncement: this.isAnnouncement,
                  onClickActionAnnoun: () {
                    this.isAnnouncement = true;
                    setState(() {});
                  },
                  onClickActionProductor: () {
                    this.isAnnouncement = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          Footer()
        ]),
      );
    });
  }
}
