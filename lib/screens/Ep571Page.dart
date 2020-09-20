import 'package:flutter/material.dart';

class Ep571Page extends StatefulWidget {
  @override
  _Ep571PageState createState() => _Ep571PageState();
}

class _Ep571PageState extends State<Ep571Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP57-1: Coding UI Order Items'),),
      body: 
      ListView(
        children: <Widget>[
          WidgetOrderItem(qty: 1,title: 'Fried Rice',description: 'Pord Fried Rice Awesome',imageUrl: 'https://firebasestorage.googleapis.com/v0/b/flutterep41.appspot.com/o/m001.jpg?alt=media&token=06cee407-81d4-47d8-877a-778df80dcef5',),
          WidgetOrderItem(qty: 2,title: 'Green Curry',description: 'Green Curry Awesome',imageUrl: 'https://firebasestorage.googleapis.com/v0/b/flutterep41.appspot.com/o/m002.jpg?alt=media&token=877beeae-ba05-4ece-90db-73282b4cf2fc',),
          WidgetOrderItem(qty: 4,title: 'Hamberger',description: 'Pork Hamberger',imageUrl: 'https://firebasestorage.googleapis.com/v0/b/flutterep41.appspot.com/o/m003.jpg?alt=media&token=0cee34cb-c711-46b1-b6af-e0b24f75bb0e',),      
          WidgetOrderItem(qty: 3,title: 'Coke',description: 'Coke',imageUrl: 'https://firebasestorage.googleapis.com/v0/b/flutterep41.appspot.com/o/m004.jpg?alt=media&token=fb166065-9e19-481e-8ae9-418900f63770',),                           
        ],
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

  @override
  Widget build(BuildContext context) {
    return Row(
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
    ],);
  }
}