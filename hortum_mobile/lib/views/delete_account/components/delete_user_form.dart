import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/components/form_validation.dart';
import 'package:hortum_mobile/views/delete_account/components/dialog_confirm_delete.dart';

class DeleteUserForm extends StatefulWidget {
  final Dio dio;
  final TextEditingController actualPassword;
  final TextEditingController password;
  final TextEditingController confirmPassword;

  const DeleteUserForm(
      {this.dio,
      this.actualPassword,
      this.confirmPassword,
      this.password,
      Key key})
      : super(key: key);
  @override
  _DeleteUserFormState createState() => _DeleteUserFormState(
      actualPassword: actualPassword,
      password: password,
      confirmPassword: confirmPassword);
}

class _DeleteUserFormState extends State<DeleteUserForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController actualPassword;
  final TextEditingController password;
  final TextEditingController confirmPassword;

  _DeleteUserFormState(
      {this.actualPassword, this.confirmPassword, this.password});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.6,
      child: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.5,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomFormField(
                      suffixIcon: false,
                      obscureText: true,
                      labelText: 'Insira sua senha',
                      controller: password,
                      icon: Icon(Icons.lock_open, color: Colors.black),
                      validator: FormValidation.validatePassword,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomFormField(
                      suffixIcon: false,
                      obscureText: true,
                      labelText: 'Confirme a senha',
                      controller: confirmPassword,
                      icon: Icon(Icons.lock_open, color: Colors.black),
                      validator: (value) {
                        return FormValidation.validateConfirmPassword(
                            password.text, value);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  dialogDeleteConfirmUser(context, password, widget.dio);
                }
              },
              child: Container(
                width: size.width * 0.5,
                height: size.height * 0.04,
                margin: EdgeInsets.only(top: size.height / 100),
                decoration: BoxDecoration(
                  color: Color(0xffF46A6A),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("EXCLUIR",
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Roboto-Bold')),
                ),
              )),
        ],
      ),
    );
  }
}
