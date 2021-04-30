import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/categories.dart';
import 'package:hortum_mobile/components/confirm_button.dart';
import 'package:hortum_mobile/components/custom_desc_field.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/components/form_validation.dart';
import 'package:hortum_mobile/views/register_announcement/components/select_field.dart';
import 'package:hortum_mobile/views/register_announcement/services/register_announcements_services.dart';

class AnnounRegisterForm extends StatefulWidget {
  final Dio dio;

  const AnnounRegisterForm({Key key, this.dio}) : super(key: key);
  @override
  _AnnounRegisterFormState createState() => _AnnounRegisterFormState();
}

class _AnnounRegisterFormState extends State<AnnounRegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titulo = TextEditingController();
  final TextEditingController _localizacao = TextEditingController();
  final TextEditingController _categoria = TextEditingController();
  final TextEditingController _preco = TextEditingController();
  final TextEditingController _descricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Container(
        child: Center(
          child: Form(
            key: _formKey,
            child: Container(
              height: size.height * 0.62,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomFormField(
                      suffixIcon: false,
                      labelText: 'Titulo',
                      icon: Icon(
                        Icons.title_outlined,
                        color: Colors.black,
                      ),
                      validator: FormValidation.validateTitle,
                      controller: _titulo),
                  CustomFormField(
                      suffixIcon: false,
                      labelText: 'Localização',
                      icon: Icon(
                        Icons.location_on_outlined,
                        color: Colors.black,
                      ),
                      validator: FormValidation.validateLocalization,
                      controller: _localizacao),
                  SelectFormField(
                    labelText: 'Categoria',
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.black,
                    ),
                    validator: FormValidation.validateCategory,
                    listValues: announcementsCategories,
                    controller: _categoria,
                  ),
                  CustomFormField(
                      suffixIcon: false,
                      labelText: 'Preço',
                      icon: Icon(
                        Icons.attach_money_outlined,
                        color: Colors.black,
                      ),
                      validator: FormValidation.validatePrice,
                      controller: _preco),
                  Column(children: [
                    Row(children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Icon(
                          Icons.insert_comment_outlined,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: Text('Descrição'),
                      ),
                    ]),
                    CustomDescField(
                      validator: FormValidation.validateDescription,
                      controller: _descricao,
                    ),
                  ]),
                  Container(
                    margin: EdgeInsets.only(bottom: size.height * 0.05),
                    child: ConfirmButton(
                        labelButton: "CRIAR",
                        colorButton: Color(0xFFF49C00),
                        onClickAction: () {
                          if (_formKey.currentState.validate()) {
                            registerAnnounServices(
                                widget.dio,
                                _titulo.text,
                                _descricao.text,
                                double.parse(_preco.text),
                                _categoria.text,
                                context);
                          }
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
