import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/data/announ_favorite_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/favorites/fav_announ_page.dart';

class AnnouncementBox extends StatefulWidget {
  final String profilePic;
  final String name;
  final String title;
  final String localization;
  final String price;
  final String productPic;
  final String email;
  final Dio dio;

  const AnnouncementBox(
      {@required this.profilePic,
      @required this.name,
      @required this.title,
      @required this.localization,
      @required this.price,
      @required this.productPic,
      this.email,
      this.dio,
      Key key})
      : super(key: key);
  @override
  _AnnouncementBoxState createState() => _AnnouncementBoxState();
}

class _AnnouncementBoxState extends State<AnnouncementBox> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AnnounFavAPI changeData = new AnnounFavAPI(widget.dio);
    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.05),
      width: size.width * 0.9,
      height: size.height * 0.2,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Color(0xff57A051)),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                color: Colors.black.withOpacity(0.35),
                spreadRadius: 0,
                offset: Offset(0, 4))
          ]),
      child: Row(
        children: [
          Container(
            width: size.width * 0.2,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(right: BorderSide(color: Color(0xff57A051))),
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: size.height * 0.05, bottom: 3),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Material(
                      child: InkWell(
                          child: Image.asset(widget.profilePic,
                              fit: BoxFit.fill,
                              height: size.height * 0.06,
                              width: size.height * 0.06)),
                    ),
                  ),
                ),
                Text(widget.name, style: TextStyle(fontSize: 12)),
                if (!actualUser.isProductor)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        key: Key('favProd'),
                        padding: EdgeInsets.all(6),
                        constraints: BoxConstraints(
                          minWidth: 3,
                          minHeight: 3,
                        ),
                        icon: Icon(Icons.favorite_border_outlined, size: 22),
                        onPressed: () async {
                          await changeData.favAnnoun(
                              widget.email, widget.title);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FavAnnounPage()),
                              (route) => true);
                        },
                      ),
                      IconButton(
                        key: Key('favAnnoun'),
                        padding: EdgeInsets.all(6),
                        constraints: BoxConstraints(
                          minWidth: 3,
                          minHeight: 3,
                        ),
                        icon: Icon(Icons.thumb_up_alt_outlined, size: 22),
                        onPressed: () {},
                      )
                    ],
                  ),
              ],
            ),
          ),
          Container(
            width: size.width * 0.694,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: size.height * 0.015),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto-Bold'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.02),
                      padding: EdgeInsets.only(left: size.width * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.room,
                                size: 15,
                              ),
                              Text(
                                "Localização",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              widget.localization,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.attach_money_rounded,
                                size: 15,
                              ),
                              Text("Preço", style: TextStyle(fontSize: 12))
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              widget.price,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          right: size.width * 0.03, top: size.height * 0.01),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: Material(
                          child: InkWell(
                              child: Image.asset(widget.productPic,
                                  fit: BoxFit.fill,
                                  height: size.height * 0.1,
                                  width: size.width * 0.2)),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
