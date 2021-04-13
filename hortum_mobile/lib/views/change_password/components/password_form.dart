import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/components/form_validation.dart';
import 'package:hortum_mobile/data/change_password_backend.dart';
import 'package:hortum_mobile/views/change_password/services/change_password_services.dart';

class PasswordForm extends StatefulWidget {
  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final TextEditingController _actualPassword = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                      obscureText: true,
                      labelText: 'Senha atual',
                      controller: _actualPassword,
                      icon: Icon(Icons.lock_open, color: Colors.black),
                      validator: FormValidation.validatePassword,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomFormField(
                      obscureText: true,
                      labelText: 'Nova senha',
                      controller: _password,
                      icon: Icon(Icons.lock_open, color: Colors.black),
                      validator: FormValidation.validatePassword,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomFormField(
                      obscureText: true,
                      labelText: 'Confirme a senha',
                      controller: _confirmPassword,
                      icon: Icon(Icons.lock_open, color: Colors.black),
                      validator: (value) {
                        return FormValidation.validateConfirmPassword(
                            _password.text, value);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  ChangeServices.changePassword(
                      _actualPassword.text, _password.text, context);
                }
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
                  child: Text("SALVAR",
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Roboto-Bold')),
                ),
              )),
        ],
      ),
    );
  }
}
