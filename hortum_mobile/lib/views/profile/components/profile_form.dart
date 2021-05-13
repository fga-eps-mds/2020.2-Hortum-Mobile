import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/components/form_validation.dart';
import 'package:hortum_mobile/views/profile/components/advanced_settings_button.dart';
import 'package:hortum_mobile/views/profile/services/profile_services.dart';

import '../../../globals.dart';

class ProfileForm extends StatefulWidget {
  final Dio dio;
  final TextEditingController email;
  final TextEditingController username;
  final TextEditingController phone_number;

  const ProfileForm(
      {this.dio, this.email, this.username, this.phone_number, key})
      : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState(
      email: email, username: username, phone_number: phone_number);
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email;
  final TextEditingController username;
  final TextEditingController phone_number;
  _ProfileFormState({
    this.email,
    this.username,
    this.phone_number,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.4,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.025),
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
                    padding: EdgeInsets.only(bottom: size.height * 0.025),
                    child: CustomFormField(
                      suffixIcon: false,
                      obscureText: false,
                      labelText: 'E-mail',
                      controller: email,
                      icon: Icon(Icons.email_outlined, color: Colors.black),
                      validator: FormValidation.validateEmail,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.025),
                    child: CustomFormField(
                      suffixIcon: false,
                      obscureText: false,
                      labelText: 'Telefone',
                      controller: phone_number,
                      icon: Icon(Icons.phone, color: Colors.black),
                      validator: FormValidation.validatePhone,
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
                      actualUser.email != email.text ||
                      actualUser.phone_number != phone_number.text ||
                      controllerPicture.newPictureNotifier.value != null) {
                    ProfileServices.updateUser(widget.dio, username.text,
                        email.text, phone_number.text, context);
                    controllerPicture.newPictureNotifier.value = null;
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
