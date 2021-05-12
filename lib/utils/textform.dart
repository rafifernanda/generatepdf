import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextForm extends StatelessWidget {
  final String hint;
  TextEditingController formcontroller = new TextEditingController();

  TextForm(this.hint, this.formcontroller);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: formcontroller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: hint,
      ),
    );
  }
}

class NumForm extends StatelessWidget {
  final String hint;
  TextEditingController formcontroller = new TextEditingController();

  NumForm(this.hint, this.formcontroller);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: formcontroller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.]+')),],
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: hint,
      ),
    );
  }
}
