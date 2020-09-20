
import 'package:flutter/material.dart';

//==============================================================
// WIDGET CLASS: TEXTFIELD BORDERLESS WIDGET (NO BORDER)
//==============================================================
class TextFieldBorderLessWidget extends StatelessWidget {
//==============================================================
// DECLARE VARIABLE
//==============================================================  
  final String labelText;
  final String hintText;
  final Icon icon; 
  final TextEditingController controller;
//==============================================================
// CONSTUCTURE
//==============================================================
  const TextFieldBorderLessWidget({
    this.labelText,this.hintText,this.icon,
    Key key,
    @required this.controller,
  }) : super(key: key);
//==============================================================
// BUILD WIDGET
//==============================================================
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        //border: OutlineInputBorder(),
        labelText: labelText,
        hintText: hintText,
        icon: icon,
      ),);
  }
}