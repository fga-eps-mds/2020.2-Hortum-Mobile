import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/view/profile/profile.dart';
import 'package:splashscreen/splashscreen.dart';

import 'login/login_page.dart';

class IntroScreenPage extends StatefulWidget {
  @override
  _IntroScreenPageState createState() => _IntroScreenPageState();
}

class _IntroScreenPageState extends State<IntroScreenPage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen(context);
  }
}

Widget _introScreen(context) {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 3,
        backgroundColor: Color.fromARGB(0xFF, 129, 182, 34),
        navigateAfterSeconds: LoginPage(),
        loaderColor: Colors.transparent,
      ),
      Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    ],
  );
}
