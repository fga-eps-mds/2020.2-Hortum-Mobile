import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/components/form_validation.dart';

class PasswordForm extends StatefulWidget {
  final Dio dio;
  final TextEditingController actualPassword;
  final TextEditingController password;
  final TextEditingController confirmPassword;

  const PasswordForm(
      {this.dio,
      this.actualPassword,
      this.confirmPassword,
      this.password,
      Key key})
      : super(key: key);
  @override
  _PasswordFormState createState() => _PasswordFormState(
      actualPassword: actualPassword,
      password: password,
      confirmPassword: confirmPassword);
}

class _PasswordFormState extends State<PasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController actualPassword;
  final TextEditingController password;
  final TextEditingController confirmPassword;

  _PasswordFormState(
      {this.actualPassword, this.confirmPassword, this.password});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.6,
      child: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.5,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomFormField(
                      suffixIcon: false,
                      obscureText: true,
                      labelText: 'Insira sua senha',
                      controller: password,
                      icon: Icon(Icons.lock_open, color: Colors.black),
                      validator: FormValidation.validatePassword,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomFormField(
                      suffixIcon: false,
                      obscureText: true,
                      labelText: 'Confirme a senha',
                      controller: confirmPassword,
                      icon: Icon(Icons.lock_open, color: Colors.black),
                      validator: (value) {
                        return FormValidation.validateConfirmPassword(
                            password.text, value);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {}
              },
              child: Container(
                width: size.width * 0.5,
                height: size.height * 0.04,
                margin: EdgeInsets.only(top: size.height / 100),
                decoration: BoxDecoration(
                  color: Color(0xffF46A6A),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("EXCLUIR",
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Roboto-Bold')),
                ),
              )),
        ],
      ),
    );
  }
}
