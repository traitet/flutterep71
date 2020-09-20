import 'package:flutter/material.dart';

class Ep13Page extends StatefulWidget {
  @override
  _Ep13PageState createState() => _Ep13PageState();
}

class _Ep13PageState extends State<Ep13Page> {
  @override
  Widget build(BuildContext context) {
//=============================================================================
// SCAFFOLD
//=============================================================================    
    return Scaffold(
//=============================================================================
// APPBAR
//=============================================================================        
      appBar: AppBar(title: Text('EP13 - basic Widget'),),
//=============================================================================
// BODY
//=============================================================================        
      body:
//=============================================================================
// IMAGE
//=============================================================================        
       // Image(height: 100,width: 150,image: AssetImage('assets/images/pic3.jpg')) 
        //Text('test ep13')
        Column(
          
//=============================================================================
// LISTVIEW: HORIZONTAL
//=============================================================================             
          children: <Widget>[
            Text('ListTile'), 
//=============================================================================
// LISTTILE
//=============================================================================              
            ListTile(trailing: Icon(Icons.airline_seat_recline_normal),title: Text('Travelling Places'),),
            ListTile(trailing: Icon(Icons.restaurant),title: Text('Restaurant'),),     
            ListTile(trailing: Icon(Icons.people),title: Text('About'),),   
//=============================================================================
// LINE
//=============================================================================               
            Container(color: Colors.black,height: 2,),
            Text('ListView - Horizaltal'),              
//=============================================================================
// LISTVIEW - HORIZONTAL
//=============================================================================                        
            Container(
             // color: Colors.yellow,
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[

// //=============================================================================
// // IMAGE
// //=============================================================================  
//             Image(height: 100,width: 150,image: AssetImage('assets/images/pic3.jpg')) ,
//=============================================================================
// CARD
//=============================================================================  
                CardWidget(imageAsset: 'assets/images/pic1.jpg',text: 'Phuket',description: 'See nice view',),
                CardWidget(imageAsset: 'assets/images/pic2.jpg',text: 'Bangkok',description: 'See nice view',),
                CardWidget(imageAsset: 'assets/images/pic3.jpg',text: 'Chiangmai',description: 'See nice Mountain',),              
                CardWidget(imageAsset: 'assets/images/pic1.jpg',text: 'Phuket',description: 'See nice view',),
                CardWidget(imageAsset: 'assets/images/pic2.jpg',text: 'Bangkok',description: 'See nice view',),
                CardWidget(imageAsset: 'assets/images/pic3.jpg',text: 'Chiangmai',description: 'See nice Mountain',),           


                ],
              ),
            ),
//=============================================================================
// LINE
//=============================================================================               
            Container(color: Colors.black,height: 2,),     
            Text('ListView - Vetical'),  
//=============================================================================
// LISTVIEW: VETICAL
//=============================================================================  
            Expanded(
              child: Container(
               // color: Colors.yellow,
               // height: 120,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
// //=============================================================================
// // LISTTILE
// //=============================================================================              
//             ListTile(trailing: Icon(Icons.airline_seat_recline_normal),title: Text('Travelling Places'),),
//             ListTile(trailing: Icon(Icons.restaurant),title: Text('Restaurant'),),     
//             ListTile(trailing: Icon(Icons.people),title: Text('About'),),  
// //=============================================================================
// // IMAGE
// //=============================================================================  
//             Image(height: 100,width: 150,image: AssetImage('assets/images/pic3.jpg')) ,
//=============================================================================
// CARD
//=============================================================================  
                  CardWidget(imageAsset: 'assets/images/pic1.jpg',text: 'Phuket',description: 'See nice view',),
                  CardWidget(imageAsset: 'assets/images/pic2.jpg',text: 'Bangkok',description: 'See nice view',),
                  CardWidget(imageAsset: 'assets/images/pic3.jpg',text: 'Chiangmai',description: 'See nice Mountain',),              
                  CardWidget(imageAsset: 'assets/images/pic1.jpg',text: 'Phuket',description: 'See nice view',),
                  CardWidget(imageAsset: 'assets/images/pic2.jpg',text: 'Bangkok',description: 'See nice view',),
                  CardWidget(imageAsset: 'assets/images/pic3.jpg',text: 'Chiangmai',description: 'See nice Mountain',),           


                  ],
                ),
              ),
            ),               
          ],
        )
        
    );
  }
}

//=============================================================================
// CARD WIDGET
//=============================================================================  
class CardWidget extends StatelessWidget {
//=============================================================================
// DECLARE VARIABLE
//=============================================================================    
  final String imageAsset;
  final String text;
  final String description;
//=============================================================================
// CONSTRUCTURE
//=============================================================================  
  CardWidget({
    this.imageAsset,this.description,this.text,
    Key key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
         mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,             
        children: <Widget>[
          Image(height: 100,width: 150,image: AssetImage(imageAsset)),
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,                
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(text, style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(description),
              ),   
            ],
          ),
             
        ],
      ) ,
    );
  }
}