import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hortum_mobile/api_http.dart';

class LoginPage extends StatefulWidget {
  //LoginPage({Key key) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 7,
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset("images/logo.png"),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 22,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
              child: TextField(
                //TextField email
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 15,
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(0xFF, 244, 156, 0))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(0xFF, 244, 156, 0))),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color.fromARGB(0xFF, 244, 156, 0), //Cor laranja
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 8, 40, 0),
              child: TextField(
                //TextFiled password
                obscureText: _isObscure,
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 15,
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(0xFF, 244, 156, 0))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(0xFF, 244, 156, 0))),
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
            ),
            Padding(
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
            ),
            Padding(
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
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 6, 100, 8),
              child: TextButton(
                //Botão não tenho conta
                onPressed: () {
                  print("Não tenho uma conta");
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
            ),
          ],
        ),
      ),
    );
  }

  onClickEntrar(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

    print(email);
    print(password);

    ApiHttp api = new ApiHttp();
    final json = await api.fetch();
    print(json);
  }
}
