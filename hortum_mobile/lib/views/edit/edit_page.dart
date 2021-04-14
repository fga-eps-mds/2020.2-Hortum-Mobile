import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/categories.dart';
import 'package:hortum_mobile/components/custom_desc_field.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/data/announ_edit_backend.dart';
import 'package:hortum_mobile/views/profile/components/add_picture.dart';
import 'package:hortum_mobile/views/register_announcement/components/select_field.dart';
import 'package:hortum_mobile/views/register_announcement/services/register_announcements_services.dart';

import 'components/edit_picture.dart';

class EditPage extends StatefulWidget {
  final String title;
  final String description;
  final String localization;
  final String price;
  final String category;

  const EditPage(
      {@required this.title,
      @required this.description,
      @required this.price,
      @required this.localization,
      @required this.category,
      Key key})
      : super(key: key);
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController titulo;
  TextEditingController localizacao;
  TextEditingController categoria;
  TextEditingController preco;
  TextEditingController descricao;
  @override
  Widget build(BuildContext context) {
    String tituloAntigo = widget.title;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                  right: size.width * 0.1, left: size.width * 0.1),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    EditPicture(),
                    CustomFormField(
                        suffixIcon: false,
                        labelText: 'Titulo',
                        icon: Icon(
                          Icons.title_outlined,
                          color: Colors.black,
                        ),
                        validator: validateTitle,
                        controller: titulo =
                            TextEditingController(text: widget.title)),
                    Column(
                      children: [
                        CustomFormField(
                            suffixIcon: true,
                            onPressed: () {},
                            labelText: 'Localizacao',
                            icon: Icon(Icons.location_on_outlined,
                                color: Colors.black),
                            validator: validateLocalization,
                            controller: localizacao = TextEditingController(
                                text: widget.localization)),
                        Container(
                          decoration: new BoxDecoration(
                            color: Color(0XFFC4C4C4),
                            borderRadius: BorderRadius.only(
                              bottomLeft: const Radius.circular(15.0),
                              bottomRight: const Radius.circular(15.0),
                            ),
                          ),
                          height: size.height * 0.15,
                          width: size.width * 0.7,
                        )
                      ],
                    ),
                    Row(children: [
                      Container(
                        padding: EdgeInsets.only(right: 15),
                        width: size.width * 0.4,
                        child: SelectFormField(
                          labelText: 'Categoria',
                          icon: Icon(
                            Icons.filter_alt_outlined,
                            color: Colors.black,
                          ),
                          validator: validateCategory,
                          listValues: announcementsCategories,
                          controller: categoria =
                              TextEditingController(text: widget.category),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        width: size.width * 0.4,
                        child: CustomFormField(
                            suffixIcon: false,
                            labelText: 'Preço',
                            icon: Icon(
                              Icons.attach_money_outlined,
                              color: Colors.black,
                            ),
                            validator: validatePrice,
                            controller: preco =
                                TextEditingController(text: widget.price)),
                      )
                    ]),
                    Column(
                      children: [
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
                            validator: validateDescription,
                            controller: descricao = TextEditingController(
                                text: widget.description)),
                      ],
                    ),
                    MaterialButton(
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            double precoDouble = double.parse(preco.text);
                            print(tituloAntigo);
                            print(titulo.text);
                            EditAnnounApi.editAnnoun(tituloAntigo,
                                name: titulo.text,
                                price: precoDouble,
                                category: categoria.text,
                                description: descricao.text);
                          }
                        },
                        child: Container(
                          width: size.width * 0.5,
                          height: size.height * 0.04,
                          margin: EdgeInsets.only(top: size.height * 0.03),
                          decoration: BoxDecoration(
                            color: Color(0xff75CE90),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("SALVAR",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto-Bold')),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            AddPictureButton(),
          ],
        ),
      ),
    );
  }
}
