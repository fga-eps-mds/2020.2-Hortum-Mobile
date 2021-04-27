import 'package:flutter/material.dart';
import 'package:hortum_mobile/views/change_password/change_password_page.dart';

class ChangePasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(Icons.lock_open, color: Color(0xff219653)),
      MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChangePasswordPage()),
          );
        },
        child: Text(
          "Mudar senha",
          style: TextStyle(
              fontSize: 16.0,
              decoration: TextDecoration.underline,
              color: Color(0xff219653)),
        ),
      )
    ]);
  }
}
