import 'package:flutter/material.dart';

class Ep321Page extends StatefulWidget {
  @override
  _Ep321PageState createState() => _Ep321PageState();
}

class _Ep321PageState extends State<Ep321Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP32-1: Scan QR on Table'),),
      body: Column(children: <Widget>[
//==========================================================
// COLUMN#1 IMAGE (ADD LINK IN PUBSPEC.YAML)
//========================================================== 
        Expanded(child: Container(
          width: 400,
          height: 400,
          child: Image(          
            image: AssetImage('assets/icon/qr.png')),
        )) ,    

//==========================================================
// COLUMN#2 RAISED BUTTON
//==========================================================
        Container(
          padding: EdgeInsets.all(8),
          width: double.infinity,
          child: RaisedButton(color: Colors.blue,onPressed: (){},child: Text('Scan QR', style: TextStyle(fontSize: 20, color: Colors.white),)))   
      ],),
      
    );
  }
}