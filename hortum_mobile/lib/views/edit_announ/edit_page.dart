import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/categories.dart';
import 'package:hortum_mobile/components/custom_desc_field.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/views/edit_announ/services/edit_announ_services.dart';
import 'package:hortum_mobile/views/profile/components/add_picture.dart';
import 'package:hortum_mobile/views/register_announcement/components/select_field.dart';
import 'package:hortum_mobile/views/register_announcement/services/register_announcements_services.dart';

import 'components/edit_picture.dart';

class EditPage extends StatefulWidget {
  final Dio dio;
  final TextEditingController name;
  final TextEditingController description;
  final TextEditingController localization;
  final TextEditingController price;
  final TextEditingController category;
  final String originalname;

  const EditPage(
      {@required this.name,
      @required this.description,
      @required this.price,
      @required this.localization,
      @required this.category,
      @required this.originalname,
      this.dio,
      Key key})
      : super(key: key);

  @override
  _EditPageState createState() => _EditPageState(
      name: name,
      description: description,
      price: price,
      localization: localization,
      category: category,
      originalname: originalname);
}

class _EditPageState extends State<EditPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController name;
  final TextEditingController description;
  final TextEditingController localization;
  final TextEditingController price;
  final TextEditingController category;
  String originalname;

  _EditPageState(
      {this.name,
      this.description,
      this.price,
      this.localization,
      this.category,
      this.originalname});

  @override
  Widget build(BuildContext context) {
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
                        validator: AnnouncementsFormValidation.validatename,
                        controller: name),
                    Column(
                      children: [
                        CustomFormField(
                            suffixIcon: true,
                            onPressed: () {},
                            labelText: 'Localizacao',
                            icon: Icon(Icons.location_on_outlined,
                                color: Colors.black),
                            validator: AnnouncementsFormValidation
                                .validateLocalization,
                            controller: localization),
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
                            initialValue: widget.category.text,
                            labelText: 'Categoria',
                            icon: Icon(
                              Icons.filter_alt_outlined,
                              color: Colors.black,
                            ),
                            validator:
                                AnnouncementsFormValidation.validateCategory,
                            listValues: announcementsCategories,
                            controller: category),
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
                            validator:
                                AnnouncementsFormValidation.validatePrice,
                            controller: price),
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
                            validator:
                                AnnouncementsFormValidation.validateDescription,
                            controller: description),
                      ],
                    ),
                    MaterialButton(
                        key: Key('salvarAnnoun'),
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            double precoDouble = double.parse(price.text);
                            ChangeServices.editAnnoun(
                                widget.dio,
                                originalname,
                                widget.name.text,
                                precoDouble,
                                widget.category.text,
                                widget.description.text,
                                context);
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
