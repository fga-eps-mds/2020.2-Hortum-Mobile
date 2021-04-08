class AnnouncementsFormValidation {
  static String validateTitle(String value) {
    String patttern = r'(^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ0-9 ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o título do anúncio";
    } else if (!regExp.hasMatch(value)) {
      return "Título inválido";
    }
    return null;
  }

  static String validateLocalization(String value) {
    if (value.length == 0) {
      return "Informe a localização";
    }
    // Adicionar validação de Localização
    return null;
  }

  static String validateCategory(String value) {
    if (value == null) {
      return "Informe a categoria do produto";
    }
    return null;
  }

  static String validatePrice(String value) {
    String patttern = r'(^[0-9.]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o preço";
    } else if (!regExp.hasMatch(value)) {
      return "Preço inválido";
    }
    return null;
  }

  static String validateDescription(String value) {
    if (value.length == 0) {
      return "Informe uma descrição para o produto";
    } else if (value.length > 200) {
      return "A descrição deve conter no máximo 200 caracteres";
    }
    return null;
  }
}
