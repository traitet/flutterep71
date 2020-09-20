import 'package:flutter/material.dart';

class Ep301Page extends StatefulWidget {
  @override
  _Ep301PageState createState() => _Ep301PageState();
}

//==========================================================
// STATE CLASS
//==========================================================
class _Ep301PageState extends State<Ep301Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: FittedBox(fit:BoxFit.fitWidth, child: Text('EP30-1 - UI: Operate Order (Column#2: Order List)'))),
      body:Column(children: <Widget>[
//==========================================================
// COLUMN#1: 
//==========================================================  
        Container(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              FilterFoodCategoryWidget(filterText: 'All',isActive: true),
              FilterFoodCategoryWidget(filterText: 'Food',isActive: false),  
              FilterFoodCategoryWidget(filterText: 'Drinks',isActive: false), 
              FilterFoodCategoryWidget(filterText: 'Dessert',isActive: false),    
              FilterFoodCategoryWidget(filterText: 'JP Food',isActive: false),                                                                
          ],),
        ),
//==========================================================
// COLUMN#2: 
//==========================================================  
      Expanded(
        child: Container(
          color: Colors.blue,
          child: ListView(
            children: <Widget>[
              OrderListWidget(orderNo: 'OD001',),
              OrderListWidget(orderNo: 'OD002',),
              OrderListWidget(orderNo: 'OD003',),                          
            ],
          )
        ),
      ), 
//==========================================================
// COLUMN#3: RAISED BUTTON
//==========================================================  
      Row(children: <Widget>[
        Expanded(child: RaisedButton(color: Colors.green,onPressed: (){},child: Text('Queued'),)),
        SizedBox(width: 10,),
        Expanded(child: RaisedButton(onPressed: (){},child: Text('Served'),)),        
      ],)        
      ],),
      
    );
  }
}


//==========================================================
// ORDER LIST WIDGET
//========================================================== 
class OrderListWidget extends StatelessWidget {
//==========================================================
// PROPERTY
//==========================================================
  final String orderNo;    
//==========================================================
// CONSTCUTURE
//========================================================== 
  const OrderListWidget({
    this.orderNo,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
//==========================================================
// COLUMN#1
//========================================================== 
    Container(
      color: Colors.grey,
      child: Row(children: <Widget>[
        Expanded(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Order#: $orderNo ,Table#1 17:32 (Mr.John)'),
        )),
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: RaisedButton(color: Colors.green[200],onPressed: (){},child: Text('Served',style: TextStyle(color: Colors.black87)),),
        ),
      ],),
    ),
//==========================================================
// COLUMN#2
//==========================================================      
      Column(children: <Widget>[
//==========================================================
// ROW
//==========================================================  
        buildOrderDetail(), 
        buildOrderDetail(), 
        buildOrderDetail(),                 
      ],),
      
    ],);
  }

//==========================================================
// METHOD: BUILD ORDER DETAIL
//========================================================== 
  Container buildOrderDetail() {
    return Container(
        decoration: BoxDecoration(border: Border.all(
          width: 1,
          color: Colors.blueAccent)),
        child: Row(children: <Widget>[
//==========================================================
// ROW#1
//========================================================== 
        Expanded(child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('x2 Fried Rice',style: TextStyle(color: Colors.white),),
              Text('Status: Queued',style: TextStyle(color: Colors.white),),            
            ],
          ),
        )),
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: RaisedButton(color: Colors.greenAccent,onPressed: (){},child: Text('Served',style: TextStyle(color: Colors.black54),),),
        ),          
//==========================================================
// ROW#2
//==========================================================           
        ],),
      );
  }
}

//==========================================================
// COLUMN#1: FILTER FOOD CATEGORY
//========================================================== 
class FilterFoodCategoryWidget extends StatelessWidget {
//==========================================================
// PROPERTY = DECLARE VAIRABLE
//==========================================================  
  final String filterText;
  final bool isActive;
//==========================================================
// CONSTRUCTURE
//==========================================================  
  const FilterFoodCategoryWidget({
    this.filterText,
    this.isActive,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){},child: Card(child: Container(alignment: Alignment.center,
//==========================================================
// CONDITION: ISACTIVE=TRUE -> GREEN, ISACTIVE=FALSE -> BLACK12
//==========================================================      
    color: isActive ? Colors.green : Colors.black12,
    width: 100,child: Text(filterText))));
  }
}