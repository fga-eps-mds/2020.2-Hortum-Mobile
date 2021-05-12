import 'package:flutter/material.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/favorites/fav_page.dart';
import 'package:hortum_mobile/views/home_customer/home_customer_page.dart';
import 'package:hortum_mobile/views/home_productor/home_productor_page.dart';
import 'package:hortum_mobile/views/profile/profile_page.dart';
import 'package:hortum_mobile/views/register_announcement/announcement_register_page.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.17,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.01),
                      Colors.white,
                    ],
                    begin: AlignmentGeometry.lerp(
                        Alignment.topCenter, Alignment.center, 0.2),
                    end: AlignmentGeometry.lerp(
                        Alignment.topCenter, Alignment.center, 0.8)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xff47CC70).withOpacity(0.7),
                  Color(0xff1D8E40).withOpacity(0.7),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              height: size.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: size.width * 0.08),
                    child: MaterialButton(
                      onPressed: () {
                        if (actualUser.isProductor) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RegisterAnnounPage();
                          }));
                        } else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return FavPage(
                              isAnnouncement: true,
                            );
                          }));
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.only(right: size.width * 0.2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                margin:
                                    EdgeInsets.only(top: size.height * 0.005),
                                child: Icon(
                                  actualUser.isProductor
                                      ? Icons.note_add_rounded
                                      : Icons.favorite,
                                  size: 35,
                                  color: Colors.white,
                                )),
                            Container(
                              margin: EdgeInsets.only(top: size.height * 0.005),
                              child: Text(
                                actualUser.isProductor
                                    ? 'Criar Anúncio'
                                    : 'Favoritos',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: size.width * 0.08),
                    child: MaterialButton(
                      key: Key('profileButton'),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return UserProfile();
                        }));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: size.height * 0.005),
                              child: Icon(
                                Icons.account_circle,
                                size: 35,
                                color: Colors.white,
                              )),
                          Container(
                              margin: EdgeInsets.only(top: size.height * 0.005),
                              child: Text(
                                'Perfil',
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                bottom: size.height * 0.05,
              ),
              child: MaterialButton(
                key: Key('homeButton'),
                child: Container(
                  height: size.width * 0.18,
                  width: size.width * 0.18,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [Color(0xff5EED47), Color(0xff67B980)],
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black.withOpacity(0.25)),
                  ),
                  child: Icon(Icons.format_align_justify_rounded,
                      color: Colors.white, size: 30),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    if (actualUser.isProductor)
                      return ProductorHomePage();
                    else
                      return CustomerHomePage();
                  }));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
