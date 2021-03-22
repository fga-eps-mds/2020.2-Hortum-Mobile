import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/photo_select.dart';
import 'package:hortum_mobile/view/register/components/register_form.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: size.height * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              PhotoSelecter(),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
