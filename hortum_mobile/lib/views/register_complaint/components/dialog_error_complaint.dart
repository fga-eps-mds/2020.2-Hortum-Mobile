import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DialogErrorComplaint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: Key('complaintAlreadyExists'),
      title: Text("Erro!"),
      content: Text(
        "Você já realizou uma reclamação contra este produtor",
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
