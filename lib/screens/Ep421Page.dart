import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Ep421Page extends StatefulWidget {
  @override
  _Ep421PageState createState() => _Ep421PageState();
}

//======================================================
// STATE CLASS
//======================================================
class _Ep421PageState extends State<Ep421Page> {
//======================================================
// DECLARE VARIABLE
// REF WEB: E-MAIL EXPRESSION: https://medium.com/@prafullkumar77/some-useful-regex-regular-expression-utilities-35b7cf68d5c1
//======================================================
  final TextEditingController emailController = TextEditingController()..text = 'traitet@yahoo.com';
  final TextEditingController passwordController = TextEditingController()..text = 'flutterep421';
  final TextEditingController mobileNoController = TextEditingController();
  final RegExp emailRegExpression = RegExp('[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}');
  int _tabIndex =0;
//======================================================
// STEP#1: SNACKBAR
//======================================================  
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
        return Scaffold(
//======================================================
// STEP#2: SNACKBAR : DEFINE KEY
//======================================================  
          key: scaffoldKey,          
//======================================================
// APP BAR
//======================================================           
          appBar: AppBar(title: Text('EP42-1 Logic: Register Account'),
            
          ),
//======================================================
// BOTTOM NAVIGATIONBAR
//======================================================            
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _tabIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (int index){setState(() {_tabIndex = index;});},
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.email),title: Text('E-mail'), ),
              BottomNavigationBarItem(icon: Icon(Icons.phone),title: Text('Mobile')),            
            ]),  
          body: 
 //======================================================
// BOTTOM NAVIGATIONBAR
//======================================================           
          ListView(children: <Widget>[
            SizedBox(height: 20,),
            _tabIndex == 0 ?   
            EmailWidget(emailController: emailController, emailRegExpression: emailRegExpression, passwordController: passwordController,
            scaffoldKey: scaffoldKey,):
            MobileWidget(mobileNoController: mobileNoController,scaffoldKey: scaffoldKey),                 
      ],),
      
    );
  }
}

//======================================================
// E-MAIL WIDGET
//====================================================== 
class EmailWidget extends StatelessWidget {
//======================================================
// DECLARE VARIABLE
//======================================================  
  final TextEditingController emailController;
  final RegExp emailRegExpression;
  final TextEditingController passwordController;
  final GlobalKey<ScaffoldState> scaffoldKey; // FOR SNACKBAR (STEP#3.1)
  const EmailWidget({
//======================================================
// CONSTRUCTURE
//======================================================     
    Key key,
    @required this.emailController,
    @required this.emailRegExpression,
    @required this.passwordController,
    @required this.scaffoldKey,   // FOR SNACKBAR (STEP#3.2)
  }) : super(key: key);
//======================================================
// BUILD WIDGET
//======================================================    
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: <Widget>[
//======================================================
// TEXT FORM FIELD: E-MAIL
//======================================================            
      TextFormField(
        autovalidate: true,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (String value) {
          if (value.isEmpty) { return 'Enter E-mail';}
          else if(!emailRegExpression.hasMatch(value)){return 'E-mail is incorrect';}
          return null;
        },
        decoration: InputDecoration(
          labelText: 'E-mail',
          hintText: 'Enter E-mail. System will send mail to confirm',
          icon: Icon(Icons.email),
        ),
          ),
//======================================================
// TEXT FORM FIELD: PASSWORD
//======================================================            
      TextFormField(
        obscureText: true,
        autovalidate: true,
        controller: passwordController,
        keyboardType: TextInputType.emailAddress,
        validator: (String value) {
          if (value.isEmpty) { return 'Enter Password';}
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter Password',
          icon: Icon(Icons.verified_user),
        ),
          ),      
//======================================================
// RAISED BUTTON
//======================================================
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),            
              child: RaisedButton(color: Colors.blue,onPressed: (){
                fnRegisterFirebaseEmailAccount();
              }, 
//======================================================
// BUTTON CHILD (FOR TEXT IN BUTTON)
//======================================================               
              child: Text('Register',style: TextStyle(color: Colors.white)),))   
      ],),
    );
  }
//======================================================
// REGISTER FIREBASE EMAIL ACCOUNT
//======================================================   
    fnRegisterFirebaseEmailAccount() {
    //======================================================
    // EP42-1: REGISTER FIREBSE ACCOUNT (E-MAIL)
    //======================================================
                      FirebaseAuth _auth = FirebaseAuth.instance;
                      _auth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text)
                      .then((value) {
    //======================================================
    // EP42-1: SNACKBAR : SHOW SNACKBAR (REIGSTER OK)
    //====================================================== 
                    scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Register completed. Please open link at your e-mail to verify new account '))) ;      
                      })
    //======================================================
    // EP42-1: SNACKBAR : SHOW SNACKBAR (REIGSTER ERROR)
    //======================================================                   
                      .catchError((error){
                    scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Register Error because $error'))) ;                     
                      }) ;  
    }// END FOUNCTION
}// END CLASS




//======================================================
// MOBILE WIDGET
//====================================================== 
class MobileWidget extends StatelessWidget {
//======================================================
// DECLARE VARIABLE = PROPERTY
//======================================================   
  final TextEditingController mobileNoController;  
  final GlobalKey<ScaffoldState> scaffoldKey; // FOR SNACKBAR (STEP#3.1)
//======================================================
// CONSTRUCTURE
//======================================================     
  const MobileWidget({
    Key key,
    @required this.mobileNoController,
    @required this.scaffoldKey,    
  }) : super(key: key);
//======================================================
// BUILD WIDGET
//======================================================   
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: <Widget>[
//======================================================
// TEXT FORM FIELD: E-MAIL
//======================================================            
      TextFormField(
        autovalidate: true,
        controller: mobileNoController,
        keyboardType: TextInputType.phone,
        validator: (String value) {
          if (value.isEmpty) { return 'Enter Mobile Phone';}
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Mobile Phone No',
          hintText: 'Enter Mobile Phone No. System will send SMS to confirm',
          icon: Icon(Icons.phone),
        ),
          ),    
//======================================================
// RAISED BUTTON
//======================================================
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              child: RaisedButton(color: Colors.blue,onPressed: (){
//======================================================
// STEP#4: SNACKBAR : SHOW SNACKBAR
//====================================================== 
                scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Register completed. Please get password from your SMS'))) ;               
//======================================================
// BUTTON CHILD (FOR TEXT IN BUTTON)
//====================================================== 
              }, child: Text('Register',style: TextStyle(color: Colors.white)),))   
      ],),
    );
  }
}


