import 'package:flutter/material.dart';


class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP11'),),
      body: Center(child: Text('test')),

      // child: Text('test')
    );
  }
}