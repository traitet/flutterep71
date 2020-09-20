import 'package:flutter/material.dart';

class Ep251Page extends StatefulWidget {
  @override
  _Ep251PageState createState() => _Ep251PageState();
}

class _Ep251PageState extends State<Ep251Page> {
//==================================================
// DECLARE VARIABLE
//==================================================
String foodCategory='';   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//==================================================
// TITLE
//==================================================           
        title: 
          Column(         
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('EP25-1: Search Food menu',style: TextStyle(fontSize: 20),),
              Text('Table 15, Mr.Johnson, Cat: $foodCategory',style: TextStyle(fontSize: 15),),
            ],
          ),
//==================================================
// ACTIONS/ICONBUTTON
//==================================================            
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_basket), onPressed: (){})
        ],
        ),
//==================================================
// BODY - CONTAINER
//==================================================          
        body: Container(
          //color: Colors.yellow,
          height: 100,
//==================================================
// LISTVIEW
//==================================================             
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
//==================================================
// CONTAINER
//==================================================   
   
                FoodCategoryWidget(icon: Icon(Icons.dashboard),textTitle: 'Food',onTap: (){setState(() {foodCategory = 'food';});},),
                FoodCategoryWidget(icon: Icon(Icons.gavel),textTitle: 'Drink',onTap: (){setState(() {foodCategory = 'Drinks';});},),
                FoodCategoryWidget(icon: Icon(Icons.streetview),textTitle: 'Dessert',onTap: (){setState(() {foodCategory = 'Dessert';});},),
                FoodCategoryWidget(icon: Icon(Icons.more),textTitle: 'Others',onTap: (){setState(() {foodCategory = 'Others';});},),                                        
                FoodCategoryWidget(icon: Icon(Icons.dashboard),textTitle: 'Food',onTap: (){setState(() {foodCategory = 'food';});},),
                FoodCategoryWidget(icon: Icon(Icons.gavel),textTitle: 'Drink',onTap: (){setState(() {foodCategory = 'Drinks';});},),
                FoodCategoryWidget(icon: Icon(Icons.streetview),textTitle: 'Dessert',onTap: (){setState(() {foodCategory = 'Dessert';});},),
                FoodCategoryWidget(icon: Icon(Icons.more),textTitle: 'Others',onTap: (){setState(() {foodCategory = 'Others';});},),  
            ],
          ),
        ),

      
    );
  }
}

class FoodCategoryWidget extends StatelessWidget {
//==================================================
// DECLARE VARIABLE
//==================================================
  final Icon icon;
  final String textTitle;   
  final VoidCallback onTap;
//==================================================
// CONSTRUCTURE 
//==================================================  
  const FoodCategoryWidget({
    this.icon,
    this.textTitle,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
//==================================================
// CHANGE TO BUTTON BY INKWELL
//==================================================     
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
//==================================================
// CARD
//==================================================                     
        child: Card(
          color: Colors.blue,
          child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                icon,
                Text(textTitle),
              ],
            ),)),
    );
  }
}