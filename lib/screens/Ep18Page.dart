import 'package:flutter/material.dart';
import '../widgets/TextFieldBorderLessWidget.dart';
import '../widgets/TextFieldBorderWidget.dart';

class Ep18Page extends StatefulWidget {
  @override
  _Ep18PageState createState() => _Ep18PageState();
}

class _Ep18PageState extends State<Ep18Page> {
//==============================================================
// DECLARE VAIRABLE - CONTROLLER
//==============================================================  
  final TextEditingController nameController = TextEditingController();  
  final TextEditingController surNameController = TextEditingController();  
  final TextEditingController emailController = TextEditingController();  
  final TextEditingController passwordController = TextEditingController();        
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP 18 - Text Field')),
      body: ListView(children: <Widget>[
//==============================================================
// TEXT
//==============================================================        
          Text('Name: ${nameController.text}  Surname: ${surNameController.text} E-mail: ${emailController.text}'),
//==============================================================
// CONTAINER
//==============================================================
        Container(
          alignment: Alignment.center,
          height: 40,color: Colors.black54,child: Text('Text Field - no Border',style: TextStyle(color: Colors.white)),),          
//==============================================================
// TEXTFIELD (BORDER LESS)
//==============================================================
        TextFieldBorderLessWidget(controller: nameController,labelText: 'Name',hintText: 'Enter name max 20 digites',icon: Icon(Icons.person),),
        TextFieldBorderLessWidget(controller: surNameController,labelText: 'Surname',hintText: 'Enter Surname max 20 digites',icon: Icon(Icons.people),),  
        TextFieldBorderLessWidget(controller: emailController,labelText: 'E-mail',hintText: 'Enter E-mail',icon: Icon(Icons.email),),
        TextFieldBorderLessWidget(controller: passwordController,labelText: 'Password',hintText: 'Enter Password',icon: Icon(Icons.verified_user),),    
//==============================================================
// BOTTON
//==============================================================
             RaisedButton(onPressed: () {
                setState(() {
                  // RELOAD UI
                });

             },child: Text('Submit', style: TextStyle(color: Colors.white )),color: Colors.blue,),                            
//==============================================================
// CONTAINER
//==============================================================
        Container(
          alignment: Alignment.center,
          height: 40,color: Colors.black54,child: Text('Text Field - WITH Border',style: TextStyle(color: Colors.white)),),
//==============================================================
// TEXTFIELD (WITH BORDER)
//==============================================================
        TextFieldBorderWidget(controller: nameController,labelText: 'Name',hintText: 'Enter name max 20 digites',icon: Icon(Icons.person),),
        TextFieldBorderWidget(controller: surNameController,labelText: 'Surname',hintText: 'Enter Surname max 20 digites',icon: Icon(Icons.people),),  
        TextFieldBorderWidget(controller: emailController,labelText: 'E-mail',hintText: 'Enter E-mail',icon: Icon(Icons.email),),
        TextFieldBorderWidget(controller: passwordController,labelText: 'Password',hintText: 'Enter Password',icon: Icon(Icons.verified_user),),                                  
      ],) ,
      
    );
  }
}


