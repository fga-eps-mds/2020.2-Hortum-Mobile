import 'package:flutter/material.dart';
import 'package:hortum_mobile/view/features/register/components/form_field..dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
  String _name = '';
  String _email = '';
  String _password = '';
  String _confirm_password = '';
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
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
                                onChanged: (String val) {
                                  widget._name = val;
                                },
                              ),
                              CustomFormField(
                                  obscureText: false,
                                  labelText: 'E-mail',
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
                                  onChanged: (value) =>
                                      setState(() => widget._email = value)),
                              CustomFormField(
                                  obscureText: true,
                                  labelText: 'Senha',
                                  icon: Icon(Icons.lock_open,
                                      color: Colors.black),
                                  validator: (value) {
                                    if (value.isEmpty)
                                      return ' o campo é obrigatório';

                                    if (value.length > 30)
                                      return "A senha deve conter menos de 30 dígitos";

                                    return null;
                                  },
                                  onChanged: (value) =>
                                      setState(() => widget._password = value)),
                              CustomFormField(
                                  obscureText: true,
                                  labelText: 'Confirmar Senha',
                                  icon: Icon(Icons.lock_open,
                                      color: Colors.black),
                                  validator: (value) {
                                    if (value.isEmpty)
                                      return ' o campo é obrigatório';
                                    if (widget._password.compareTo(value) != 0)
                                      return "A senha deve ser igual";
                                    return null;
                                  },
                                  onChanged: (value) => setState(
                                      () => widget._confirm_password = value)),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width * 0.44,
                          height: size.height * 0.05,
                          child: MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {}
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
