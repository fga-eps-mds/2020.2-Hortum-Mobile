import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/announcement_box.dart';
import 'package:hortum_mobile/components/circle_style.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/components/profile_picture.dart';

class ProductorDetails extends StatefulWidget {
  @override
  _ProductorDetailsState createState() => _ProductorDetailsState();
}

class _ProductorDetailsState extends State<ProductorDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Stack(
            children: [
              CircleStyle(color: Color(0xff478C5C), opacity: 0.25),
              Container(
                  width: size.width,
                  padding: EdgeInsets.only(top: size.height * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    key: Key('productorDetails'),
                    children: [
                      ProfilePicture(
                        width: size.width * 0.4,
                        heigth: size.width * 0.4,
                        radius: 70,
                        bottomMargin: size.height * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Carlos Silva",
                                style: TextStyle(
                                    fontFamily: 'Roboto-Bold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25)),
                            IconButton(
                                padding: EdgeInsets.only(left: 10),
                                icon: Icon(Icons.ios_share,
                                    color: Color(0xffA7DDB7)),
                                onPressed: () {}),
                            IconButton(
                                padding: EdgeInsets.only(top: 5, right: 10),
                                icon: Icon(Icons.report,
                                    color: Color(0xffFF4D00)),
                                onPressed: () {}),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width,
                        height: size.height * 0.45,
                        child: ListView(children: [
                          Column(
                            children: [
                              Container(
                                width: size.width * 0.8,
                                height: size.height * 0.17,
                                margin:
                                    EdgeInsets.only(top: size.height * 0.02),
                                padding: EdgeInsets.only(
                                    top: size.height * 0.01,
                                    left: size.width * 0.03),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.25)),
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
                                                decoration:
                                                    TextDecoration.underline)),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 5, left: 10),
                                      child: Text(
                                        'Asa Norte 404, Feira Matinal',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 5, left: 10),
                                      child: Text(
                                        'Asa Norte 404, Feira Matinal',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 5, left: 10),
                                      child: Text(
                                        'Asa Norte 404, Feira Matinal',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text('Anúncios',
                                        style: TextStyle(
                                            fontFamily: 'Comfortaa-Bold',
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.height * 0.022))),
                                margin: EdgeInsets.only(
                                    top: size.height * 0.05,
                                    bottom: size.height * 0.03),
                                width: size.width * 0.5,
                                height: size.height * 0.04,
                                decoration: BoxDecoration(
                                    color: Color(0xffA7DDB7),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                              ),
                              AnnouncementBox(
                                  profilePic: 'assets/images/perfil.jpg',
                                  name: "Carlos",
                                  title: "Meia dúzia de banana",
                                  localization: 'Asa Norte, 404 Feira Da Tarde',
                                  price: "R\$ 25,00",
                                  productPic: 'assets/images/banana.jpg'),
                              AnnouncementBox(
                                  profilePic: 'assets/images/perfil.jpg',
                                  name: "Carlos",
                                  title: "Meia dúzia de banana",
                                  localization: 'Asa Norte, 404 Feira Da Tarde',
                                  price: "R\$ 25,00",
                                  productPic: 'assets/images/banana.jpg'),
                              AnnouncementBox(
                                  profilePic: 'assets/images/perfil.jpg',
                                  name: "Carlos",
                                  title: "Meia dúzia de banana",
                                  localization: 'Asa Norte, 404 Feira Da Tarde',
                                  price: "R\$ 25,00",
                                  productPic: 'assets/images/banana.jpg'),
                            ],
                          ),
                        ]),
                      )
                    ],
                  )),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
