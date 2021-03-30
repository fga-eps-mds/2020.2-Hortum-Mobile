import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/profile/components/add_picture.dart';
import 'package:hortum_mobile/views/profile/components/circle_style.dart';
import 'package:hortum_mobile/views/profile/components/profile_picture.dart';
import 'package:hortum_mobile/views/profile/services/profile_services.dart';
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
              CircleStyle(),
              Container(
                padding: EdgeInsets.only(
                    right: size.width * 0.1, left: size.width * 0.1),
                child: Column(
                  children: [
                    ProfilePicture(),
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
                                    validator: validateName,
                                  ),
                                  CustomFormField(
                                    obscureText: false,
                                    labelText: 'E-mail',
                                    controller: _email,
                                    icon: Icon(Icons.email_outlined,
                                        color: Colors.black),
                                    validator: validateEmail,
                                  ),
                                  CustomFormField(
                                    obscureText: true,
                                    labelText: 'Senha',
                                    controller: _password,
                                    icon: Icon(Icons.lock_open,
                                        color: Colors.black),
                                    validator: validatePassword,
                                  ),
                                  CustomFormField(
                                    obscureText: true,
                                    labelText: 'Confirmar Senha',
                                    controller: _confirmPassword,
                                    icon: Icon(Icons.lock_open,
                                        color: Colors.black),
                                    validator: (value) {
                                      if (value.isEmpty)
                                        return 'O campo é obrigatório';
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
              AddPictureButton(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
