import 'package:flutter/material.dart';


class Ep331Page extends StatefulWidget {
  @override
  _Ep331PageState createState() => _Ep331PageState();
}

class _Ep331PageState extends State<Ep331Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EP33-1: UI: Make Payment'),
        
      ),

      body: Column(children: <Widget>[
//=============================================================
// COLUMN#1
//=============================================================        
        Expanded(
        
          child: Column(children: <Widget>[
//=============================================================
// COLUMN#1.1
//=============================================================   
          ListTile(onTap: (){},leading: Container(height: 40,width: 40,child: Image.asset('assets/images/scb.png')),title: Text('SCB QR'),trailing: Icon(Icons.arrow_forward_ios),),
          Container(height: 1,width: double.infinity,color: Colors.black12,),
          ListTile(onTap: (){},leading: Container(height: 40,width: 40,child: Image.asset('assets/images/cash.png')),title: Text('Cash'),trailing: Icon(Icons.arrow_forward_ios),),
          Container(height: 1,width: double.infinity,color: Colors.black12,),          
          ListTile(onTap: (){},leading: Container(height: 40,width: 40,child: Image.asset('assets/images/creditcard.png')),title: Text('Credit Card'),trailing: Icon(Icons.arrow_forward_ios),),     
          Container(height: 1,width: double.infinity,color: Colors.black12,),
          ListTile(onTap: (){},leading: Container(height: 40,width: 40,child: Image.asset('assets/images/onlinebanking.png')),title: Text('Online Banking'),trailing: Icon(Icons.arrow_forward_ios),),         
          Container(height: 1,width: double.infinity,color: Colors.black12,),
          ListTile(onTap: (){},leading: Container(height: 40,width: 40,child: Image.asset('assets/images/linepay.jpg')),title: Text('Line Pay'),trailing: Icon(Icons.arrow_forward_ios),),                                    
          Container(height: 1,width: double.infinity,color: Colors.black12,),
//=============================================================
// COLUMN#1.2
//=============================================================
//=============================================================
// COLUMN#1.3
//=============================================================      
          ],),
        ),
//=============================================================
// COLUMN#2
//=============================================================         
        Container(height: 1,width: double.infinity,color: Colors.black12,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(child: Text('Total Amount:',style: TextStyle(fontSize: 20))),
              Text('B350',style: TextStyle(fontSize: 30,color: Colors.deepOrange,fontWeight: FontWeight.bold)),              
            ],
          ),
        ),
      
      ],),
      
    );
  }
}