import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/categories.dart';
import 'package:hortum_mobile/components/custom_desc_field.dart';
import 'package:hortum_mobile/components/dialog_empty_localizations.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/components/form_validation.dart';
import 'package:hortum_mobile/components/localization_field.dart';
import 'package:hortum_mobile/views/edit_announ/services/edit_announ_services.dart';
import 'package:hortum_mobile/views/profile/components/add_picture.dart';
import 'package:hortum_mobile/views/register_announcement/components/select_field.dart';
import 'components/edit_picture.dart';

class EditPage extends StatefulWidget {
  final Dio dio;
  final TextEditingController title;
  final TextEditingController description;
  final List<TextEditingController> localization;
  final TextEditingController price;
  final TextEditingController category;
  final String originaltitle;
  final String image;

  const EditPage(
      {@required this.title,
      @required this.description,
      @required this.price,
      @required this.localization,
      @required this.category,
      @required this.originaltitle,
      @required this.image,
      this.dio,
      Key key})
      : super(key: key);

  @override
  _EditPageState createState() => _EditPageState(
      title: title,
      description: description,
      price: price,
      localization: localization,
      category: category,
      originaltitle: originaltitle);
}

class _EditPageState extends State<EditPage> {
  final formKey = GlobalKey<FormState>();
  final formKeyLocalization = GlobalKey<FormState>();
  final TextEditingController title;
  final TextEditingController description;
  final List<TextEditingController> localization;
  final TextEditingController price;
  final TextEditingController category;
  String originaltitle;

  _EditPageState(
      {this.title,
      this.description,
      this.price,
      this.localization,
      this.category,
      this.originaltitle});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController newLocalization = new TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                  right: size.width * 0.1, left: size.width * 0.1),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EditPicture(image: widget.image),
                    CustomFormField(
                        suffixIcon: false,
                        labelText: 'Titulo',
                        icon: Icon(
                          Icons.title_outlined,
                          color: Colors.black,
                        ),
                        validator: FormValidation.validateTitle,
                        controller: title),
                    Form(
                      key: formKeyLocalization,
                      child: CustomFormField(
                          suffixIcon: true,
                          onPressed: () {
                            setState(() {
                              if (localization.length <= 2 &&
                                  formKeyLocalization.currentState.validate()) {
                                localization.insert(
                                  localization.length,
                                  new TextEditingController(
                                      text: newLocalization.text),
                                );
                              }
                            });
                          },
                          labelText: 'Localizacao',
                          icon: Icon(Icons.location_on_outlined,
                              color: Colors.black),
                          validator: FormValidation.validateLocalization,
                          controller: newLocalization),
                    ),
                    LocalizationField(localizations: localization),
                    Row(children: [
                      Container(
                        padding: EdgeInsets.only(right: 15, top: 15),
                        width: size.width * 0.4,
                        child: SelectFormField(
                            initialValue: widget.category.text,
                            labelText: 'Categoria',
                            icon: Icon(
                              Icons.filter_alt_outlined,
                              color: Colors.black,
                            ),
                            validator: FormValidation.validateCategory,
                            listValues: announcementsCategories,
                            controller: category),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, top: 15),
                        width: size.width * 0.4,
                        child: CustomFormField(
                            suffixIcon: false,
                            labelText: 'Preço',
                            icon: Icon(
                              Icons.attach_money_outlined,
                              color: Colors.black,
                            ),
                            validator: FormValidation.validatePrice,
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
                            validator: FormValidation.validateDescription,
                            controller: description),
                      ],
                    ),
                    MaterialButton(
                      key: Key('salvarAnnoun'),
                      onPressed: () {
                        price.text = price.text.replaceAll('R\$ ', '');
                        price.text = price.text.replaceAll(',', '.');
                        if (localization.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (context) => DialogEmptyLocalizations());
                        } else if (formKey.currentState.validate()) {
                          double precoDouble = double.parse(price.text);
                          ChangeServices.editAnnoun(
                              widget.dio,
                              originaltitle,
                              widget.title.text,
                              precoDouble,
                              widget.category.text,
                              widget.description.text,
                              widget.localization,
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AddPictureButton(isProfilePicture: false),
          ],
        ),
      ),
    );
  }
}
