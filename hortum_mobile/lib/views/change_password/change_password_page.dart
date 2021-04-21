import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/circle_style.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/views/change_password/components/password_form.dart';

class ChangePasswordPage extends StatefulWidget {
  final Dio dio;

  const ChangePasswordPage({this.dio, Key key}) : super(key: key);
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController actualPassword = new TextEditingController();
    final TextEditingController password = new TextEditingController();
    final TextEditingController confirmPassword = new TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Stack(
            children: [
              CircleStyle(),
              Container(
                padding: EdgeInsets.only(
                  right: size.width * 0.1,
                  left: size.width * 0.1,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  key: Key('profileContent'),
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
                    PasswordForm(
                        dio: widget.dio,
                        actualPassword: actualPassword,
                        password: password,
                        confirmPassword: confirmPassword)
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
