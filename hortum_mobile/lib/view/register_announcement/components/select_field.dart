import 'package:flutter/material.dart';

class SelectFormField extends StatefulWidget {
  final String labelText;
  final Icon icon;
  const SelectFormField(
      {@required this.labelText, @required this.icon, Key key})
      : super(key: key);
  @override
  _SelectFormFieldState createState() => _SelectFormFieldState();
}

class _SelectFormFieldState extends State<SelectFormField> {
  String _currentSelectedValue = 'fvdvss';
  var _teste = ['fvdvss', 'vbvdb', 'fasfasf'];

  @override
  Widget build(BuildContext context) {
    return FormField(builder: (FormFieldState<String> state) {
      return InputDecorator(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5)),
          prefixIcon: widget.icon,
          labelText: widget.labelText,
        ),
        isEmpty: _currentSelectedValue == '',
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _currentSelectedValue,
            isDense: true,
            onChanged: (String newValue) {
              setState(() {
                _currentSelectedValue = newValue;
                print(_currentSelectedValue);
                state.didChange(newValue);
              });
            },
            items: _teste.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      );
    });
  }
}
