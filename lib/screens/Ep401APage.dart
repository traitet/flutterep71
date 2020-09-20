import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/Ep401BPage.dart';


class Ep401APage extends StatefulWidget {
  @override
  _Ep401APageState createState() => _Ep401APageState();
}

class _Ep401APageState extends State<Ep401APage> {
//======================================================================
// STEP#1) DECLARE VARIABLE SCAFFOLD KEY
//======================================================================  
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
//==========================================================
// CONTROLLER
//==========================================================
    final TextEditingController usernameController =  TextEditingController()..text = 'traitet@gmail.com';    
    final TextEditingController passwordController =  TextEditingController()..text = 'flutterep31';        
    return MaterialApp(
      theme: ThemeData(primarySwatch: Theme.of(context).primaryColor),
      home: Scaffold(
//======================================================================
// STEP#2) SET PROPERTY KEY : SCAFFOLD KEY
//======================================================================                
        key: scaffoldKey,
        body:       
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: <Widget>[
//==========================================================
// LOGIN TEXT
//==========================================================    
              SizedBox(height: 100,),      
              Center(child: Image(
                width: 100,
                height: 100,
                image: AssetImage('assets/icon/icon.png'),)),              
              // Center(child: Text('Login', style: TextStyle(fontSize: 30, fontWeight:FontWeight.bold))),
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
//==========================================================
// CLICK BUTTON LOGIN
//==========================================================                    
                onPressed: (){
//==========================================================
// CALL LOGIN
//==========================================================                   
                  fnLoginByEmail(email:usernameController.text, password: passwordController.text);

                },child: Text('Login', style: TextStyle(color: Colors.white,fontSize: 16)),),   
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
  }//BUILD WIDGET

                 
//==========================================================
// FUNCTION LOGIN BY E-MAIL
//========================================================== 
 fnLoginByEmail({String email, String password} ){
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
//==========================================================
// AFTER CALL LOGIN
//==========================================================     
    .then((value) {
      print('Login OK ALREADY ${value.user.email}');
      //fnSnackBar(message: 'Login ALREADY AND WILL REDIRECT TO HOME PAGE for $email');
//==========================================================
// EP:401: PASS PARAMTER (USER)
//==========================================================        
      //Navigator.push(context,MaterialPageRoute(builder: (context) => Ep401BPage()),);      
//==========================================================
// EP:401: PASS PARAMTER (USER)
//==========================================================        
      Navigator.push(context,MaterialPageRoute(builder: (context) => Ep401BPage(email: value.user.email,)),);
//==========================================================
// IF FOUND ERROR
//==========================================================         
    }).catchError((error){
      print('Login ERROR $error');
      fnSnackBar(message: 'Login Error for $email');
//==========================================================
// WHEN COMPLETE
//==========================================================         
    }).whenComplete ((){
      print('Login COMPLETED');     
      // fnSnackBar(message: 'Login COMPLETED for $email');             
    });

 }
//                   


//==========================================================
// FUNCTION fnSnackbar
//========================================================== 
  fnSnackBar({String message}) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(message)),
    );
  }

}//CLASS