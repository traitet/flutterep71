import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/Ep241Widget.dart';

//==================================================================
// MAIN CLASS
//==================================================================   
class Ep461Page extends StatefulWidget {
  @override
  _Ep461PageState createState() => _Ep461PageState();
}

//==================================================================
// STATE CLASS
//==================================================================   
class _Ep461PageState extends State<Ep461Page> {
//==================================================================
// DECLARE VARIABLE
//==================================================================
//======================================================
// STEP#1: SNACKBAR
//======================================================  
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController nameController =  TextEditingController()..text = 'Tratet';   
  // final TextEditingController passwordController =  TextEditingController();  
  final TextEditingController mobileNoController =  TextEditingController()..text = '0856000606';  
  final TextEditingController addressController =  TextEditingController()..text = 'Bangna, Bangkok, 25140';  
  final TextEditingController emailController =  TextEditingController()..text = 'traitet@yahoo.com';  
  final TextEditingController lineIdController =  TextEditingController()..text = 'nuengtraitet'; 
  final RegExp emailRegExpression = RegExp('[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//======================================================
// STEP#2: SNACKBAR : DEFINE KEY
//======================================================  
      key: scaffoldKey,   
      appBar: AppBar(title: Text('Ep46-1: Logic: UI Edit User Profile'),),
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
            onPressed: (){ fnSaveProfile(email: emailController.text, name: nameController.text, address: addressController.text, mobileNo: mobileNoController.text,lineId: lineIdController.text);},
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
fnSaveProfile({String email, String name, String address, String mobileNo, String lineId}) {
    //======================================================
    // SAVE TO DB "FIREBASE STORE"
    //======================================================  
      Firestore.instance.collection('TM_USERS').document(email).setData({'email': email, 'name':name,'address':address,'mobileNo': mobileNo, 'lineId': lineId})
      .then((value) {
    //======================================================
    // OK: SHOW SNACKBAR
    //====================================================== 
        scaffoldKey.currentState.showSnackBar(SnackBar(backgroundColor: Colors.green,content: Text('Register $email profile completed. '))) ;  
      })
      .catchError((error){
    //======================================================
    // ERROR: SNACKBAR : SHOW SNACKBAR
    //====================================================== 
        scaffoldKey.currentState.showSnackBar(SnackBar(backgroundColor: Colors.red,content: Text('Register $email profile error due to $error' ))) ;  

      });



}



}

