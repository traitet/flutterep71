import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Ep391BPage extends StatefulWidget {
  @override
  _Ep391BPageState createState() => _Ep391BPageState();
}

class _Ep391BPageState extends State<Ep391BPage> {
//==========================================================
// DECLARE VARIABLE (TEXTEDIT CONTROLLER) / ADD EP391-B
//==========================================================     
  final TextEditingController emailController = TextEditingController()..text = 'traitet@gmail.com';
//==========================================================
// EP39-1B: DECLARE FIREBASE AUTHEN
//==========================================================
  FirebaseAuth firebaseAuthen = FirebaseAuth.instance;
//==========================================================
// EP39-1B: GLOBAL KEY FOR SNACK BAR
//==========================================================
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//==========================================================
// EP39-1B: GLOBAL KEY FOR SNACK BAR
//==========================================================      
      key: scaffoldKey,
      appBar: AppBar(title: Text('EP39-1B Forgot Password'),),
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
//==========================================================
// EP39-1B: IMPLEMENT FORGOT PASSWORD
//==========================================================
                  fnSendPasswordLinkViaEmail(email: emailController.text);
                }, child: Text('Send Password', style: TextStyle(color: Colors.white),)  ),
            ),
          )          
      ],),
      
    );
  }

//==========================================================
// EP39-1B: FUNCTION SEND PASSWORD LINK VIA EMAIL
//==========================================================
  fnSendPasswordLinkViaEmail({String email}) {
//==========================================================
// EP39-1B: IF SEND COMPLETE
//==========================================================    
    firebaseAuthen.sendPasswordResetEmail(email: email).then((value) {SnackBar(content: Text('Sent already to $email'),backgroundColor: Colors.green);}).
//==========================================================
// EP39-1B: IF SEND ERROR
//==========================================================
    catchError((error){
      scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Error to send link to $email'),backgroundColor: Colors.red));
    }).whenComplete(() {
      scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('When completed'),backgroundColor: Colors.red));
    });
  
  } // END FUNCTION
} // END CLASS