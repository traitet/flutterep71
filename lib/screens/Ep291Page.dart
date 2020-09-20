import 'package:flutter/material.dart';

class Ep291Page extends StatefulWidget {
  @override
  _Ep291PageState createState() => _Ep291PageState();
}

//==========================================================
// STATE CLASS
//==========================================================
class _Ep291PageState extends State<Ep291Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP29-1: UI: Operate Order'),),
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
          child: Center(child: Text('Body')),
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