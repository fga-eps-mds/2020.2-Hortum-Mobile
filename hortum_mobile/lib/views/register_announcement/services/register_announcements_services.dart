String validateTitle(String value) {
  String patttern = r'(^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "Informe o titulo do anúncio";
  } else if (!regExp.hasMatch(value)) {
    return "O titulo não deve conter números";
  }
  return null;
}

String validateLocalization(String value) {
  if (value.length == 0) {
    return "Informe a localização";
  }
  // Adicionar validação de Localização
  return null;
}

String validateCategory(String value) {
  if (value == null) {
    return "Informe a categoria do produto";
  }
  return null;
}

String validatePrice(String value) {
  String patttern = r'(^[0-9.]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "Informe o preço";
  } else if (!regExp.hasMatch(value)) {
    return "O preço deve possuir caracters de 0-9 separados por .";
  }
  return null;
}

String validateDescription(String value) {
  if (value.length == 0) {
    return "Informe uma descrição para o produto";
  } else if (value.length > 200) {
    return "A descrição deve conter no máximo 200 caracteres";
  }
  return null;
}
