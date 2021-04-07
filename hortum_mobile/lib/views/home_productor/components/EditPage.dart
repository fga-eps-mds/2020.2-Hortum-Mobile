import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/categories.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/views/profile/components/add_picture.dart';
import 'package:hortum_mobile/views/profile/components/profile_picture.dart';
import 'package:hortum_mobile/views/register_announcement/components/select_field.dart';
import 'package:hortum_mobile/views/register_announcement/services/register_announcements_services.dart';

import 'edit_picture.dart';

class EditPage extends StatefulWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController titulo = TextEditingController();
  final TextEditingController localizacao = TextEditingController();
  final TextEditingController categoria = TextEditingController();
  final TextEditingController preco = TextEditingController();
  final TextEditingController descricao = TextEditingController();
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                    right: size.width * 0.1, left: size.width * 0.1),
                child: Form(
                  key: widget.formKey,
                  child: Column(
                    children: [
                      EditPicture(),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CustomFormField(
                            labelText: 'Titulo',
                            icon: Icon(
                              Icons.title_outlined,
                              color: Colors.black,
                            ),
                            validator: validateTitle,
                            controller: widget.titulo),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomFormField(
                                labelText: 'Localização',
                                icon: Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.black,
                                ),
                                validator: validateLocalization,
                                controller: widget.localizacao),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 0),
                            height: size.height * 0.15,
                            color: Colors.red,
                          )
                        ],
                      ),
                      Row(children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            width: size.width * 0.355,
                            child: SelectFormField(
                              labelText: 'Categoria',
                              icon: Icon(
                                Icons.filter_alt_outlined,
                                color: Colors.black,
                              ),
                              validator: validateCategory,
                              listValues: announcementsCategories,
                              controller: widget.categoria,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            width: size.width * 0.355,
                            child: CustomFormField(
                                labelText: 'Preço',
                                icon: Icon(
                                  Icons.attach_money_outlined,
                                  color: Colors.black,
                                ),
                                validator: validatePrice,
                                controller: widget.preco),
                          ),
                        ),
                      ]),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CustomFormField(
                            labelText: 'Descrição',
                            icon: Icon(
                              Icons.insert_comment_outlined,
                              color: Colors.black,
                            ),
                            validator: validateDescription,
                            controller: widget.descricao),
                      ),
                      MaterialButton(
                          onPressed: () {
                            if (widget.formKey.currentState.validate()) {
                              print('oi');
                            }
                          },
                          child: Container(
                            width: size.width * 0.5,
                            height: size.height * 0.04,
                            margin: EdgeInsets.only(top: size.height * 0.03),
                            decoration: BoxDecoration(
                              color: Color(0xff75CE90),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
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
      ),
    );
  }
}
