import 'package:flutter/material.dart';
import 'package:hortum_mobile/views/register/register_page.dart';

class DialogAccountType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(100, 6, 100, 8),
      child: TextButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                key: Key('typeUser'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('Informe seu perfil de usuário:'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage(true)));
                    },
                    child: Text(
                      "Produtor",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 19,
                        color: Color.fromARGB(0xFF, 244, 156, 0),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage(false)));
                    },
                    child: Text(
                      "Comprador",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 19,
                        color: Color.fromARGB(0xFF, 244, 156, 0),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Text(
          "Não tenho uma conta",
          key: Key('newAccount'),
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
