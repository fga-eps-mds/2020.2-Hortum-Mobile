import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/circle_style.dart';
import 'package:hortum_mobile/views/forget_password/components/dialog_answer_email.dart';

import 'components/forget_password_form.dart';

class ForgetPasswordPage extends StatefulWidget {
  final Dio dio;

  const ForgetPasswordPage({this.dio, Key key}) : super(key: key);
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController password = new TextEditingController();
    final TextEditingController confirmPassword = new TextEditingController();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Stack(
            children: [
              CircleStyle(color: Color(0xff478C5C), opacity: 0.2),
              Container(
                padding: EdgeInsets.only(
                  right: size.width * 0.1,
                  left: size.width * 0.1,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  key: Key('forgetPasswordContent'),
                  children: [
                    Text(
                      'MUDAR SENHA',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontFamily: 'Comfortaa-Regular',
                          letterSpacing: -0.33,
                          fontWeight: FontWeight.w300),
                    ),
                    ForgetPasswordForm(
                        dio: widget.dio,
                        password: password,
                        confirmPassword: confirmPassword)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
