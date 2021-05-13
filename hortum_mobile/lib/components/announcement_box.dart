import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/data/announ_favorite_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/services/codec_string.dart';
import 'package:hortum_mobile/views/announcement_details/announcement_details_page.dart';
import 'package:hortum_mobile/views/productor_details/productor_details_page.dart';

class AnnouncementBox extends StatefulWidget {
  final String profilePic;
  final String name;
  final String title;
  final List localizations;
  final String price;
  final String productPic;
  final String email;
  final Dio dio;
  final String description;
  final bool isFavPage;

  const AnnouncementBox(
      {@required this.profilePic,
      @required this.name,
      @required this.title,
      @required this.localizations,
      @required this.price,
      @required this.productPic,
      @required this.email,
      @required this.description,
      @required this.isFavPage,
      this.dio,
      Key key})
      : super(key: key);
  @override
  _AnnouncementBoxState createState() => _AnnouncementBoxState();
}

class _AnnouncementBoxState extends State<AnnouncementBox> {
  bool isFavoriteAnounc;

  @override
  // ignore: must_call_super
  void initState() => isFavoriteAnounc = widget.isFavPage;

  @override
  Widget build(BuildContext context) {
    String allLocalizations = widget.localizations[0];
    for (int i = 1; i < widget.localizations.length; i++) {
      allLocalizations += ', ' + widget.localizations[i];
    }
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
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  MaterialButton(
                    key: Key('productorDetailsButton'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProductorDetails(
                            email: encodeString(widget.email),
                            name: widget.name);
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: size.height * 0.05),
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
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: size.height * 0.12),
                      child: Column(
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: Text(
                              widget.name,
                              style: TextStyle(fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          if (!actualUser.isProductor)
                            Material(
                              child: IconButton(
                                key: Key('favAnnoun'),
                                color: isFavoriteAnounc
                                    ? Colors.red
                                    : Colors.black,
                                padding: EdgeInsets.all(size.height * 0.0001),
                                constraints: BoxConstraints(
                                  minWidth: 0,
                                  minHeight: 0,
                                ),
                                icon: Icon(Icons.favorite_border_outlined,
                                    size: 20),
                                onPressed: () async {
                                  await changeData.favAnnoun(
                                      widget.email, widget.title);
                                  setState(() {
                                    isFavoriteAnounc = !isFavoriteAnounc;
                                  });
                                },
                              ),
                            ),
                        ],
                      ))
                ],
              )),
          Container(
            width: size.width * 0.694,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: MaterialButton(
              key: Key('announcementDetailsButton'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AnnouncementDetails(
                    email: widget.email,
                    description: widget.description,
                    localizations: widget.localizations,
                    name: widget.name,
                    price: widget.price,
                    productPic: widget.productPic,
                    profilePic: widget.profilePic,
                    title: widget.title,
                  );
                }));
              },
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
                        padding: EdgeInsets.only(left: size.width * 0.02),
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
                              width: size.width * 0.3,
                              height: size.height * 0.05,
                              child: Text(
                                allLocalizations,
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
                            right: size.width * 0.02, top: size.height * 0.01),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: Material(
                            child: InkWell(
                                child: Image.asset(widget.productPic,
                                    fit: BoxFit.fill,
                                    height: size.height * 0.09,
                                    width: size.width * 0.17)),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
