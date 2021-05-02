import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/form_validation.dart';

import 'form_field_login.dart';

class ForgetPassword extends StatelessWidget {
  final TextEditingController emailController;
  const ForgetPassword([Key key, this.emailController]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(180, 0, 0, 0),
      child: TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              key: Key('sendEmailDialog'),
              insetPadding: EdgeInsets.only(
                  left: size.width * 0.01, right: size.width * 0.01),
              contentPadding: EdgeInsets.only(
                  left: size.width * 0.015,
                  right: size.width * 0.015,
                  bottom: size.height * 0.03,
                  top: size.height * 0.03),
              content: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: size.height / 6,
                        child: Image.asset("assets/images/logo.png"),
                      ),
                      Text(
                        'Informe o seu email para recuperar a senha e verifique a sua caixa de entrada',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                        ),
                      ),
                      FormFieldLogin(
                        keyIdentifier: Key('emailField'),
                        suffixIcon: false,
                        controller: emailController,
                        isObscure: false,
                        label: 'Email',
                        icon: Icons.email,
                        validator: FormValidation.validateEmail,
                      ),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                Container(
                  width: size.width * 0.3,
                  height: size.height * 0.04,
                  // margin: EdgeInsets.only(top: size.height * 0.07),
                  decoration: BoxDecoration(
                    color: Color(0xff81B622),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: MaterialButton(
                    key: Key('sendEmail'),
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {}
                    },
                    child: Text(
                      "Enviar",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto-Bold',
                          fontSize: 11),
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
