import 'package:flutter/material.dart';


class Ep711Page extends StatefulWidget {
  @override
  _Ep711PageState createState() => _Ep711PageState();
}

class _Ep711PageState extends State<Ep711Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP711: Code UI Open Table Home'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,        
        children: <Widget>[        
//================================================
// COLUMN#1
//================================================        
        Expanded(flex: 3,child: Container(
          //color: Colors.yellow,
          alignment: FractionalOffset.bottomLeft,
          padding: EdgeInsets.only(bottom: 50),
          transform: Matrix4.rotationZ(-0.6),
          child: Text('See Food \n     No.1 \nStreet Food', style: TextStyle(fontSize: 40),))), 
//================================================
// COLUMN#2
//================================================ 
        Expanded(flex: 1,child: 
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            color: Colors.green,onPressed: (){}, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Order', style: TextStyle(fontSize: 60,color: Colors.white)),
            ),),
        )),
//================================================
// COLUMN#3
//================================================   
        Expanded(flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: <Widget>[
//================================================
// COLUMN#3, ROW#1
//================================================                
              Expanded(child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                color: Colors.deepOrange,onPressed: (){},child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Sign-in', style: TextStyle(fontSize: 30,color: Colors.white)),
              ),)),
//================================================
// COLUMN#3, ROW#2
//================================================                  
              SizedBox(width: 10,),
//================================================
// COLUMN#3, ROW#3
//================================================                  
              Expanded(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),                  
                  color: Colors.blue,onPressed: (){},child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Sign-up', style: TextStyle(fontSize: 30,color: Colors.white)),
              ),)),                  
            ],),
          ),
        )          
      ],),
      
    );
  }
}