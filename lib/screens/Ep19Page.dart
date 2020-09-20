//==============================================================
// IPORT
//==============================================================
import 'package:flutter/material.dart';

//==============================================================
// MAIN CLASS
//==============================================================
class Ep19Page extends StatefulWidget {
  @override
  _Ep19PageState createState() => _Ep19PageState();
}

//==============================================================
// STATE CLASS
//==============================================================
class _Ep19PageState extends State<Ep19Page> {
//==============================================================
// DECLARE VAIRABLE
//==============================================================
final TextEditingController nameController =   TextEditingController();
final TextEditingController emailController =   TextEditingController();
final TextEditingController phoneController =   TextEditingController();
final TextEditingController passwordController =   TextEditingController();
final RegExp emailRegExpression = new RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
final _formKey = GlobalKey<FormState>();
//==============================================================
// TO GET FORM DATA ( NOT FINAL BECAUSE IT CAN CHANGE VALUE AND WILL HOW ON TEXT)
//==============================================================
String _output = '';
//==============================================================
// BUILD WIDGET
//==============================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP19 - Text Form Field'),),
      body: Form(
//==============================================================
// _FORMKEY --> TO REFERENCE THIS UI/PAGE/FILE
//==============================================================        
        key: _formKey,
        child: ListView(children: <Widget>[
//==============================================================
// TEST
//==============================================================
          Text('Output: $_output'),
//==============================================================
// TEXT FORM FIELD "NAME"
//============================================================== 
          TextFormField(
            autovalidate: false,
            controller: nameController,
            keyboardType: TextInputType.text,
            validator: (String value) {
              if (value.isEmpty) {return 'Enter name';} 
//==============================================================
// VALIDATE: NUMBER OF DIGITES (MUST <= 8)
//==============================================================             
              else if (value.length > 8) {return 'Must less than 8 digits';}
              return null;
              },
            decoration: InputDecoration(
              labelText: 'Name',
              hintText: 'Enter Name',
              icon: Icon(Icons.person),
            ),
          ),
//==============================================================
// TEXT FORM FIELD "EMAIL"
//============================================================== 
          TextFormField(
            autovalidate: false,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (String value) {
//==============================================================
// VALIDATE : NOT FILL
//==============================================================             
              if (value.isEmpty) {return 'Enter E-mail';} 
//==============================================================
// VALIDATE : CHECK EMAIL EXPRESSION (FORMAT E.G. trai@gmail.com)
//==============================================================               
              else if (!emailRegExpression.hasMatch(value)){return 'E-mail is incorrect';} 
              return null;
              },
            decoration: InputDecoration(
              labelText: 'E-mail',
              hintText: 'Enter E-mail',
              icon: Icon(Icons.email),
            ),
          ),
//==============================================================
// TEXT FORM FIELD "PASSWORD"
//============================================================== 
          TextFormField(
            obscureText: true,
            autovalidate: false,
            controller: passwordController,
            keyboardType: TextInputType.text,
            validator: (String value) {
              if (value.isEmpty) {return 'Enter Password';} return null;
              },
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter Name',
              icon: Icon(Icons.person),
            ),
          ),
//==============================================================
// TEXT FORM FIELD "PHONE"
//============================================================== 
          TextFormField(
            autovalidate: true,
            controller: phoneController,
            keyboardType: TextInputType.phone,
            validator: (String value) {
              if (value.isEmpty) {return 'Enter Phone';} return null;
              },
            decoration: InputDecoration(
              labelText: 'Phone',
              hintText: 'Enter Phone',
              icon: Icon(Icons.person),
            ),
          ),                        
//==============================================================
// BUTTON SUBMIT
//============================================================== 
RaisedButton(onPressed: () {
  if (_formKey.currentState.validate()) {
      print('SUCESS SUCESS SUCESS SUCESS !!!');
//==============================================================
// SET VALUE -> RELOAD UI
//==============================================================       
      setState(() {
        _output = nameController.text + emailController.text + phoneController.text + passwordController.text;
      });


  }

},child: Text('Submit'),),

//==============================================================
// CLEAR VALUE IN TEXTFORM FIELDS (ALL)
//============================================================== 
RaisedButton(onPressed: () {
  _formKey.currentState.reset();

},child: Text('Clear'),),
//==============================================================
// END LIST VIEW WIDGET
//==============================================================
        ],),
      ),
      
    );
  }
}