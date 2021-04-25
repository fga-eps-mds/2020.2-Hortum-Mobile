import 'package:flutter/material.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/login/login_page.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(Icons.exit_to_app, color: Color(0xff219653)),
      MaterialButton(
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
              fontSize: 16.0,
              decoration: TextDecoration.underline,
              color: Color(0xff219653)),
        ),
      )
    ]);
  }
}
