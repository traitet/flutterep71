import 'package:flutter/material.dart';


class Ep781Page extends StatefulWidget {
  @override
  _Ep781PageState createState() => _Ep781PageState();
}

class _Ep781PageState extends State<Ep781Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ep78-1 - Design Concept: Search Menu & Make Order'),),
      body: ListView(children: <Widget>[
        Image(image: AssetImage('assets/images/ep78 (1).JPG'),),
        Image(image: AssetImage('assets/images/ep78 (2).JPG'),),  
        Image(image: AssetImage('assets/images/ep78 (3).JPG'),),
        Image(image: AssetImage('assets/images/ep78 (4).JPG'),), 
        Image(image: AssetImage('assets/images/ep78 (5).JPG'),),
        Image(image: AssetImage('assets/images/ep78 (6).JPG'),), 
        Image(image: AssetImage('assets/images/ep78 (7).JPG'),),
        Image(image: AssetImage('assets/images/ep78 (8).JPG'),), 
        Image(image: AssetImage('assets/images/ep78 (9).JPG'),),                                                                            
      ],),
      
    );
  }
}