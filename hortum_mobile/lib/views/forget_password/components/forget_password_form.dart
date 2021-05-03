import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/components/form_validation.dart';
import 'package:hortum_mobile/views/change_password/services/change_password_services.dart';

class ForgetPasswordForm extends StatefulWidget {
  final Dio dio;
  final TextEditingController password;
  final TextEditingController confirmPassword;

  const ForgetPasswordForm(
      {this.dio, this.confirmPassword, this.password, Key key})
      : super(key: key);
  @override
  _ForgetPasswordFormState createState() => _ForgetPasswordFormState(
      password: password, confirmPassword: confirmPassword);
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController password;
  final TextEditingController confirmPassword;

  _ForgetPasswordFormState({this.confirmPassword, this.password});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      key: Key('ForgetPasswordForm'),
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
                      labelText: 'Nova senha',
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
                      labelText: 'Confirme a nova senha',
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
                //   ChangePasswordServices.changePassword(
                //       widget.dio, actualPassword.text, password.text, context);
                // }
              },
              child: Container(
                width: size.width * 0.5,
                height: size.height * 0.04,
                margin: EdgeInsets.only(top: size.height / 100),
                decoration: BoxDecoration(
                  color: Color(0xff75CE90),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("ENVIAR",
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Roboto-Bold')),
                ),
              )),
        ],
      ),
    );
  }
}
