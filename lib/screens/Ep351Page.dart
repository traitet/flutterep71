import 'package:flutter/material.dart';

class Ep351Page extends StatefulWidget {
  @override
  _Ep351PageState createState() => _Ep351PageState();
}

class _Ep351PageState extends State<Ep351Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP35-1: Release web to github'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Step#1: Register github, find account name, new repository'),
          Text('Step#2: Build and release web'), 
          Text('Step#3: Upload web to github'),
          Text('Step#4: access website e.g. http://traitet.github.io'),                                
        ],
      ),
      
    );
  }
}