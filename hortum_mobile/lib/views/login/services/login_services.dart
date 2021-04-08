import 'package:flutter/material.dart';
import 'package:hortum_mobile/data/login_backend.dart';
import 'package:hortum_mobile/views/home_customer/home_customer_page.dart';
import 'package:hortum_mobile/views/home_productor/home_productor_page.dart';

class LoginServices {
  static Future login(
      String emailForm, String passwordForm, BuildContext context) async {
    final email = emailForm;
    final password = passwordForm;

    var user = await LoginApi.login(email, password);
    if (user == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            key: Key('errorLogin'),
            title: Text("Erro!"),
            content: Text(
              "Email e/ou senha incorretos",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
              ),
            ),
            actions: [
              TextButton(
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
        },
      );
    } else {
      if (user.isProductor) {
        return Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductorHomePage();
        }));
      } else {
        return Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CustomerHomePage();
        }));
      }
    }
  }
}
