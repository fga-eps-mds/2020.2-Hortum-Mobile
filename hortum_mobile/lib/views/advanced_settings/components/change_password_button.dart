import 'package:flutter/material.dart';
import 'package:hortum_mobile/views/change_password/change_password_page.dart';

class ChangePasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextButton(
      key: Key('changePasswordButton'),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChangePasswordPage()),
        );
      },
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>((EdgeInsets.only(
              left: size.width * 0.125, right: size.width * 0.125))),
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff75CE90)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ))),
      child: Text(
        "MUDAR SENHA",
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
