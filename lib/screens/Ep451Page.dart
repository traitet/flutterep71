import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Ep451Page extends StatefulWidget {
  @override
  _Ep451PageState createState() => _Ep451PageState();
}

class _Ep451PageState extends State<Ep451Page> {
//========================================
// DECLARE VARIABLE
//========================================
String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP45-1: Read and write Firebase Database'),),
      body: ListView(children: <Widget>[
//========================================
// TEXT
//========================================        
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text( _message,style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold))),
        ),
//========================================
// READ DATA BUTTON
//========================================          
        RaisedButton(onPressed: (){
           fnWriteDataToFirebaseDb();
        },child: Text('Write Data to Firebase DB (Cloud Storage)'),),
//========================================
// WRITE DATA BUTTON
//========================================          
        RaisedButton(onPressed: (){
          fnReadDataToFirebaseDb();
        },child: Text('Read Data from Firebase DB (Cloud Storage)'),),        
      ],),
      
    );
  }
//========================================
// FUNCTION WRITE DATA FROM FIREBASE DB
//========================================  
    fnWriteDataToFirebaseDb() {
        Firestore.instance.collection('Users').document('U002').setData({'id':3,'name':'John'})
//========================================
// SAVE COMPLETE
//========================================              
        .then((value) {      
          print('Save data to DB complete!!');
          setState(() {_message = 'Save data to DB complete!!';});
//========================================
// SAVE ERROR
//========================================            
        }).catchError((error){         
          print('Save data to DB Error due to $error' );
          setState(() {_message = 'Save data to DB Error due to $error';});          
        });
    }
//========================================
// FUNCTION READ DATA FROM FIREBASE DB
//========================================  
    fnReadDataToFirebaseDb() {
      Firestore.instance.collection('Users').document('U001').get()
//========================================
// READ COMPLETE
//========================================       
      .then((value) {    
        print('Read data to DB complete!!');            
        print('name:' + value.data['name']);
        setState(() {_message = ' Get Data Complete with name: ' + value.data['name'];});               
//========================================
// READ ERROR
//========================================          
      }).catchError((error){
          print('Get data from DB Error due to $error' );
          setState(() {_message = 'Get data from DB Error due to $error';});                      
      });
      
    }    

}