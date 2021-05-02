import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/categories.dart';
import 'package:hortum_mobile/components/confirm_button.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/data/announcements/announcements_backend.dart';
import 'package:hortum_mobile/views/register_announcement/components/select_field.dart';
import 'package:hortum_mobile/views/register_announcement/services/register_announcements_services.dart';

class AnnounRegisterForm extends StatefulWidget {
  @override
  _AnnounRegisterFormState createState() => _AnnounRegisterFormState();
}

class _AnnounRegisterFormState extends State<AnnounRegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titulo = TextEditingController();
  final List<TextEditingController> _localizacao = [TextEditingController()];
  final TextEditingController _categoria = TextEditingController();
  final TextEditingController _preco = TextEditingController();
  final TextEditingController _descricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AnnouncementsApi announcementsApi = AnnouncementsApi();

    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Container(
        child: Center(
          child: Form(
            key: _formKey,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomFormField(
                      suffixIcon: false,
                      labelText: 'Titulo',
                      icon: Icon(
                        Icons.title_outlined,
                        color: Colors.black,
                      ),
                      validator: AnnouncementsFormValidation.validateTitle,
                      controller: _titulo),
                  Container(
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _localizacao.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(top: size.height * 0.01),
                            child: CustomFormField(
                                suffixIcon: true,
                                onPressed: () {
                                  setState(() {
                                    if (_localizacao.length <= 2) {
                                      _localizacao.insert(
                                          index, new TextEditingController());
                                      index++;
                                    }
                                  });
                                },
                                labelText: 'Localização',
                                icon: Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.black,
                                ),
                                validator: AnnouncementsFormValidation
                                    .validateLocalization,
                                controller: _localizacao[index]),
                          );
                        }),
                  ),
                  SelectFormField(
                    labelText: 'Categoria',
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.black,
                    ),
                    validator: AnnouncementsFormValidation.validateCategory,
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
                      validator: AnnouncementsFormValidation.validatePrice,
                      controller: _preco),
                  CustomFormField(
                      suffixIcon: false,
                      labelText: 'Descrição',
                      icon: Icon(
                        Icons.insert_comment_outlined,
                        color: Colors.black,
                      ),
                      validator:
                          AnnouncementsFormValidation.validateDescription,
                      controller: _descricao),
                  Container(
                    margin: EdgeInsets.only(bottom: size.height * 0.05),
                    child: ConfirmButton(
                        labelButton: "CRIAR",
                        colorButton: Color(0xFFF49C00),
                        onClickAction: () {
                          if (_formKey.currentState.validate()) {
                            announcementsApi.registerAnnoun(
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
