import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/views/profile/components/circle_style.dart';

import 'components/reclamation_form.dart';

class ReclamationPage extends StatefulWidget {
  final Dio dio;
  final String emailProductor;

  const ReclamationPage({this.dio, this.emailProductor, Key key})
      : super(key: key);
  @override
  _ReclamationPageState createState() => _ReclamationPageState();
}

class _ReclamationPageState extends State<ReclamationPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController name = new TextEditingController();
    final TextEditingController description = new TextEditingController();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Stack(
            children: [
              CircleStyle(color: Color(0xfff46a6a).withOpacity(0.2)),
              Container(
                padding: EdgeInsets.only(
                  right: size.width * 0.1,
                  left: size.width * 0.1,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  key: Key('reclamationContent'),
                  children: [
                    Text(
                      'RECLAMAÇÃO',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontFamily: 'Comfortaa-Regular',
                          letterSpacing: -0.33,
                          fontWeight: FontWeight.w300),
                    ),
                    ReclamationForm(
                        dio: widget.dio,
                        name: name,
                        description: description,
                        emailProductor: widget.emailProductor),
                  ],
                ),
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
