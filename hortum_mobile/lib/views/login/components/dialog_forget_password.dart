import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../globals.dart';

class ForgetPassword extends StatelessWidget {
  final url = '$ip/reset_password/';
  ForgetPassword([Key key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(180, 0, 0, 0),
      child: TextButton(
        key: Key('forgetPassButton'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              key: Key('dialogForgetPassword'),
              insetPadding: EdgeInsets.only(
                  left: size.width * 0.04, right: size.width * 0.04),
              contentPadding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: size.height * 0.03,
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: size.height / 6,
                      child: Image.asset("assets/images/logo.png"),
                    ),
                    Container(
                      child: Text(
                        'Ao clicar no botão abaixo você será encaminhado para a página de redefinição de senha',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                Container(
                  width: size.width * 0.4,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                    color: Color(0xff81B622),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: MaterialButton(
                    key: Key('redirectButton'),
                    padding: EdgeInsets.all(0),
                    onPressed: () async {
                      await canLaunch(url)
                          ? await launch(url)
                          : throw 'Could not launch $url';
                    },
                    child: Text(
                      "Redefinir senha",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto-Bold',
                          fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        child: Text(
          "Esqueci minha senha",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 12,
            color: Color.fromARGB(0xFF, 244, 156, 0),
          ),
        ),
      ),
    );
  }
}
