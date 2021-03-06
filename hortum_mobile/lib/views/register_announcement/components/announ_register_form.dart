import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/categories.dart';
import 'package:hortum_mobile/components/confirm_button.dart';
import 'package:hortum_mobile/components/custom_desc_field.dart';
import 'package:hortum_mobile/components/dialog_empty_localizations.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/components/form_validation.dart';
import 'package:hortum_mobile/data/announcements/announcements_backend.dart';
import 'package:hortum_mobile/components/localization_field.dart';
import 'package:hortum_mobile/views/register_announcement/components/select_field.dart';
import 'package:hortum_mobile/views/register_announcement/services/register_announcements_services.dart';

class AnnounRegisterForm extends StatefulWidget {
  final AnnouncementsApi announcementsApi;
  const AnnounRegisterForm({@required this.announcementsApi, Key key})
      : super(key: key);
  @override
  _AnnounRegisterFormState createState() => _AnnounRegisterFormState();
}

class _AnnounRegisterFormState extends State<AnnounRegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final formKeyLocalization = GlobalKey<FormState>();
  final TextEditingController _titulo = TextEditingController();
  final List<TextEditingController> _localizacao = [];
  final TextEditingController _categoria = TextEditingController();
  final TextEditingController _preco = TextEditingController();
  final TextEditingController _descricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double paddingSize = size.height * 0.014;
    TextEditingController newLocalization = new TextEditingController();
    return Padding(
      padding: EdgeInsets.fromLTRB(size.width * 0.09, 0, size.width * 0.09, 0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: paddingSize),
              child: CustomFormField(
                  suffixIcon: false,
                  labelText: 'Titulo',
                  icon: Icon(
                    Icons.title_outlined,
                    color: Colors.black,
                  ),
                  validator: FormValidation.validateTitle,
                  controller: _titulo),
            ),
            Form(
              key: formKeyLocalization,
              child: CustomFormField(
                  suffixIcon: true,
                  onPressed: () {
                    setState(() {
                      if (_localizacao.length <= 2 &&
                          formKeyLocalization.currentState.validate()) {
                        _localizacao.insert(
                          _localizacao.length,
                          new TextEditingController(text: newLocalization.text),
                        );
                      }
                    });
                  },
                  labelText: 'Localizacao',
                  icon: Icon(Icons.location_on_outlined, color: Colors.black),
                  validator: FormValidation.validateLocalization,
                  controller: newLocalization),
            ),
            LocalizationField(localizations: _localizacao),
            Padding(
              padding: EdgeInsets.only(top: paddingSize, bottom: paddingSize),
              child: SelectFormField(
                labelText: 'Categoria',
                icon: Icon(
                  Icons.filter_alt_outlined,
                  color: Colors.black,
                ),
                validator: FormValidation.validateCategory,
                listValues: announcementsCategories,
                controller: _categoria,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: paddingSize),
              child: CustomFormField(
                  suffixIcon: false,
                  labelText: 'Preço',
                  icon: Icon(
                    Icons.attach_money_outlined,
                    color: Colors.black,
                  ),
                  validator: FormValidation.validatePrice,
                  controller: _preco),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: paddingSize),
              child: Column(children: [
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
            ),
            Container(
              margin: EdgeInsets.only(bottom: size.height * 0.05),
              child: ConfirmButton(
                  labelButton: "SALVAR",
                  colorButton: Color(0xFFF49C00),
                  onClickAction: () {
                    _preco.text = _preco.text.replaceAll(',', '.');
                    if (_formKey.currentState.validate()) {
                      if (_localizacao.isEmpty) {
                        showDialog(
                            context: context,
                            builder: (context) => DialogEmptyLocalizations());
                      } else
                        registerAnnounServices(
                          _titulo.text,
                          _descricao.text,
                          _localizacao,
                          double.parse(_preco.text),
                          _categoria.text,
                          context,
                          widget.announcementsApi,
                        );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
