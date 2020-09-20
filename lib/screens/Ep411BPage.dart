import 'package:flutter/material.dart';
import 'package:flutterep11/singletons/GlobalAppData.dart';

class Ep411BPage extends StatefulWidget {
//==================================================
// EP#401: DECLARE VARIABLE (comment by EP411)
//==================================================
  // final String displayName;
  // final String email;  
//==================================================
// EP#401: CONSTRUCTURE (comment by EP411)
//==================================================
  // const Ep411BPage ({
  //   this.displayName,
  //   this.email,    
  //   Key key,
  // }): super(key: key); 

//==================================================
// OVERRIDE
//==================================================
  @override
  _Ep411BPageState createState() => _Ep411BPageState();
}

class _Ep411BPageState extends State<Ep411BPage> {


//==================================================
// DECLARE VARIABLE
//==================================================  
//==================================================
// DECLARE VARIABLE
//==================================================
String foodCategory='';   

//==================================================
// DECLARE GLOBAL VARIABLE (EP411)
//==================================================
GlobalAppData globalAppData = GlobalAppData();

//==================================================
// OVERRIDE
//==================================================
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
              Text('EP41-1B: Search - food menu list',style: TextStyle(fontSize: 16),),
              Text(
//==================================================
// EP401: GET DISPLAY NAME (?? if null show [no name])
//==================================================                  
                //widget.email??'[No Name]'+
//==================================================
// EP401: GET DISPLAY NAME FROM PARAMETER (?? if null show [no name])
//==================================================   
            'T:15, ${(globalAppData.name)},${(globalAppData.email)} Cat: $foodCategory',style: TextStyle(fontSize: 15),),        
            //'Table 15, [email], Cat: $foodCategory',style: TextStyle(fontSize: 15),),   

                //'Table 15, ${(widget.email??'[No Name]')}, Cat: $foodCategory',style: TextStyle(fontSize: 15),),
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
        body: 
        
        Column(
          children: <Widget>[
//==================================================
// COLUMN#1: FOOD CATEGORY LIST
//==================================================             
            Container(
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
//==================================================
// COLUMN#1: FOOD CATEGORY LIST
//==================================================  
  Expanded(
    child: ListView(children: <Widget>[
        FoodMenuWidget(title: 'Fried rice',description: 'Delicious very good thai food',price: 50,imageStr: 'assets/images/pic1.jpg',),
        FoodMenuWidget(title: 'Fried Pork soup',description: 'Delicious very good thai food',price: 70,imageStr: 'assets/images/pic2.jpg',),
        FoodMenuWidget(title: 'Chicken noodle',description: 'Awesome very good thai food',price: 85,imageStr: 'assets/images/pic3.jpg',),
        FoodMenuWidget(title: 'Pork Soup',description: 'Nice soup good thai origintal',price: 25,imageStr: 'assets/images/pic1.jpg',),
        FoodMenuWidget(title: 'Chicken Fried',description: 'Delicious very good thai food',price: 30,imageStr: 'assets/images/pic2.jpg',),                                       
  ],)
    // Container(
    //   color: Colors.yellow,
    //   child: Text('Test')),
  ),   
//==================================================
// END COLUMN
//==================================================           
          ],
        ),
        

      
    );
  }
}

//==================================================
// CLASS: FOOD MENU WIDGET
//================================================== 
class FoodMenuWidget extends StatelessWidget {
//==================================================
// DECLARE VARIABLE
//==================================================
final String title;
final double price;
final String description;
final String imageStr;
//==================================================
// CONSTRUCTURE
//==================================================    
  const FoodMenuWidget({
    this.title,
    this.price,
    this.description,
    this.imageStr,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child:  
        Row(
          children: <Widget>[
//==================================================
// ROW#1
//==================================================             
            Container(
              padding: EdgeInsets.all(8),
              height: 120,
              width: 120,
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage(
                  imageStr)),
            ),
//==================================================
// ROW#2
//==================================================             
            Expanded(child: 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('$title (${(price.toString())}B)',maxLines: 2,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('$description',maxLines: 2,)
                ],
              )),
//==================================================
// ROW#3
//==================================================                
            Column(
              children: <Widget>[
                SizedBox(height: 5,),
                Row(
                  children: <Widget>[
                    Icon(Icons.arrow_drop_up,size: 50,),
                    Text('1'),
                    Icon(Icons.arrow_drop_down,size: 50),                    
                  ],
                ),
                RaisedButton(
                  color: Colors.blue,
                  onPressed: (){}, child: Text('Order'),)
              ],
            ),
          ],
        ),
    );
  }
}



//==================================================
// CLASS FOOD CATEGORY
//==================================================   
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