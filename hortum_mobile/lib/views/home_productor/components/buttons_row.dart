import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/categories.dart';
import 'package:hortum_mobile/components/form_field.dart';
import 'package:hortum_mobile/views/home_productor/components/add_picture.dart';
import 'package:hortum_mobile/views/register_announcement/components/select_field.dart';
import 'package:hortum_mobile/views/register_announcement/services/register_announcements_services.dart';

class ButtonsRow extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titulo = TextEditingController();
  final TextEditingController _localizacao = TextEditingController();
  final TextEditingController _categoria = TextEditingController();
  final TextEditingController _preco = TextEditingController();
  final TextEditingController _descricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: size.height * 0.03,
          width: size.width * 0.06,
          child: MaterialButton(
            padding: EdgeInsets.all(0),
            child: Icon(
              Icons.edit,
              size: 25,
              color: Color(0xFF478C5C),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Stack(
                        children: <Widget>[
                          Positioned(
                            right: -40.0,
                            top: -40.0,
                            child: InkResponse(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: CircleAvatar(
                                child: Icon(Icons.close),
                                backgroundColor: Colors.red,
                              ),
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  width: size.width * 0.35,
                                  height: size.width * 0.3,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    child: Material(
                                      child: InkWell(
                                          child: Image.asset(
                                        'assets/images/banana.jpg',
                                        fit: BoxFit.fill,
                                      )),
                                    ),
                                  ),
                                ),
                                AddPictureButton(),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CustomFormField(
                                      labelText: 'Titulo',
                                      icon: Icon(
                                        Icons.title_outlined,
                                        color: Colors.black,
                                      ),
                                      validator: validateTitle,
                                      controller: _titulo),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CustomFormField(
                                      labelText: 'Localização',
                                      icon: Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.black,
                                      ),
                                      validator: validateLocalization,
                                      controller: _localizacao),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SelectFormField(
                                    labelText: 'Categoria',
                                    icon: Icon(
                                      Icons.filter_alt_outlined,
                                      color: Colors.black,
                                    ),
                                    validator: validateCategory,
                                    listValues: announcementsCategories,
                                    controller: _categoria,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CustomFormField(
                                      labelText: 'Preço',
                                      icon: Icon(
                                        Icons.attach_money_outlined,
                                        color: Colors.black,
                                      ),
                                      validator: validatePrice,
                                      controller: _preco),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CustomFormField(
                                      labelText: 'Descrição',
                                      icon: Icon(
                                        Icons.insert_comment_outlined,
                                        color: Colors.black,
                                      ),
                                      validator: validateDescription,
                                      controller: _descricao),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF81B622),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                    ),
                                    child: Text("SALVAR"),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();
                                      }
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
        ),
        Container(
          height: size.height * 0.03,
          width: size.width * 0.06,
          child: MaterialButton(
            padding: EdgeInsets.all(0),
            child: Icon(
              Icons.visibility_off,
              size: 25,
              color: Color(0xFF478C5C),
            ),
            onPressed: () {},
          ),
        ),
        Container(
          height: size.height * 0.03,
          width: size.width * 0.06,
          child: MaterialButton(
            padding: EdgeInsets.all(0),
            child: Icon(
              Icons.delete,
              size: 25,
              color: Color(0xFF478C5C),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
