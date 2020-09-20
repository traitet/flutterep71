import 'package:flutter/material.dart';

class Ep222Page extends StatefulWidget {
  @override
  _Ep222PageState createState() => _Ep222PageState();
}

class _Ep222PageState extends State<Ep222Page> {
//==========================================================
// DECLARE VARIABLE (TEXTEDIT CONTROLLER)
//==========================================================     
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP22-2 Forgot Password'),),
      body: Column(
        
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
//==========================================================
// EMAIL
//==========================================================        
        Padding(
          padding: const EdgeInsets.only(top: 60,bottom: 16, left: 8,right: 8),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
            labelText: "E-mail",
            hintText: 'Fill e-mail registered before',
            icon: Icon(Icons.email)
          ),),
        ),
//==========================================================
// BUTTON
//==========================================================
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                color: Colors.blue,
                onPressed: (){
                    // IMPLEMENT

                }, child: Text('Send Password', style: TextStyle(color: Colors.white),)  ),
            ),
          )          
      ],),
      
    );
  }
}