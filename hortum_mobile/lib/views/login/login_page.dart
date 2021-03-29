import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hortum_mobile/data/login_backend.dart';
import 'package:hortum_mobile/views/home_customer/home_customer_page.dart';
import 'package:hortum_mobile/views/home_productor/home_productor_page.dart';
import 'package:hortum_mobile/views/login/components/dialog_account_type.dart';
import 'package:hortum_mobile/views/login/components/form_field_login.dart';
import '../register/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: size.height / 7, bottom: size.height / 22),
              height: size.height / 4,
              child: Image.asset("assets/images/logo.png"),
            ),
            FormFieldLogin(
              suffixIcon: false,
              controller: emailController,
              isObscure: false,
              label: 'Email',
              icon: Icons.email,
              validator: (value) {
                if (value.isEmpty) {
                  return "Digite o email";
                }
                return null;
              },
            ),
            FormFieldLogin(
              suffixIcon: true,
              controller: passwordController,
              isObscure: _isObscure,
              label: 'Senha',
              icon: Icons.lock,
              validator: (value) {
                if (value.isEmpty) {
                  return "Digite a senha";
                }
                return null;
              },
              onPressed: () {
                setState(() {
                  this._isObscure = !_isObscure;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(180, 0, 0, 0),
              child: TextButton(
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
            ),
            entrarButton(),
            DialogAccountType(),
          ],
        ),
      ),
    );
  }

  Padding entrarButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(85, 8, 85, 8),
      child: ElevatedButton(
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
    } else {
      if (user.isProductor) {
        return Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductorHomePage();
        }));
      } else {
        return Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CustomerHomePage();
        }));
      }
    }
  }
}
