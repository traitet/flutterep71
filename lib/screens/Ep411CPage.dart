import 'package:flutter/material.dart';
import '../singletons/GlobalAppData.dart';


class Ep411CPage extends StatefulWidget {
  @override
  _Ep411CPageState createState() => _Ep411CPageState();
}

class _Ep411CPageState extends State<Ep411CPage> {
//================================================
// STEP#1: DECALARE GLOBAL VARAIBLE
//================================================
GlobalAppData globalAppData = GlobalAppData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP41-1: Get Global Variable'),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
//================================================
// STEP#2: GET DATA
//================================================              
              Text('Global Data (Singleton), Name: ${globalAppData.name}'),
              Text('Global Data (Singleton), E-mail: ${globalAppData.email}'), 
              RaisedButton(onPressed: (){
                  setState(() {
//================================================
// STEP#3: SET DATA
//================================================                       
                    globalAppData.name = 'Johnson';
                    globalAppData.email = 'Johnson@hotmail.com';     
                  });

                 

              },child: Text('Clear Global Variable Value'),)          
 
          ],),
        ),
      )   ,
      
    );
  }
}