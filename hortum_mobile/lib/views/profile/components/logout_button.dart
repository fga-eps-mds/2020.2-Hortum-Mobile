import 'package:flutter/material.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/login/login_page.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.04,
      child: MaterialButton(
        onPressed: () {
          actualUser.deleteUser();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
              (route) => route.isCurrent);
        },
        child: Text(
          "Sair",
          style: TextStyle(
              fontSize: 15.0,
              decoration: TextDecoration.underline,
              color: Color(0xff219653)),
        ),
      ),
    );
  }
}
