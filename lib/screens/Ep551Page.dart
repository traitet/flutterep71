import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Ep531BPage.dart';

class Ep551Page extends StatefulWidget {
  @override
  _Ep551PageState createState() => _Ep551PageState();
}

class _Ep551PageState extends State<Ep551Page> {
//==================================================
// DECLARE VARIABLE **EP54**
//==================================================
String foodCategory='Food';   
//==================================================
// DECLARE VARIABLE **EP55**
//==================================================
String tableNo ='T001';
String orderNo = 'ORD001';  
String customerName = 'Mr.Johnson';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//==================================================
// TITLE *** EP 54 ***
//==================================================           
        title: 
          Column(         
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('EP55-1: Logic - Search Menu by Category',style: TextStyle(fontSize: 16),),
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
// CONTAINER ** EP54 **
//==================================================   
                    FoodCategoryWidget(icon: Icon(Icons.dashboard),textTitle: 'Food',onTap: (){setState(() {foodCategory = 'Food';});},),
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
// GET DATA FROM DATABASE: *** CHANGE EP54 *** 
//==================================================         
        //stream: Firestore.instance.collection('TM_MENUS').snapshots(),
        //stream: Firestore.instance.collection('TM_MENUS').where('menuCategoryValue',isEqualTo: 'Food').snapshots(),          
        stream: Firestore.instance.collection('TM_MENUS').where('menuCategoryValue',isEqualTo: foodCategory).snapshots(),        
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
          else if (snapshot.data.documents.length==0){
            return Center(child: Text('No data found'));
          }             
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
// EP55: PASS PARAMETER STEP#2
//==================================================      
                  menuId: snapshot.data.documents[index].data['menuId'],
                  customerName: customerName,
                  tableNo: tableNo,
                  orderNo: orderNo,            
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
//==================================================
// EP55: ADD PARAMETER
//==================================================                     
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
// EP55 STEP#3
//================================================== 
final String tableNo;
final String orderNo;
final String customerName;
final String menuId;
//==================================================
// EP51 (INKWELL-STEP#1)
//================================================== 
final VoidCallback onTap;
//==================================================
// CONSTRUCTURE
//==================================================    
  const FoodMenuWidget({
//==================================================
// EP55 
//==================================================     
  this.tableNo,
  this.orderNo,
  this.customerName,
  this.menuId,
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
                    onPressed: (){
//==================================================
// FUNCTION SAVE ORDER EP55
//================================================== 
fnSaveOrder(
  orderNo:orderNo,tableNo: tableNo,qty: 1, menuId: 'M001', customerName: customerName,

);                        
                    }, child: Text('Order'),)
                ],
              ),
            ],
          ),
      ),
    );
  }

//==================================================
// FUNCTION SAVE ORDER EP55
//================================================== 
fnSaveOrder(
  {String orderNo, String tableNo,String customerName,String menuId, int qty}
){
  Firestore.instance.collection('TT_ORDERS').document('ORD003').setData({
    'orderNo': 'ORD003',
    'no': 1,
    'tableNo': tableNo,
    'customerName': customerName,
    'qty': qty,
    'orderTime': DateTime.now(),
    'status': 'ORDERING'
//==================================================
// THEN (IF SAVE COMPLETE)
//==================================================     
  }).then((value) {
    print('Save Complete');
//==================================================
// CATCH ERROR (IF ERROR)
//==================================================     
  }).catchError((error){
    print('Save Error $error');
//==================================================
// WHEN COMPLETE
//==================================================     
  }).whenComplete(() {
    print('When completed');
  });
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