import 'package:flutter/material.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/login/login_page.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: TextButton(
      key: Key('logoutButton'),
      onPressed: () {
        actualUser.deleteUser();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false);
      },
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(
              left: size.width * 0.21, right: size.width * 0.21)),
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff75CE90)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ))),
      child: Text(
        "SAIR",
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.white,
        ),
      ),
    ));
  }
}
