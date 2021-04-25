import 'package:flutter/material.dart';
import 'package:hortum_mobile/views/delete_account/delete_account_page.dart';

class DeleteAccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(Icons.delete_outline, color: Color(0xff219653)),
      MaterialButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => DeleteAccountPage()),
              (route) => route.isCurrent);
        },
        child: Text(
          "Excluir conta",
          style: TextStyle(
              fontSize: 16.0,
              decoration: TextDecoration.underline,
              color: Color(0xff219653)),
        ),
      )
    ]);
  }
}
