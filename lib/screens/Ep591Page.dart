//=============================================
// IMPORT
//============================================= 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//=============================================
// MAIN CLASS & RECEIVE PARAMETER
//============================================= 
class Ep591Page extends StatefulWidget {
//=============================================
// PROPERTY
//============================================= 
final String orderNo;
//=============================================
// CONSTUCTURE
//=============================================   
  const Ep591Page({
    this.orderNo,
    Key key,
  }) : super(key: key);
//=============================================
// ORDERRIDE CREATE STATE
//=============================================  
  @override
  _Ep591PageState createState() => _Ep591PageState();
}

//=============================================
// STATE CLASS
//============================================= 
class _Ep591PageState extends State<Ep591Page> {
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
            Text('EP59-1: Coding UI Order Items - delete'),
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
                imageUrl: snapshot.data.documents[index].data['imageUrl']??'',
                onPressed: (){
//=============================================
// EP59: DELETE ITEM BY DOCUMENT ID E.G. ORD007|1599410139938 (STEP#3)
//=============================================  
                  Firestore.instance.collection('TT_ORDERS').document(snapshot.data.documents[index].documentID).delete()
//=============================================
// EP59: DELETE OK
//=============================================                   
                  .then((value) {
                    print('Already deleted order item: ${snapshot.data.documents[index].documentID}') ;  
                  })
//=============================================
// EP59: DELETE ERROR
//=============================================                   
                  .catchError((error){
                    print('DELETE ERROR: $error') ;                      
                  })
//=============================================
// EP59: AFTER DELETE OK OR ERROR
//=============================================                   
                  .whenComplete((){
                    print('WHEN COMPLETED DELETING: ${snapshot.data.documents[index].documentID}') ;                      
                  });   

                },
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
final VoidCallback onPressed;   //EP59: STEP#2.1
//=============================================
// CONSTRUCTURE
//=============================================
  const WidgetOrderItem({
    this.onPressed,             //EP59: STEP#2.2
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
// ROW#1 IMAGE
//=============================================
        Container(
          padding: EdgeInsets.all(4),
          height: 50,
          width: 50,
          child: Image.network(
            imageUrl),
        ),
//=============================================
// ROW#2 DETAIL
//=============================================   
        Expanded(
          child: Padding(
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
          ),
        ),
//=============================================
// ROW#3 DELETE ICON BUTTON (EP59)# STEP#1 (ADD ROW#3/ PASS ONPRESSED)
//=============================================
      IconButton(icon: Icon(Icons.delete,color: Colors.deepOrange,),onPressed: onPressed),   


      ],),
    );
  }
}