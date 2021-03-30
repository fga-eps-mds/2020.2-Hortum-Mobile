String validateName(String value) {
  String patttern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "Informe o nome";
  } else if (!regExp.hasMatch(value)) {
    return "O nome deve conter caracteres de a-z ou A-Z";
  }

  return null;
}

String validateEmail(String value) {
  String patttern =
      r"(^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$)";
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "Informe o email";
  } else if (!regExp.hasMatch(value)) {
    return "Email inválido";
  }

  return null;
}

String validatePassword(String value) {
  if (value.isEmpty) return ' O campo é obrigatório';

  if (value.length > 30) return "A senha deve conter menos de 30 dígitos";

  return null;
}
