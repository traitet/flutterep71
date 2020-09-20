import 'package:flutter/material.dart';

class Ep261Page extends StatefulWidget {
  @override
  _Ep261PageState createState() => _Ep261PageState();
}

class _Ep261PageState extends State<Ep261Page> {
  @override
  Widget build(BuildContext context) {
//=====================================================
// RETURN 
//=====================================================    
    return Scaffold(
      appBar: AppBar(title: Text('EP26-1: View Menu Detail'),),
      body: Column(
        children: <Widget>[
//=====================================================
// COLUMN#1: IMAGE
//=====================================================    
          Container(
            padding: EdgeInsets.all(8),
            width: double.infinity,
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/pic1.jpg')),
          ),
//=====================================================
// COLUMN#2 TEXT 
//=====================================================    
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('Friedrice',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('Friedrice with port and big bowl',style: TextStyle(fontSize: 15,),maxLines: 5,),
                  ),
                ],),
              ),
//=====================================================
// ROW#2
//=====================================================
              Row(children: <Widget>[
                IconButton(icon: Icon(Icons.arrow_drop_up,size: 50,), onPressed: (){}),
                Text(' 1',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),           
                IconButton(icon: Icon(Icons.arrow_drop_down,size: 50,), onPressed: (){}),          
              ],)              
            ],),
          ),
//=====================================================
// COLUMN#3 BUTTON 
//===================================================== 
            Container(height: 20,),
            Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              child: RaisedButton(
                color: Colors.blue,
                onPressed: (){},child: Text('Order',style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,fontWeight: FontWeight.bold)),))            
        ],

      ),
      
    );
  }
}