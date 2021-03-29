import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/photo_select.dart';
import 'package:hortum_mobile/views/register/components/register_form.dart';

class RegisterPage extends StatefulWidget {
  final bool _isProductor;
  RegisterPage(this._isProductor);
  @override
  _RegisterPageState createState() => _RegisterPageState(_isProductor);
}

class _RegisterPageState extends State<RegisterPage> {
  final bool _isProductor;
  _RegisterPageState(this._isProductor);
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: size.height * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              PhotoSelecter(title: 'CADASTRO'),
              RegisterForm(_isProductor),
            ],
          ),
        ),
      ),
    );
  }
}
