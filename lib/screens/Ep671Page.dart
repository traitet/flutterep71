
//===============================================
// IMPORT
//===============================================
import 'package:flutter/material.dart';
import '../models/Ep67OrderModel.dart';


//===============================================
// MAIN CLASS
//===============================================
class Ep671Page extends StatefulWidget {
  @override
  _Ep671PageState createState() => _Ep671PageState();
}

//===============================================
// STATE CLASS
//===============================================
class _Ep671PageState extends State<Ep671Page> {
//===============================================
// DECLARE VARIABLE : STEP#1
//===============================================

  Ep67OrderModel _orderModel = Ep67OrderModel(orderNo: 'ORD0001');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//===============================================
// APP BAR
//===============================================      
      appBar: AppBar(title: Text('EP67-1: Model mapping for get order'),),
      body: ListView(children: <Widget>[
//===============================================
// LIST VIEW CHILD
//===============================================        
           RaisedButton(onPressed: () {

//===============================================
// CALL GET ORDER: STEP#2
//===============================================
              _orderModel.getOrder();

           },child: Text('Get Order'),),         
      ],),
      
    );
  }


}