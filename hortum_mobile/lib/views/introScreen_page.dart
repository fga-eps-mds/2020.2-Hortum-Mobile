import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/data/auto_login_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'home_customer/home_customer_page.dart';
import 'home_productor/home_productor_page.dart';
import 'login/login_page.dart';
import 'package:page_transition/page_transition.dart';

var tokenAccess;
bool isProductor;

class IntroScreenPage extends StatefulWidget {
  @override
  _IntroScreenPageState createState() => _IntroScreenPageState();
}

class _IntroScreenPageState extends State<IntroScreenPage> {
  @override
  void initState() {
    actualUser.readSecureData('token_access').then((value) {
      tokenAccess = value;

      if (tokenAccess != null) {
        AutomaticLoginAPI.automaticLogin().then((value) {
          isProductor = value;
        });
      }
    });

    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: tokenAccess == null
                    ? LoginPage()
                    : isProductor
                        ? ProductorHomePage()
                        : CustomerHomePage(),
                type: PageTransitionType.fade)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _introScreen(context);
  }
}

Widget _introScreen(context) {
  return Scaffold(
      backgroundColor: Color.fromARGB(0xFF, 129, 182, 34),
      body: Container(
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        )),
      ));
}
