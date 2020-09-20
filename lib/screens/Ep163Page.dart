//===============================================================
// IMPORT
//===============================================================  
import 'package:flutter/material.dart';
import 'package:flutterep11/widgets/DrawerWidget.dart';


//===============================================================
// MAIN CLASS
//===============================================================  
class Ep163Page extends StatefulWidget {
  @override
  _Ep163PageState createState() => _Ep163PageState();
}

//===============================================================
// STATE CLASS
//===============================================================  
class _Ep163PageState extends State<Ep163Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//===============================================================
// APP BAR
//===============================================================        
      appBar: AppBar(title: Text('EP16-3 Scaffold Drawer'),),
      
//===============================================================
// DRAWER: CALL FILE widgets/DrawerWidget.dart
//===============================================================      
      drawer: DrawerWidget(),
      
    );
  }
}


