import 'package:flutter/material.dart';


//==================================================================
// TEXTFORM FIELD WIDGET
//================================================================== 
class TextFormFieldWidget extends StatelessWidget {
//==================================================================
// DECLARE VAIRABLE = PROPERTY OF CLASS
//==================================================================   
  final TextEditingController textController;
  final bool autovalidate;
  final TextInputType textInputType;
  final InputDecoration decoration;
  final String Function(String) validator;  // REF https://stackoverflow.com/questions/55548767/how-to-pass-a-validator-to-the-textformfield-in-flutter
  final bool obscureText;
//==================================================================
// CONSTRUCTURE
//==================================================================   
  const TextFormFieldWidget({
    Key key,
    @required this.textController,
    this.autovalidate,
    this.textInputType,
    this.decoration,
    this.validator,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: obscureText,
        autovalidate: autovalidate,
        controller: textController,
        keyboardType: textInputType,
        validator: validator,
        decoration: decoration,

      ),
    );
  }
}