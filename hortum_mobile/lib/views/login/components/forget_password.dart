import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(180, 0, 0, 0),
      child: TextButton(
        onPressed: () {
          print("esqueci minha senha");
        },
        child: Text(
          "Esqueci minha senha",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 12,
            color: Color.fromARGB(0xFF, 244, 156, 0),
          ),
        ),
      ),
    );
  }
}
