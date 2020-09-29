//==================================================
// IMPORT
//==================================================
import 'package:flutter/material.dart';
import '../models/Ep79MenuModel.dart';
import '../singletons/GlobalAppData.dart';
import '../models/EP79OrderModel.dart';

//==================================================
// MAIN CLASS
//==================================================
class Ep791Page extends StatefulWidget {
  @override
  _Ep791PageState createState() => _Ep791PageState();
}

//==================================================
// STATE CLASS
//==================================================
class _Ep791PageState extends State<Ep791Page> {
//==================================================
// DECLARE VARIABLE **EP54**
//==================================================
String foodCategory='Food';   
//==================================================
// GET VALUE FROM GLOBAL VARIABLE (EP75)
//==================================================
String tableNo = globalAppData.tableNo;
String orderNo =  globalAppData.orderNo;
String customerName = 'Mr.Nine';
EP79MenuModel menuModel = EP79MenuModel();

//==================================================
// BUILD WIDGET
//==================================================
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
              Row(
                children: <Widget>[
                  Text('EP79-1: Make Order',style: TextStyle(fontSize: 16),),                 
                ],
              ),
              Text('$tableNo,Order#: $orderNo,  $customerName, Cat: $foodCategory',style: TextStyle(fontSize: 15),),
            ],
          ),
//==================================================
// ACTIONS/ICONBUTTON
//==================================================            
        actions: <Widget>[
          IconButton(icon: Icon(Icons.open_in_new), onPressed: (){
//==================================================
// EP79: OPEN TABLE ** STEP#1 **
//==================================================  
          EP79OrderService.openTableEP79(
            customerName: 'Mr.John EP79',
            noOfGuest: 4,
            tableNo: 'T0079',
            customerMobileNo: '0831341243'
          );

          })
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
// GET DATA FROM DATABASE: ** EP 79 ** STEP#2 
//==================================================             
        stream: EP79MenuModel.getMenusByCategory(menuCategoryValue:  foodCategory),        
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
                  menuModel: EP79MenuModel.fromFireStore(snapshot.data.documents[index]),            
//==================================================
// EP51 (INKWELL-STEP#5)
//==================================================                   
                    onTap: () {
                      // Navigator.push(context,MaterialPageRoute(builder: (context) => Ep531BPage(menuId: snapshot.data.documents[index].documentID)),);
                    },
                    );
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

    ), 
         
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
// DECLARE VARIABLE: EP79
//==================================================
final EP79MenuModel menuModel;
//==================================================
// EP51 (INKWELL-STEP#1)
//================================================== 
final VoidCallback onTap;

//==================================================
// CONSTRUCTURE
//==================================================    
  const FoodMenuWidget({
//==================================================
// EP79 
//==================================================     
  this.menuModel,
  this.onTap,


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
                    menuModel.imageUrl??'')),
              ),
//==================================================
// ROW#2
//==================================================             
              Expanded(child: 
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${menuModel.menuNameEng} (${(menuModel.price.toString())}B)',maxLines: 2,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('${menuModel.menuDescriptionEng}',maxLines: 2,)
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
                    
                    }, child: Text('Order'),)
                ],
              ),
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