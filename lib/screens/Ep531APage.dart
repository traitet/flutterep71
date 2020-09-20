import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../screens/Ep531BPage.dart';

class Ep531APage extends StatefulWidget {
  @override
  _Ep531APageState createState() => _Ep531APageState();
}

class _Ep531APageState extends State<Ep531APage> {
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
              Text('EP53-1A: Logic - Upload Image/Edit Menu (Search)',style: TextStyle(fontSize: 16),),
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
// EP50: GET MENU FROM DATABASE
//==================================================  
    Expanded(
//==================================================
// STEAMBUILDER
//==================================================        
      child: StreamBuilder(
//==================================================
// GET DATA FROM DATABASE
//==================================================         
        //stream: Firestore.instance.collection('TM_MENUS').snapshots(),
        stream: Firestore.instance.collection('TM_MENUS').where('menuCategoryValue',isEqualTo: 'Food').snapshots(),        
        builder: (context, snapshot) {
//==================================================
// IF HAVE NO DATA (SNAPSHOT) -> SHOW LOADING
//==================================================  
          if (!snapshot.hasData){return 
          Container(
            alignment: Alignment.center,
            width: 20,height: 20,
            child: CircularProgressIndicator());}
//==================================================
// IF HAVE  DATA (SNAPSHOT) -> SHOW LISTVIEW
//==================================================  
          else return 
          ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context,index){
//==================================================
// RETURN CONTAINER
//==================================================                
              return 
                FoodMenuWidget(
//==================================================
// EP51 (INKWELL-STEP#5)
//==================================================                   
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Ep531BPage(menuId: snapshot.data.documents[index].documentID)),);
                    },
                    title: snapshot.data.documents[index].data['menuNameEng'],
                    description: snapshot.data.documents[index].data['menuDescriptionEng'],
                    price: snapshot.data.documents[index].data['price'].toDouble(),
                    imageStr: snapshot.data.documents[index].data['imageUrl'],);
            })
          ;
        }

        // menuNameEng,menuDescriptionEng,price

      )
//==================================================
// LISTVIEW BUILDER
//==================================================     
//==================================================
// SHOW EACH ITEM CONTAINER  
//==================================================     




    ), 
  // Expanded(
  //   child: ListView(children: <Widget>[
  //       FoodMenuWidget(title: 'Fried rice',description: 'Delicious very good thai food',price: 50,imageStr: 'assets/images/pic1.jpg',),
  //       FoodMenuWidget(title: 'Fried Pork soup',description: 'Delicious very good thai food',price: 70,imageStr: 'assets/images/pic2.jpg',),
  //       FoodMenuWidget(title: 'Chicken noodle',description: 'Awesome very good thai food',price: 85,imageStr: 'assets/images/pic3.jpg',),
  //       FoodMenuWidget(title: 'Pork Soup',description: 'Nice soup good thai origintal',price: 25,imageStr: 'assets/images/pic1.jpg',),
  //       FoodMenuWidget(title: 'Chicken Fried',description: 'Delicious very good thai food',price: 30,imageStr: 'assets/images/pic2.jpg',),                                       
  // ],)

  // ),   
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
// EP51 (INKWELL-STEP#1)
//================================================== 
final VoidCallback onTap;
//==================================================
// CONSTRUCTURE
//==================================================    
  const FoodMenuWidget({
//==================================================
// EP51 (INKWELL-STEP#2)
//==================================================     
    this.onTap,
    this.title,
    this.price,
    this.description,
    this.imageStr,

    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
//==================================================
// EP51 (INKWELL-STEP#3)
//==================================================     
    return InkWell(
//==================================================
// EP51 (INKWELL-STEP#4)
//==================================================       
      onTap: onTap,
      child: Container(
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
                  image: NetworkImage(
//==================================================
// FIXED EP50 TO CHECK IF HAVE NO IMAGE
//==================================================                      
                    imageStr??'')),
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
              // Column(
              //   children: <Widget>[
              //     SizedBox(height: 5,),
              //     Row(
              //       children: <Widget>[
              //         Icon(Icons.arrow_drop_up,size: 50,),
              //         Text('1'),
              //         Icon(Icons.arrow_drop_down,size: 50),                    
              //       ],
              //     ),
              //     RaisedButton(
              //       color: Colors.blue,
              //       onPressed: (){}, child: Text('Order'),)
              //   ],
              // ),
            ],
          ),
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
// CHANGE TO BUTTON BY INKWELL (ABLE TO CLICK : FOR EP51-A)
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