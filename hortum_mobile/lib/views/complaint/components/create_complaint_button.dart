import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hortum_mobile/services/codec_string.dart';
import 'package:hortum_mobile/views/register_complaint/register_complaint_page.dart';

class CreateComplaintButton extends StatelessWidget {
  final Dio dio;
  final String emailProductor;

  const CreateComplaintButton(
      {this.dio, @required this.emailProductor, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextEditingController name = new TextEditingController();
    final TextEditingController description = new TextEditingController();
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.675),
      child: Container(
        width: size.width * 0.3,
        height: size.height * 0.04,
        margin: EdgeInsets.only(top: size.height * 0.07),
        decoration: BoxDecoration(
          color: Color(0xffA7DDB7),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: MaterialButton(
          key: Key('createcomplaintButton'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterComplaintPage(
                  dio: dio,
                  name: name,
                  description: description,
                  emailProductor: decodeString(emailProductor),
                ),
              ),
            );
          },
          child: Text(
            "Criar reclamação",
            style: TextStyle(
                color: Colors.black, fontFamily: 'Roboto-Bold', fontSize: 11),
          ),
        ),
      ),
    );
  }
}
