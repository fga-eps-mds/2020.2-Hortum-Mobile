import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/circle_style.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/views/advanced_settings/components/change_password_button.dart';
import 'package:hortum_mobile/views/advanced_settings/components/delete_account_button.dart';
import 'package:hortum_mobile/views/advanced_settings/components/logout_button.dart';

class AdvancedSettingsPage extends StatefulWidget {
  final Dio dio;

  const AdvancedSettingsPage({this.dio, Key key}) : super(key: key);
  @override
  _AdvancedSettingsStatePage createState() => _AdvancedSettingsStatePage();
}

class _AdvancedSettingsStatePage extends State<AdvancedSettingsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              CircleStyle(color: Color(0xffF49C00), opacity: 0.2),
              Text(
                'AVANÇADO',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontFamily: 'Comfortaa-Regular',
                    letterSpacing: -0.33,
                    fontWeight: FontWeight.w300),
              ),
              Container(
                  padding: EdgeInsets.only(
                      top: size.height * 0.05, left: size.width * 0.10),
                  child: Column(
                    children: [
                      ChangePasswordButton(),
                      DeleteAccountButton(),
                      LogoutButton(),
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.05),
                height: size.height / 5,
                child: Image.asset("assets/images/logo.png"),
              ),
            ],
          ),
        ),
        Footer(),
      ]),
    );
  }
}
