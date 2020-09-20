//=============================================
// IMPORT
//============================================= 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//=============================================
// MAIN CLASS & RECEIVE PARAMETER
//============================================= 
class Ep581Page extends StatefulWidget {
//=============================================
// PROPERTY
//============================================= 
final String orderNo;
//=============================================
// CONSTUCTURE
//=============================================   
  const Ep581Page({
    this.orderNo,
    Key key,
  }) : super(key: key);
//=============================================
// ORDERRIDE CREATE STATE
//=============================================  
  @override
  _Ep581PageState createState() => _Ep581PageState();
}

//=============================================
// STATE CLASS
//============================================= 
class _Ep581PageState extends State<Ep581Page> {
//=============================================
// OVERRIDE BUILDER WIDGET
//============================================= 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//=============================================
// APP BAR
//=============================================       
      appBar: AppBar(title: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('EP58-1: Coding UI Order Items'),
            Text('Order#: ${widget.orderNo}'),
          ],
        ),),
      body: 
//=============================================
// EP58: STREAMBUILDER & GET DATA FROM DB STEP#1
//=============================================
    StreamBuilder(
      stream: Firestore.instance.collection('TT_ORDERS')
      .where('orderNo', isEqualTo: widget.orderNo)
      .snapshots(),
//=============================================
// EP58:GET SNAPSHOT STEP#2
//=============================================      
      builder: (context,snapshot){
        return 
//=============================================
// EP58:GET LISTVIEW BUILDER STEP#3
//=============================================         
          ListView.builder(
//=============================================
// EP58: ITEMCOUNT STEP#4
//=============================================             
            itemCount: snapshot.data.documents.length,
//=============================================
// EP58: ITEMBUILDER STEP#5
//=============================================             
            itemBuilder: (context,index){
//=============================================
// EP58: CHECK WHEN NO LOADING DATA STEP#6
//=============================================               
              if (!snapshot.hasData) return Text('Loading..');
              else
//=============================================
// EP58: SHOW DATA IN EACH ITEM STEP#7
//=============================================               
              return 
//=============================================
// EP58:CALL WIDGET ORDER ITEM STEP#8
//=============================================               
              WidgetOrderItem(
                qty: snapshot.data.documents[index].data['qty']??0,
                title: snapshot.data.documents[index].data['menuNameEng']??'',
                description: snapshot.data.documents[index].data['menuDescEng']??'',
                imageUrl: snapshot.data.documents[index].data['imageUrl']??''
              );             
            }
          );
      },

    ),       
     
    );
  }
}

//=============================================
// WIDGET: ORDER ITEM
//=============================================
class WidgetOrderItem extends StatelessWidget {
//=============================================
// DECLARE VARIABLE / CLASS PROPERTY
//=============================================
final int qty;
final String title;
final String description;  
final String imageUrl; 
//=============================================
// CONSTRUCTURE
//=============================================
  const WidgetOrderItem({
    this.qty,
    this.title,
    this.description,
    this.imageUrl,
    Key key,
  }) : super(key: key);
//=============================================
// OVERRIDE BUILD WIDGET
//=============================================
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // LINK TO ORDER ITEM PAGE TO CHANGE QTY OR REMOVE ITEM
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        
//=============================================
// COL#1 IMAGE
//=============================================
        Container(
          padding: EdgeInsets.all(4),
          height: 50,
          width: 50,
          child: Image.network(
            imageUrl),
        ),
//=============================================
// COL#2 DETAIL
//=============================================   
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
//=============================================
// COL#2.1 DETAIL e.g. X5 Fired rice
//=============================================
            Row(
              children: <Widget>[
                Text('x${qty.toString()} ',style: TextStyle(fontSize: 20)),
                Text(title,style: TextStyle(fontSize: 20)),
              ],
            ),
//=============================================
// COL#2.2 DETAIL e.g. X5 Fired rice
//=============================================
            Text(description)

          ],),
        )       
      ],),
    );
  }
}