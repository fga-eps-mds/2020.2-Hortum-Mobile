class FormValidation {
  static String validateName(String value) {
    String patttern = r'(^[a-zA-Zà-úÁ-Ú ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o nome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }

    return null;
  }

  static String validateEmail(String value) {
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

  static String validatePassword(String value) {
    if (value.isEmpty) return 'O campo é obrigatório';

    if (value.length > 30) return "A senha deve conter menos de 30 dígitos";

    return null;
  }

  static String validateConfirmPassword(
      String password, String confirmPassword) {
    if (confirmPassword.isEmpty) return 'O campo é obrigatório';
    if (password.compareTo(confirmPassword) != 0)
      return "A senha deve ser igual";
    return null;
  }

  static String validateDescription(String value) {
    if (value.length == 0) {
      return "Informe a descrição";
    } else if (value.length > 450) {
      return "A descrição deve conter no máximo 450 caracteres";
    }
    return null;
  }
}
