import 'package:flutter/material.dart';

class Ep441Page extends StatefulWidget {
  @override
  _Ep441PageState createState() => _Ep441PageState();
}

class _Ep441PageState extends State<Ep441Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP44-1 Config Firebase Web & flutter for DB'),),
      body: ListView(children: <Widget>[
//==================================================
// IMAGE#1
//==================================================
          Text(''),
          Text('Config firebase and flutter for database'),
          Text(''),
          Text('1) config web 2) config flutter'),
          Text(''),          
          Image(image: AssetImage('assets/images/firebase.png'),),
          Text('\nFirebase used in Restaurant E-menu case study'),          
          Image(image: AssetImage('assets/images/firebasedb1.png'),),
          Text('\nFirebase Database'),          
          Image(image: AssetImage('assets/images/firebasestorage.png'),),      
          Text('\nHosting'),          
          Image(image: AssetImage('assets/images/firebasehosting.png'),),    
          Text('\nAuthen'),          
          Image(image: AssetImage('assets/images/firebaseauthen.png'),),  

      ],) ,
      
    );
  }
}