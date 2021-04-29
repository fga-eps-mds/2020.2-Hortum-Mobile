import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/data/user_data_backend.dart';

import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/home_customer/home_customer_page.dart';
import 'package:hortum_mobile/views/home_productor/home_productor_page.dart';

class ProfileServices {
  static Future updateUser(
      Dio dio, String nameForm, String emailForm, BuildContext context) async {
    var response;
    UserAPI updateData = new UserAPI(dio);

    if (actualUser.email == emailForm) {
      response = await updateData.updateUser(username: nameForm);
    } else if (actualUser.username == nameForm) {
      response = await updateData.updateUser(email: emailForm);
    } else {
      response =
          await updateData.updateUser(username: nameForm, email: emailForm);
    }

    if (response == 400) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            key: Key('emailJaExistente'),
            title: Text("Erro!"),
            content: Text(
              "Email já registrado!",
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
      actualUser.email = emailForm;
      actualUser.username = nameForm;
      if (actualUser.isProductor) {
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
