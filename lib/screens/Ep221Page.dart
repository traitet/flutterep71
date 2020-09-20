import 'package:flutter/material.dart';

class Ep221Page extends StatefulWidget {
  @override
  _Ep221PageState createState() => _Ep221PageState();
}

class _Ep221PageState extends State<Ep221Page> {
  @override
  Widget build(BuildContext context) {
//==========================================================
// CONTROLLER
//==========================================================
    final TextEditingController usernameController =  TextEditingController();    
    final TextEditingController passwordController =  TextEditingController();        
    return MaterialApp(
      theme: ThemeData(primarySwatch: Theme.of(context).primaryColor),
      home: Scaffold(
        body:       
        Container(
          color: Colors.orange[200],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: <Widget>[
//==========================================================
// LOGIN TEXT
//==========================================================    
              SizedBox(height: 100,),      
              Center(child: Text('Login', style: TextStyle(fontSize: 30, fontWeight:FontWeight.bold))),
//==========================================================
// TEXT FIELD: USER
//==========================================================            
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'User',hintText: 'Enter User',
              icon: Icon(Icons.person),),),
//==========================================================
// TEXT FIELD: PASSWORD
//==========================================================            
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password',hintText: 'Enter Password',
              icon: Icon(Icons.verified_user),),),  
              SizedBox(height: 20,),  
//==========================================================
// RAISED BUTTON
//========================================================== 
              RaisedButton
              (
                color: Colors.blue,
                onPressed: (){},child: Text('Login', style: TextStyle(color: Colors.white,fontSize: 16)),),   
//==========================================================
// ROW
//==========================================================          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
//==========================================================
// TEXT: FORGOT
//==========================================================               
                Text('Forgot password click'),
//==========================================================
// FLAT BUTTON
//========================================================== 
                FlatButton(onPressed: (){},child: Text('HERE', style: TextStyle(color: Colors.red,fontSize: 16),),),                 
                ],
              ),  
//==========================================================
// ROW
//==========================================================          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
//==========================================================
// TEXT: FORGOT
//==========================================================               
                Text('If no account, '),
//==========================================================
// FLAT BUTTON
//========================================================== 
                FlatButton(materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,onPressed: (){},child: Text('REGISTER HERE', style: TextStyle(color: Colors.red,fontSize: 16),),),                 
                ],
              ),   
//==========================================================
// RAISED BUTTON
//========================================================== 
              RaisedButton(
                color: Colors.pink,
                onPressed: (){},child: Text('Login by Google', style: TextStyle(color: Colors.white,fontSize: 16)),),      
//==========================================================
// RAISED BUTTON
//========================================================== 
              RaisedButton(color: Colors.pink,onPressed: (){},child: Text('Login by Mobile (SMS)', style: TextStyle(color: Colors.white,fontSize: 16)),),                            
                                
      ],),
          ),
        )
      )
      
      

      
    );
  }
}