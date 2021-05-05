import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/photo_select.dart';
import 'package:hortum_mobile/views/register/components/register_form.dart';

class RegisterPage extends StatefulWidget {
  final bool isProductor;
  final Dio dio;

  const RegisterPage({@required this.isProductor, this.dio, Key key})
      : super(key: key);
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
            key: Key('registerFormPage'),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              PhotoSelecter(title: 'CADASTRO'),
              RegisterForm(isProductor: widget.isProductor, dio: widget.dio),
            ],
          ),
        ),
      ),
    );
  }
}
