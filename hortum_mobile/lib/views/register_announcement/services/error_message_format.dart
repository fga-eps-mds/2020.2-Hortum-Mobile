class Formarter {
  static String announErrorFormart(String responseMsg) {
    if (responseMsg == '{images: [This field is required.]}')
      return 'É preciso adicionar uma imagem';
    else
      return 'Nome de anúncio já utilizado';
  }
}
