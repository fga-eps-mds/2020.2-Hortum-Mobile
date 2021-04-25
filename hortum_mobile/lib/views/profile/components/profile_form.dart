import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/components/form_validation.dart';
import 'package:hortum_mobile/views/profile/components/advanced_settings_button.dart';
import 'package:hortum_mobile/views/profile/services/profile_services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../globals.dart';

class ProfileForm extends StatefulWidget {
  final Dio dio;
  final TextEditingController email;
  final TextEditingController username;

  const ProfileForm({this.dio, this.email, this.username, key})
      : super(key: key);

  @override
  _ProfileFormState createState() =>
      _ProfileFormState(email: email, username: username);
}

class _ProfileFormState extends State<ProfileForm> {
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email;
  final TextEditingController username;
  _ProfileFormState({this.email, this.username});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.6,
      child: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.35,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CustomFormField(
                      suffixIcon: false,
                      controller: username,
                      obscureText: false,
                      labelText: 'Nome',
                      icon: Icon(Icons.face, color: Colors.black),
                      validator: FormValidation.validateName,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomFormField(
                      suffixIcon: false,
                      obscureText: false,
                      labelText: 'E-mail',
                      controller: email,
                      icon: Icon(Icons.email_outlined, color: Colors.black),
                      validator: FormValidation.validateEmail,
                    ),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  if (actualUser.username != username.text ||
                      actualUser.email != email.text) {
                    ProfileServices.updateUser(
                        widget.dio, username.text, email.text, context);
                  }
                }
              },
              key: Key('salvarButton'),
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
          AdvancedSettingsButton()
        ],
      ),
    );
  }
}
