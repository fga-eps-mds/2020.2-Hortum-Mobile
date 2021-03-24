import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/announcement_box.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/views/home_productor/components/categories.dart';

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
                child: ListView.builder(
                  itemCount: announcements.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Container(
                        color: Color(0xFFECF87F).withOpacity(0.4),
                        height: size.height * 0.03,
                        width: size.width * 0.26,
                        margin: EdgeInsets.only(left: size.width * 0.55),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: size.height * 0.03,
                              width: size.width * 0.06,
                              child: MaterialButton(
                                padding: EdgeInsets.all(0),
                                child: Icon(
                                  Icons.edit,
                                  size: 25,
                                  color: Color(0xFF478C5C),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                              height: size.height * 0.03,
                              width: size.width * 0.06,
                              child: MaterialButton(
                                padding: EdgeInsets.all(0),
                                child: Icon(
                                  Icons.visibility_off,
                                  size: 25,
                                  color: Color(0xFF478C5C),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                              height: size.height * 0.03,
                              width: size.width * 0.06,
                              child: MaterialButton(
                                padding: EdgeInsets.all(0),
                                child: Icon(
                                  Icons.delete,
                                  size: 25,
                                  color: Color(0xFF478C5C),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      AnnouncementBox(
                          profilePic: announcements[index]['profilePic'],
                          name: announcements[index]['name'],
                          title: announcements[index]['title'],
                          localization: announcements[index]['localization'],
                          price: announcements[index]['price'],
                          productPic: announcements[index]['productPic'])
                    ]);
                  },
                ),
              ),
            ],
          ),
        ),
        Footer()
      ]),
    );
  }
}
