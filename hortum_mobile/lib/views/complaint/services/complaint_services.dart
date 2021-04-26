import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/data/complaint_data_backend.dart';
import 'package:hortum_mobile/views/home_customer/home_customer_page.dart';

class ComplaintServices {
  static Future registerComplaint(
      {Dio dio,
      String name,
      String description,
      String emailProductor,
      BuildContext context}) async {
    ComplaintDataAPI registerComplaint = new ComplaintDataAPI(dio);
    var response = await registerComplaint.registerComplaint(
        name: name, description: description, emailProductor: emailProductor);
    if (response == 400) {
      showDialog(
        context: context,
        builder: (context) {
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
        },
      );
    } else {
      return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CustomerHomePage(
            dio: dio,
          ),
        ),
      );
    }
  }
}
