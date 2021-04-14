import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hortum_mobile/views/home_productor/home_productor_page.dart';

class AnnouncementDetails extends StatefulWidget {
  final String profilePic;
  final String name;
  final String title;
  final String localization;
  final String price;
  final String productPic;

  const AnnouncementDetails(
      {@required this.profilePic,
      @required this.name,
      @required this.title,
      @required this.localization,
      @required this.price,
      @required this.productPic,
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
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Stack(
            children: [
              Column(children: [
                Container(
                    margin: EdgeInsets.only(top: size.height * 0.026),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: size.height * 0.03,
                            width: size.width * 0.06,
                            child: MaterialButton(
                              padding: EdgeInsets.all(0),
                              child: Icon(
                                Icons.arrow_back,
                                size: 25,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ProductorHomePage();
                                }));
                              },
                            ),
                          ),
                          Container(
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
                          Container(
                            height: size.height * 0.03,
                            width: size.width * 0.06,
                            child: MaterialButton(
                              padding: EdgeInsets.all(0),
                              child: Icon(
                                Icons.near_me_outlined,
                                size: 30,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ])),
                Container(
                  margin: EdgeInsets.only(
                      bottom: size.height * 0.04, top: size.height * 0.01),
                  width: size.width * 0.9,
                  height: size.height * 0.04,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: Colors.black.withOpacity(0.25)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            color: Colors.black.withOpacity(0.35),
                            spreadRadius: 0,
                            offset: Offset(0, 4))
                      ]),
                  child: Row(children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: size.width * 0.05, right: size.width * 0.02),
                      height: size.height * 0.03,
                      width: size.width * 0.06,
                      child: Icon(
                        Icons.credit_card_outlined,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Preço:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: 'Comfortaa-Regular',
                            letterSpacing: -0.33,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: size.width * 0.02, right: size.width * 0.02),
                      child: Text(
                        widget.price,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: 'Comfortaa-Regular',
                            letterSpacing: -0.33,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ]),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: size.height * 0.03),
                    width: size.width * 0.9,
                    height: size.height * 0.1496,
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
                                size: 25,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              child: Text(
                                "Localização",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Comfortaa-Regular',
                                    letterSpacing: -0.33,
                                    fontWeight: FontWeight.w300),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(right: size.width * 0.2),
                          child: Text(
                            widget.localization,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Comfortaa-Regular',
                                letterSpacing: -0.33,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: size.width * 0.2),
                          child: Text(
                            widget.localization,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Comfortaa-Regular',
                                letterSpacing: -0.33,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: size.width * 0.2),
                          child: Text(
                            widget.localization,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Comfortaa-Regular',
                                letterSpacing: -0.33,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: size.width * 0.2),
                          child: Text(
                            widget.localization,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Comfortaa-Regular',
                                letterSpacing: -0.33,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    )),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: size.width * 0.1, right: size.width * 0.02),
                      height: size.height * 0.03,
                      width: size.width * 0.06,
                      child: Icon(
                        Icons.image,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Imagens",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Comfortaa-Regular',
                            letterSpacing: -0.33,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
                CarouselSlider(
                  options: CarouselOptions(height: size.height * 0.2),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            child: InkWell(
                                child: Image.asset(widget.productPic,
                                    fit: BoxFit.fill,
                                    height: size.height * 0.2,
                                    width: size.height * 0.9)),
                            width: size.width * 0.9,
                            height: size.height * 0.15,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.25)),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 4,
                                      color: Colors.black.withOpacity(0.35),
                                      spreadRadius: 0,
                                      offset: Offset(0, 4))
                                ]));
                      },
                    );
                  }).toList(),
                ),
                Container(
                    margin: EdgeInsets.only(top: size.height * 0.03),
                    width: size.width * 0.9,
                    height: size.height * 0.15,
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
                                size: 25,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              child: Text(
                                "Descrição",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Comfortaa-Regular',
                                    letterSpacing: -0.33,
                                    fontWeight: FontWeight.w300),
                              ),
                            )
                          ],
                        ),
                        Container(
                          child: Text(
                            "Brócolis recentemente plantado em um local perto de lorem ipsum Brócolis recentemente plantado em um local perto de lorem ipsum Brócolis recentemente plantado em um local perto de lorem ipsum Brócolis recentemente plantado em um local perto de lorem ipsum",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Comfortaa-Regular',
                                letterSpacing: -0.33,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    )),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Material(
                      child: InkWell(
                          child: MaterialButton(
                        onPressed: () {},
                        child: Image.asset(widget.profilePic,
                            fit: BoxFit.fill,
                            height: size.height * 0.06,
                            width: size.height * 0.06),
                      )),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    widget.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Roboto-Regular',
                        letterSpacing: -0.33,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ]),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
