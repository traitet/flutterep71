import 'package:flutter/material.dart';

//===========================================
// MAIN CLASS
//===========================================
class Ep521Page extends StatefulWidget {
  @override
  _Ep521PageState createState() => _Ep521PageState();
}

//===========================================
// STATE CLASS
//===========================================
class _Ep521PageState extends State<Ep521Page> {
  @override
  Widget build(BuildContext context) {
//===========================================
// SCAFFOLD
//===========================================    
    return Scaffold(
      appBar: AppBar(title: Text('EP52-1 Upload Image to Google Cloud Storage Concept'),),
//===========================================
// LISTVIEW
//===========================================      
      body: ListView(children: <Widget>[
//===========================================
// IMAGES
//===========================================        
       Image(image: AssetImage('assets/images/ep521.jpg'),),
       Image(image: AssetImage('assets/images/ep522.jpg'),),       
       Image(image: AssetImage('assets/images/ep523.jpg'),),   
       Image(image: AssetImage('assets/images/ep524.jpg'),),  
       Image(image: AssetImage('assets/images/ep525.jpg'),),
       Image(image: AssetImage('assets/images/ep526.jpg'),),       
       Image(image: AssetImage('assets/images/ep527.jpg'),),   
       Image(image: AssetImage('assets/images/ep528.jpg'),),   
       Image(image: AssetImage('assets/images/ep529.jpg'),),
       Image(image: AssetImage('assets/images/ep5210.jpg'),),                            
      ],),
      
    );
  }
}