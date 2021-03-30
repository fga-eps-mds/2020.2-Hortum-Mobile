import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/confirm_button.dart';
import 'package:hortum_mobile/data/register_backend.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/views/register/services/register_services.dart';

class RegisterForm extends StatefulWidget {
  final bool _isProductor;
  RegisterForm(this._isProductor);
  @override
  _RegisterFormState createState() => _RegisterFormState(_isProductor);
}

class _RegisterFormState extends State<RegisterForm> {
  final bool _isProductor;
  _RegisterFormState(this._isProductor);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height * 0.55,
        decoration: new BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
                colors: [
                  Color(0xFF90ED80).withOpacity(0.18),
                  Color(0xFF56C378).withOpacity(0.6),
                ],
                stops: [
                  0.0,
                  1.0
                ]),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0),
            )),
        child: Center(
          child: Form(
            key: _formKey,
            child: Container(
              width: size.width * 0.75,
              margin: EdgeInsets.only(top: size.height * 0.02),
              child: Column(
                children: <Widget>[
                  Container(
                    height: size.height * 0.42,
                    margin: EdgeInsets.only(bottom: size.height * 0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomFormField(
                          controller: _name,
                          labelText: 'Nome',
                          icon: Icon(Icons.face, color: Colors.black),
                          validator: validateName,
                        ),
                        CustomFormField(
                          labelText: 'E-mail',
                          controller: _email,
                          icon: Icon(Icons.email_outlined, color: Colors.black),
                          validator: validatePassword,
                        ),
                        CustomFormField(
                          obscureText: true,
                          labelText: 'Senha',
                          controller: _password,
                          icon: Icon(Icons.lock_open, color: Colors.black),
                          validator: validatePassword,
                        ),
                        CustomFormField(
                          obscureText: true,
                          labelText: 'Confirmar Senha',
                          controller: _confirmPassword,
                          icon: Icon(Icons.lock_open, color: Colors.black),
                          validator: (value) {
                            if (value.isEmpty) return ' o campo é obrigatório';
                            if (_password.text.compareTo(value) != 0)
                              return "A senha deve ser igual";
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  ConfirmButton(
                      labelButton: "CADASTRAR",
                      colorButton: Color(0xFF81B622),
                      onClickAction: () {
                        if (_formKey.currentState.validate()) {
                          RegisterApi.register(
                            _name.text,
                            _email.text,
                            _password.text,
                            _isProductor,
                          );
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
