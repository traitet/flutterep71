import 'package:flutter/material.dart';

class Ep271Page extends StatefulWidget {
  @override
  _Ep271PageState createState() => _Ep271PageState();
}

class _Ep271PageState extends State<Ep271Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//===========================================================
// APP BAR
//===========================================================      
      appBar: AppBar(
        title: Text('EP27-1: View Order'),
        actions: <Widget>[
//===========================================================
// ICON BUTTON
//===========================================================             
          IconButton(icon: Icon(Icons.shopping_cart,),onPressed: (){},)
        ],
      
      ),
      body: Column(children: <Widget>[
//===========================================================
// COLUMN#1: LISTVIEW
//===========================================================          
        Expanded(
          child: Container(
            height: 100,
            color: Colors.black12,
            child: buildListViewColumn1(),
          ),
        ),
//===========================================================
// COLUMN#2: PRICE SUMMARY
//===========================================================  
          buildContainerColumn2(),
//===========================================================
// COLUMN#3: RAISED BUTTON
//===========================================================
          buildContainerColumn3()          
      ],),
      
    );
  }

//===========================================================
// COLUMN#2: PRICE SUMMARY
//=========================================================== 
  Container buildContainerColumn2() {
    return Container(height: 60,color: Colors.white,
          child: Row(children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Price: \100'),
                    Text('Discount: \$20'),                  
                    Text('Total Price: \$80'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(color: Colors.blue,onPressed: (){},child: Text('Payment',style: TextStyle(color: Colors.white)),),
            )
          ],),
        );
  }

//===========================================================
// COLUMN#3: RAISED BUTTON
//===========================================================
  Container buildContainerColumn3() {
    return Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: RaisedButton(color: Colors.green,onPressed: (){},child: Text('Make Order',style: TextStyle(color: Colors.white)),),
          ));
  }

//===========================================================
// LISTVIEW IN COLUMN#1
//===========================================================
  ListView buildListViewColumn1() {
    return ListView(children: <Widget>[
      buildCard(100,imageStr:'assets/images/pic1.jpg', menuStr: 'Pork Fried Rice'),
      buildCard(150,imageStr:'assets/images/pic2.jpg', menuStr: 'Green Curry'),
      buildCard(100,imageStr:'assets/images/pic3.jpg', menuStr: 'Red Curry'),
      buildCard(100,imageStr:'assets/images/pic1.jpg', menuStr: 'Stir-Fried Chicken'),
      buildCard(100,imageStr:'assets/images/pic2.jpg', menuStr: 'Stir-Fried Chicken'),
      buildCard(100,imageStr:'assets/images/pic3.jpg', menuStr: 'Stir-Fried Chicken'),
      buildCard(100,imageStr:'assets/images/pic1.jpg', menuStr: 'Stir-Fried Chicken'),
      buildCard(100,imageStr:'assets/images/pic2.jpg', menuStr: 'Stir-Fried Chicken'),                     
          ],);
  }

//===========================================================
// CARD IN LISTVIEW
//===========================================================
  Card buildCard(double price, {String imageStr,String menuStr}) {
    return Card(child: Container(
      height: 90,
      color: Colors.lightBlue[200],
      child: Column(
        
        children: <Widget>[
//===========================================================
// COLUMN#1
//===========================================================            
          Row(children: <Widget>[
//===========================================================
// ROW#1
//===========================================================    
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                fit: BoxFit.fill,
                height: 60,
                width: 60,
                image: AssetImage(imageStr)),
            ),
//===========================================================
// ROW#2
//===========================================================   
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Text(menuStr + ' (ข้าวผัดหมู)',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),

//===========================================================
// ROW#2 (STATUS &)
//===========================================================                  
                Row(
                  children: <Widget>[
                    Expanded(child: 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('\$400',style: TextStyle(fontSize: 12)),
                          Text('Status: Ordering',style: TextStyle(fontSize: 12)),
                        ],
                      )),
                    Row(children: <Widget>[
                        IconButton(icon: Icon(Icons.add), onPressed: (){}),
                        Text('2'),
                        IconButton(icon: Icon(Icons.remove), onPressed: (){}),            
                      ],)                    
                  ],
                ),                        
              ],),
            ),
 
//===========================================================
// ROW#3
//===========================================================        
          ],),
//===========================================================
// COLUMN#2
//=========================================================== 
            Container(
              width: double.infinity,
              //color: Colors.yellow,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text('Remark: Not spicy',style: TextStyle(fontSize: 12),maxLines: 1,),
              )) ,          
        ],
      ),
    ),);
  }
}