import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/categories.dart';
import 'package:hortum_mobile/components/confirm_button.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/data/announ_register_backend.dart';
import 'package:hortum_mobile/views/register_announcement/components/select_field.dart';
import 'package:hortum_mobile/views/register_announcement/services/register_announcements_services.dart';

class AnnounRegisterForm extends StatefulWidget {
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomFormField(
                      labelText: 'Titulo',
                      icon: Icon(
                        Icons.title_outlined,
                        color: Colors.black,
                      ),
                      validator: validateTitle,
                      controller: _titulo),
                  CustomFormField(
                      labelText: 'Localização',
                      icon: Icon(
                        Icons.location_on_outlined,
                        color: Colors.black,
                      ),
                      validator: validateLocalization,
                      controller: _localizacao),
                  SelectFormField(
                    labelText: 'Categoria',
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.black,
                    ),
                    validator: validateCategory,
                    listValues: announcementsCategories,
                    controller: _categoria,
                  ),
                  CustomFormField(
                      labelText: 'Preço',
                      icon: Icon(
                        Icons.attach_money_outlined,
                        color: Colors.black,
                      ),
                      validator: validatePrice,
                      controller: _preco),
                  CustomFormField(
                      labelText: 'Descrição',
                      icon: Icon(
                        Icons.insert_comment_outlined,
                        color: Colors.black,
                      ),
                      validator: validateDescription,
                      controller: _descricao),
                  Container(
                    margin: EdgeInsets.only(bottom: size.height * 0.05),
                    child: ConfirmButton(
                        labelButton: "CRIAR",
                        colorButton: Color(0xFFF49C00),
                        onClickAction: () {
                          if (_formKey.currentState.validate()) {
                            RegisterAnnounApi.registerAnnoun(
                                _titulo.text,
                                _descricao.text,
                                double.parse(_preco.text),
                                _categoria.text);
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
