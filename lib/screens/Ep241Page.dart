import 'package:flutter/material.dart';
import '../widgets/Ep241Widget.dart';

//==================================================================
// MAIN CLASS
//==================================================================   
class Ep241Page extends StatefulWidget {
  @override
  _Ep241PageState createState() => _Ep241PageState();
}

//==================================================================
// STATE CLASS
//==================================================================   
class _Ep241PageState extends State<Ep241Page> {
//==================================================================
// DECLARE VARIABLE
//==================================================================
//======================================================
// STEP#1: SNACKBAR
//======================================================  
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController nameController =  TextEditingController();   
  // final TextEditingController passwordController =  TextEditingController();  
  final TextEditingController mobileNoController =  TextEditingController();  
  final TextEditingController addressController =  TextEditingController();  
  final TextEditingController emailController =  TextEditingController();  
  final TextEditingController lineIdController =  TextEditingController(); 
  final RegExp emailRegExpression = RegExp('[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//======================================================
// STEP#2: SNACKBAR : DEFINE KEY
//======================================================  
      key: scaffoldKey,   
      appBar: AppBar(title: Text('Ep24-1: UI Edit User Profile'),),
      body: ListView(children: <Widget>[
//==================================================================
// TEXTFORM FIELD: E-MAIL 
//================================================================== 
      TextFormFieldWidget(  
        obscureText: false,     
        textController: emailController, autovalidate: true, textInputType: TextInputType.emailAddress,
        decoration: InputDecoration(labelText: 'E-mail',hintText: 'Enter E-mail',icon: Icon(Icons.email),),
        validator: (String value){
          if (value.isEmpty) {return 'Enter E-mail';}
          else if(!emailRegExpression.hasMatch(value)){return 'E-mail is incorrect';}        
        return null;
      },) ,   
//==================================================================
// TEXTFORM FIELD: NAME
//================================================================== 
      TextFormFieldWidget(  
        obscureText: false,     
        textController: nameController, autovalidate: true, textInputType: TextInputType.text,
        decoration: InputDecoration(labelText: 'Name',hintText: 'Enter Name',icon: Icon(Icons.person),),
        validator: (String value){
        // if (value.isEmpty) {return 'Enter Name';}
        return null;
      },) ,
//==================================================================
// TEXTFORM FIELD: ADDRESS 
//================================================================== 
      TextFormFieldWidget(  
        obscureText: false,     
        textController: addressController, autovalidate: true, textInputType: TextInputType.text,
        decoration: InputDecoration(labelText: 'Address',hintText: 'Enter Address',icon: Icon(Icons.home),),
        validator: (String value){
        // if (value.isEmpty) {return 'Enter Address';}
        return null;
      },) ,    
//==================================================================
// TEXTFORM FIELD: MOBILE 
//================================================================== 
      TextFormFieldWidget(  
        obscureText: false,     
        textController: mobileNoController, autovalidate: true, textInputType: TextInputType.phone,
        decoration: InputDecoration(labelText: 'Mobile No',hintText: 'Enter Mobile No',icon: Icon(Icons.phone),),
        validator: (String value){
        if (value.isEmpty) {return 'Enter Mobile No';}
        return null;
      },) ,   
//==================================================================
// TEXTFORM FIELD: LINE 
//================================================================== 
      TextFormFieldWidget(  
        obscureText: false,     
        textController: lineIdController, autovalidate: true, textInputType: TextInputType.emailAddress,
        decoration: InputDecoration(labelText: 'Line ID',hintText: 'Enter Line ID',icon: Icon(Icons.line_style),),
        validator: (String value){
        // if (value.isEmpty) {return 'Enter Line ID';}
        return null;
      },) ,    
//==================================================================
// SAVE BUTTON
//==================================================================
      SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
            color: Colors.blue,
            onPressed: (){ fnSaveProfile(email: emailController.text);},
            child: Text('Save',style: TextStyle(color: Colors.white)),

        ),
      ),       

  
//==================================================================
// END LISVIEW
//==================================================================          
      ],),
      
    );
  }

//======================================================
// SAVE PROFILE FUNCTION
//======================================================
fnSaveProfile({String email}) {
//======================================================
// SAVE TO DB "FIREBASE STORE"
//======================================================  
//
//======================================================
// STEP#4: SNACKBAR : SHOW SNACKBAR
//====================================================== 
    scaffoldKey.currentState.showSnackBar(SnackBar(backgroundColor: Colors.green,content: Text('Register $email profile completed. '))) ;  
}



}

