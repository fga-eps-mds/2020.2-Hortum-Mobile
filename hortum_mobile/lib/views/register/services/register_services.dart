import 'package:flutter/material.dart';
import 'package:hortum_mobile/data/register_backend.dart';
import 'package:hortum_mobile/views/register/components/dialog_erro_cadastrado.dart';
import 'package:hortum_mobile/views/register/components/dialog_email_enviado.dart';

Future<void> resgisterUser(
    String username,
    String email,
    String password,
    String telefone,
    bool isProductor,
    BuildContext context,
    RegisterApi registerApi) async {
  var response = await registerApi.register(
      username, email, password, telefone, isProductor, context);
  if (response.statusCode != 201) {
    String msgError = announErrorFormart(response.data.toString());
    dialogErroCadastrado(msgError, context);
  } else {
    dialogEmailEnviado(context);
  }
}

String announErrorFormart(String responseMsg) {
  if (responseMsg ==
      ("{user: {phone_number: [user with this phone number already exists.]}}"))
    return 'Telefone já cadastrado!';
  else if (responseMsg ==
      ("{user: {email: [user with this email already exists.]}}"))
    return 'Email já cadastrado!';
  else
    return 'Email e telefone já cadastrados!';
}
