import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../forget_password_page.dart';

class DialogAnswerEmail extends StatelessWidget {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      key: Key("confirmAnswerEmail"),
      content: SingleChildScrollView(
        child: Text(
          'Clique no botão abaixo se já confirmou o email enviado',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
          ),
        ),
      ),
      actions: [
        Container(
          width: size.width * 0.3,
          height: size.height * 0.04,
          decoration: BoxDecoration(
            color: Color(0xff81B622),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: MaterialButton(
            key: Key('a'),
            padding: EdgeInsets.all(0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ForgetPasswordPage()),
              );
            },
            child: Text(
              "Confirmar",
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Roboto-Bold', fontSize: 11),
            ),
          ),
        ),
      ],
    );
  }
}
