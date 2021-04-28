import 'package:flutter/material.dart';
import 'package:hortum_mobile/views/change_password/change_password_page.dart';

class ChangePasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.04,
      child: MaterialButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => ChangePasswordPage()),
              (route) => route.isCurrent);
        },
        child: Text(
          "Mudar senha",
          style: TextStyle(
              fontSize: 15.0,
              decoration: TextDecoration.underline,
              color: Color(0xff219653)),
        ),
      ),
    );
  }
}
