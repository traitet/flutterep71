import 'package:flutter/material.dart';

class Ep491Page extends StatefulWidget {
  @override
  _Ep491PageState createState() => _Ep491PageState();
}

class _Ep491PageState extends State<Ep491Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP49-1 Concept for Search Menu Page'),),
      body: ListView(
        children: <Widget>[
          Image(image: AssetImage('assets/images/ep491.jpg'),),
          Image(image: AssetImage('assets/images/ep492.jpg'),),
          Image(image: AssetImage('assets/images/ep493.jpg'),),      
          Image(image: AssetImage('assets/images/ep494.jpg'),),
          Image(image: AssetImage('assets/images/ep495.jpg'),),
          Image(image: AssetImage('assets/images/ep496.jpg'),),    
          Image(image: AssetImage('assets/images/ep497.jpg'),),                                     
        ],
      ),
      
    );
  }
}