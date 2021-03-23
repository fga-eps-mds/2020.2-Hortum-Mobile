import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hortum_mobile/data/login_backend.dart';

import '../register/page/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  bool _isProductor = false;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 7,
            ),
            logoImage(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 22,
            ),
            emailTextForm(),
            passwordTextForm(),
            esqueciSenhaButton(),
            entrarButton(),
            naoTenhoContaButton(),
          ],
        ),
      ),
    );
  }

  Center logoImage() {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        child: Align(
          alignment: Alignment.center,
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
    );
  }

  Padding emailTextForm() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
      child: TextFormField(
        //TextField email
        controller: emailController,
        validator: _validaLogin,
        decoration: InputDecoration(
          labelText: "Email",
          labelStyle: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(0xFF, 244, 156, 0))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(0xFF, 244, 156, 0))),
          prefixIcon: Icon(
            Icons.email,
            color: Color.fromARGB(0xFF, 244, 156, 0), //Cor laranja
          ),
        ),
      ),
    );
  }

  Padding passwordTextForm() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 8, 40, 0),
      child: TextFormField(
        //TextFiled password
        obscureText: _isObscure,
        controller: passwordController,
        validator: _validaPassword,
        decoration: InputDecoration(
          labelText: "Senha",
          labelStyle: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(0xFF, 244, 156, 0))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(0xFF, 244, 156, 0))),
          prefixIcon: Icon(
            Icons.lock,
            color: Color.fromARGB(0xFF, 244, 156, 0),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility_off : Icons.visibility,
              color: Color.fromARGB(0xFF, 244, 156, 0),
            ),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          ),
        ),
      ),
    );
  }

  String _validaLogin(String texto) {
    if (texto.isEmpty) {
      return "Digite o email";
    }
    return null;
  }

  String _validaPassword(String texto) {
    if (texto.isEmpty) {
      return "Digite a senha";
    }
    return null;
  }

  Padding esqueciSenhaButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(180, 0, 0, 0),
      child: TextButton(
        //Botão esqueci a senha
        onPressed: () {
          print("esqueci minha senha");
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

  Padding entrarButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(85, 8, 85, 8),
      child: ElevatedButton(
        //Botão entrar
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(0xFF, 244, 156, 0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
        onPressed: () {
          onClickEntrar(context);
        },
        child: Text(
          "ENTRAR",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 22,
            package: 'fonts/Roboto/Roboto-Black.ttf',
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Padding naoTenhoContaButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(100, 6, 100, 8),
      child: TextButton(
        //Botão não tenho conta
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: true, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('Informe seu perfil de usuário:'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      _isProductor = true;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RegisterPage(_isProductor)));
                    },
                    child: Text(
                      "Produtor",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 19,
                        color: Color.fromARGB(0xFF, 244, 156, 0),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _isProductor = false;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RegisterPage(_isProductor)));
                    },
                    child: Text(
                      "Comprador",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 19,
                        color: Color.fromARGB(0xFF, 244, 156, 0),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Text(
          "Não tenho uma conta",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 12,
            color: Color.fromARGB(0xFF, 244, 156, 0),
          ),
        ),
      ),
    );
  }

  onClickEntrar(BuildContext context) async {
    bool formOK = _formKey.currentState.validate();
    if (!formOK) return;

    final email = emailController.text;
    final password = passwordController.text;

    var user = await LoginApi.login(email, password);

    if (user == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Erro!"),
            content: Text(
              "Email e/ou senha incorretos",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "OK",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 22,
                    color: Color.fromARGB(0xFF, 244, 156, 0),
                  ),
                ),
              )
            ],
          );
        },
      );
    }
  }
}
