import 'package:flutter/material.dart';


class Ep361Page extends StatefulWidget {
  @override
  _Ep361PageState createState() => _Ep361PageState();
}

class _Ep361PageState extends State<Ep361Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP36-1: Google Firebase for Case Study'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: <Widget>[
          Text(''),
          Text('What is Firebase ? : Google Platform for mobile app'),
          Text(''),
          Text('What are Firebase features used? : Google Platform including DB, Host, Cloud and Authen function'),
          Text(''),          
          Image(image: AssetImage('assets/images/firebase.png'),),
          Text('\nFirebase used in Restaurant E-menu case study'),          
          Image(image: AssetImage('assets/images/firebasedb.png'),),
          Text('\nFirebase Database'),          
          Image(image: AssetImage('assets/images/firebasestorage.png'),),      
          Text('\nHosting'),          
          Image(image: AssetImage('assets/images/firebasehosting.png'),),    
          Text('\nAuthen'),          
          Image(image: AssetImage('assets/images/firebaseauthen.png'),),                                     
        ],),
      ),
      
    );
  }
}