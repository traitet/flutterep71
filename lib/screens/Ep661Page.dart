
//===============================================
// IMPORT
//===============================================
import 'package:flutter/material.dart';
import 'package:flutterep11/models/Ep66OrderModel.dart';


//===============================================
// MAIN CLASS
//===============================================
class Ep661Page extends StatefulWidget {
  @override
  _Ep661PageState createState() => _Ep661PageState();
}

//===============================================
// STATE CLASS
//===============================================
class _Ep661PageState extends State<Ep661Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//===============================================
// APP BAR
//===============================================      
      appBar: AppBar(title: Text('EP66-1: Class Model for Ordering'),),
      body: ListView(children: <Widget>[
//===============================================
// LIST VIEW CHILD
//===============================================        
           RaisedButton(onPressed: () {
//===============================================
// FUNCTION SAVE ORDER
//===============================================               
              fnSaveOrder();

           },child: Text('EP66-1 - Class modelling for Ordering'),),         
      ],),
      
    );
  }

//===============================================
// FUNCTION SAVE ORDER
//===============================================  
fnSaveOrder(){
    //===============================================
    // 1) PREPARE VARIABLE
    //===============================================  
    Ep661OrderModel _orderModel = Ep661OrderModel(
        customerInfo: CustomerInfo(customerName: 'Mr.John',mobileNo:'08592432424'),
        listOrderItemInfo: [
          OrderItemInfo(menuId: 'M0001',menuNameEng:'Fired Riced',qty: 1,status:'ORDER'),
          OrderItemInfo(menuId: 'M0002',menuNameEng:'Green Curry',qty: 1,status:'ORDER'),
          OrderItemInfo(menuId: 'M0001',menuNameEng:'Fired Riced',qty: 1,status:'SEND'),
          OrderItemInfo(menuId: 'M0002',menuNameEng:'Green Curry',qty: 1,status:'SEND'),          
          OrderItemInfo(menuId: 'M0003',menuNameEng:'Coke',qty: 1,status:'COOK'),  
          OrderItemInfo(menuId: 'M0003',menuNameEng:'Coke',qty: 1,status:'SERVE'),                               
        ],
        tableNo: 'T0002',
        orderNo: 'ORD0002',
        // createOrderTime: 

    );
    //===============================================
    // 2) CALL SAVE ORDER (MANY ITEMS)
    //===============================================
    _orderModel.saveOrder();  


}

}