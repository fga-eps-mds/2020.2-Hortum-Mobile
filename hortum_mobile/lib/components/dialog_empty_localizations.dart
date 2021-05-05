import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogEmptyLocalizations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: Key('emptyLocalizations'),
      title: Text("Erro!"),
      content: Text(
        "O anúncio deve ter ao menos 1 localização",
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 16,
        ),
      ),
      actions: [
        TextButton(
          key: Key('okButton'),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "OK",
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 22,
              color: Color.fromARGB(0xFF, 244, 156, 0),
            ),
          ),
        )
      ],
    );
  }
}
