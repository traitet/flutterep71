import 'package:flutter/material.dart';

//===========================================
// MAIN CLASS
//===========================================  
class Ep731Page extends StatefulWidget {
  @override
  _Ep731PageState createState() => _Ep731PageState();
}

//===========================================
// STATE CLASS
//===========================================  
class _Ep731PageState extends State<Ep731Page> {
//===========================================
// DECLARE VARIABLE
//===========================================
  TextEditingController _passcodeController =  TextEditingController() ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP73-1: UI Fill Password'),),
//===========================================
// BODY
//===========================================      
      body: Column(children: <Widget>[
//===========================================
// TEXT FORM FIELD
//===========================================  
        Container(
          // color: Colors.yellow,
          padding: EdgeInsets.only(top: 80,left: 50,right: 50,bottom: 50),
          child: TextFormField(
              controller: _passcodeController,
              autofocus: true,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 40),
              decoration: InputDecoration(
              //labelText: 'Passcode',
              hintText: 'Passcode',
              border: OutlineInputBorder(
              ),
            ),
          ),
        ),
//===========================================
// RAISED BUTTON
//=========================================== 
        Container(
          width: double.infinity,
          // color: Colors.pink,
          padding: EdgeInsets.only(top: 0,left: 50,right: 50,bottom: 50),
            child: RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.green,
            onPressed: (){},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Next',style: TextStyle(fontSize: 40,color: Colors.white),),
            ),)),
//===========================================
// NEXT
//===========================================                      
      ],)
//===========================================
// END SCAFFOLE
//===========================================       
    );
  } // END BUILD WIDGET
} // END CLASS