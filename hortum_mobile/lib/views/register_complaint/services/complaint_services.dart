import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/data/complaint_data_backend.dart';
import 'package:hortum_mobile/views/home_customer/home_customer_page.dart';
import 'package:hortum_mobile/views/register_complaint/components/dialog_error_complaint.dart';

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
            return DialogErrorComplaint();
          });
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
