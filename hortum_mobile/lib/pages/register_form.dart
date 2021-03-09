import 'package:flutter/material.dart';

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
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: 5),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Digite seu e-mail',
              ),
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
              onChanged: (value) => setState(() => widget._email = value),
            ),
            SizedBox(height: 5),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Digite seu nome',
              ),
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
              onChanged: (value) => setState(() => widget._name = value),
            ),
            SizedBox(height: 5),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Cadastre a senha',
              ),
              validator: (value) {
                if (value.isEmpty) return ' o campo é obrigatório';

                if (value.length > 30)
                  return "A senha deve conter menos de 30 dígitos";

                return null;
              },
              onChanged: (value) => setState(() => widget._password = value),
            ),
            SizedBox(height: 5),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirme a senha',
              ),
              validator: (value) {
                if (value.isEmpty) return ' o campo é obrigatório';

                if (widget._password.compareTo(value) != 0)
                  return "A senha deve ser igual ";
                return null;
              },
              onChanged: (value) =>
                  setState(() => widget._confirm_password = value),
            ),
            RaisedButton(
                child: Text('Cadastrar'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {}
                })
          ],
        ));
  }
}
