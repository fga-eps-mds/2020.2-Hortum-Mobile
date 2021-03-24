import 'package:flutter/material.dart';
import 'package:hortum_mobile/data/register_backend.dart';
import 'package:hortum_mobile/view/register/components/form_field.dart';

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
                                obscureText: false,
                                labelText: 'Nome',
                                icon: Icon(Icons.face, color: Colors.black),
                                validator: (value) {
                                  String patttern = r'(^[a-zA-Z ]*$)';
                                  RegExp regExp = new RegExp(patttern);
                                  if (value.length == 0) {
                                    return "Informe o nome";
                                  } else if (!regExp.hasMatch(value)) {
                                    return "O nome deve conter caracteres de a-z ou A-Z";
                                  }

                                  return null;
                                },
                              ),
                              CustomFormField(
                                obscureText: false,
                                labelText: 'E-mail',
                                controller: _email,
                                icon: Icon(Icons.email_outlined,
                                    color: Colors.black),
                                validator: (value) {
                                  String patttern =
                                      r"(^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$)";
                                  RegExp regExp = new RegExp(patttern);
                                  if (value.length == 0) {
                                    return "Informe o email";
                                  } else if (!regExp.hasMatch(value)) {
                                    return "Email inválido";
                                  }

                                  return null;
                                },
                              ),
                              CustomFormField(
                                obscureText: true,
                                labelText: 'Senha',
                                controller: _password,
                                icon:
                                    Icon(Icons.lock_open, color: Colors.black),
                                validator: (value) {
                                  if (value.isEmpty)
                                    return ' o campo é obrigatório';

                                  if (value.length > 30)
                                    return "A senha deve conter menos de 30 dígitos";

                                  return null;
                                },
                              ),
                              CustomFormField(
                                obscureText: true,
                                labelText: 'Confirmar Senha',
                                controller: _confirmPassword,
                                icon:
                                    Icon(Icons.lock_open, color: Colors.black),
                                validator: (value) {
                                  if (value.isEmpty)
                                    return ' o campo é obrigatório';
                                  if (_password.text.compareTo(value) != 0)
                                    return "A senha deve ser igual";
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width * 0.44,
                          height: size.height * 0.05,
                          child: MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  RegisterApi.register(_name.text, _email.text,
                                      _password.text, _isProductor);
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              elevation: 0.0,
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: Color(0xFF81B622),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        spreadRadius: 0,
                                        blurRadius: 4.0,
                                        offset: Offset(0, 4))
                                  ],
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 300.0, minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "CADASTRAR",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Roboto-Bold',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  )))),
    );
  }
}
