import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/services/codec_string.dart';
import 'package:hortum_mobile/views/announcement_details/components/custom_carrousel.dart';
import 'package:hortum_mobile/views/announcement_details/components/localization_container.dart';
import 'package:hortum_mobile/views/announcement_details/components/price_container.dart';
import 'package:hortum_mobile/views/announcement_details/components/title_buttons_row.dart';
import 'package:hortum_mobile/views/productor_details/productor_details_page.dart';

class AnnouncementDetails extends StatefulWidget {
  final String profilePic;
  final String name;
  final String title;
  final List localizations;
  final String price;
  final List<dynamic> productPic;
  final String description;
  final String email;

  const AnnouncementDetails(
      {@required this.profilePic,
      @required this.name,
      @required this.title,
      @required this.localizations,
      @required this.price,
      @required this.productPic,
      @required this.description,
      @required this.email,
      Key key})
      : super(key: key);
  @override
  _AnnouncementDetailsState createState() => _AnnouncementDetailsState();
}

class _AnnouncementDetailsState extends State<AnnouncementDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        SingleChildScrollView(
          padding: EdgeInsets.only(top: 25),
          child: Container(
            height: size.height * 0.87,
            child: ListView(
              children: [
                TitleButtonsRow(title: widget.title),
                PriceContainer(price: widget.price),
                LocalizationContainer(localizations: widget.localizations),
                Container(
                  padding: EdgeInsets.only(left: size.width * 0.08),
                  margin: EdgeInsets.only(bottom: size.height * 0.02),
                  child: Row(
                    children: [
                      Container(
                        height: size.height * 0.03,
                        width: size.width * 0.06,
                        child: Icon(
                          Icons.image,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: size.width * 0.02),
                        child: Text(
                          "Imagens",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontFamily: 'Comfortaa-Regular',
                              letterSpacing: -0.33,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                CustomCarrousel(productPic: widget.productPic),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Container(
                      margin: EdgeInsets.only(top: size.height * 0.025),
                      padding: EdgeInsets.only(top: 10),
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.25)),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.35),
                                spreadRadius: 0,
                                offset: Offset(0, 4))
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: size.width * 0.05,
                                ),
                                height: size.height * 0.03,
                                width: size.width * 0.06,
                                child: Icon(
                                  Icons.place,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(left: size.width * 0.02),
                                child: Text(
                                  "Descrição",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontFamily: 'Comfortaa-Regular',
                                      letterSpacing: -0.33,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                size.width * 0.125,
                                size.height * 0.01,
                                size.width * 0.125,
                                size.height * 0.02),
                            child: Text(
                              widget.description,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.5,
                                  fontFamily: 'Comfortaa-Regular',
                                  letterSpacing: -0.33,
                                  fontWeight: FontWeight.w300),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      )),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: size.height * 0.04),
                  child: MaterialButton(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      child: Material(
                        child: InkWell(
                            child: Image.network(widget.profilePic,
                                fit: BoxFit.fill,
                                height: size.height * 0.08,
                                width: size.height * 0.08)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProductorDetails(
                            email: encodeString(widget.email),
                            productorProfilePicture: widget.profilePic,
                            name: widget.name);
                      }));
                    },
                  ),
                ),
                Center(
                  child: Container(
                    margin:
                        EdgeInsets.only(bottom: size.height * 0.07, top: 10),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Roboto-Regular',
                          letterSpacing: -0.33,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Footer()
      ]),
    );
  }
}
