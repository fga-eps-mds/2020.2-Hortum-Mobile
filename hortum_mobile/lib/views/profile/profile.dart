import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/register/components/form_field.dart';
import 'package:image_picker/image_picker.dart';

import '../../globals.dart';
import '../login/login_page.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final TextEditingController _password =
      TextEditingController(text: actualUser.password);
  final TextEditingController _confirmPassword =
      TextEditingController(text: actualUser.password);
  final TextEditingController _name =
      TextEditingController(text: actualUser.username);
  final TextEditingController _email =
      TextEditingController(text: actualUser.email);
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 120,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color(0xff478C5C).withOpacity(0.2),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(250))),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    right: size.width * 0.1, left: size.width * 0.1),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: size.height * 0.1, bottom: size.height * 0.05),
                      width: size.width * 0.3,
                      height: size.width * 0.3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Material(
                          child: InkWell(
                              child: Image.asset(
                            'assets/images/perfil.jpg',
                            fit: BoxFit.fill,
                          )),
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * 0.6,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: size.height * 0.4,
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    icon: Icon(Icons.lock_open,
                                        color: Colors.black),
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
                                    icon: Icon(Icons.lock_open,
                                        color: Colors.black),
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
                          ),
                          MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  print(_name.text);
                                  print(_email.text);
                                  print(_password.text);
                                  print(_confirmPassword.text);
                                }
                              },
                              child: Container(
                                width: size.width * 0.5,
                                height: size.height * 0.04,
                                margin:
                                    EdgeInsets.only(top: size.height * 0.03),
                                decoration: BoxDecoration(
                                  color: Color(0xff75CE90),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("SALVAR",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Roboto-Bold')),
                                ),
                              )),
                          MaterialButton(
                            onPressed: () {
                              actualUser.deleteUser();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                  (route) => route.isCurrent);
                            },
                            child: Text(
                              "Sair",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  decoration: TextDecoration.underline,
                                  color: Color(0xff219653)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(
                      top: size.height * 0.21, left: size.width * 0.25),
                  width: size.width * 0.12,
                  height: size.width * 0.12,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: MaterialButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () async {
                      final pickedFile =
                          await picker.getImage(source: ImageSource.gallery);

                      setState(() {
                        if (pickedFile != null) {
                          // _image = File(pickedFile.path);
                        } else {
                          print('No image selected.');
                        }
                      });
                    },
                    child: Icon(
                      Icons.add_photo_alternate,
                      size: 25,
                      color: Color(0xff75CE90),
                    ),
                  ),
                ),
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
