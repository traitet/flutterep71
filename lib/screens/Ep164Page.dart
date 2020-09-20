//=============================================================
// IMPORT
//=============================================================  
import 'package:flutter/material.dart';
import '../screens/Ep12BasicWidgetPage.dart';
import '../screens/Ep13Page.dart';
import '../screens/Ep14Page.dart';


//=============================================================
// MAIN CLASS
//=============================================================  
class Ep164Page extends StatefulWidget {
  @override
  _Ep164PageState createState() => _Ep164PageState();
}

//=============================================================
// STATE CLASS
//=============================================================  
class _Ep164PageState extends State<Ep164Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//=============================================================
// APP BAR
//=============================================================        
      appBar: AppBar(title: Text('EP16-4 - Gridview and Card for Nav'),),
//=============================================================
// BODY
//=============================================================        
      body: Container(
        color: Colors.black12,
        child: 
//=============================================================
// GRID VIEW
//=============================================================        
        GridView.count(crossAxisCount: 2,
        children: <Widget>[
          buildCard('Bangkok','Grand Palance','assets/images/pic1.jpg',MaterialPageRoute(builder: (context) => Ep12BasicWidgetPage())),
          buildCard('EP12','Basic Widget#1','assets/images/pic2.jpg',MaterialPageRoute(builder: (context) => Ep12BasicWidgetPage())),
          buildCard('EP13','Basic Widget#2','assets/images/pic3.jpg',MaterialPageRoute(builder: (context) => Ep13Page())),
          buildCard('EP14','Snackbar and Dialog','assets/images/pic1.jpg',MaterialPageRoute(builder: (context) => Ep14Page())),                            
          buildCard('Bangkok','Grand Palance','assets/images/pic1.jpg',MaterialPageRoute(builder: (context) => Ep12BasicWidgetPage())),
          buildCard('EP12','Basic Widget#1','assets/images/pic2.jpg',MaterialPageRoute(builder: (context) => Ep12BasicWidgetPage())),
          buildCard('EP13','Basic Widget#2','assets/images/pic3.jpg',MaterialPageRoute(builder: (context) => Ep13Page())),
          buildCard('EP14','Snackbar and Dialog','assets/images/pic1.jpg',MaterialPageRoute(builder: (context) => Ep14Page())),   
          buildCard('Bangkok','Grand Palance','assets/images/pic1.jpg',MaterialPageRoute(builder: (context) => Ep12BasicWidgetPage())),
          buildCard('EP12','Basic Widget#1','assets/images/pic2.jpg',MaterialPageRoute(builder: (context) => Ep12BasicWidgetPage())),
          buildCard('EP13','Basic Widget#2','assets/images/pic3.jpg',MaterialPageRoute(builder: (context) => Ep13Page())),
          buildCard('EP14','Snackbar and Dialog','assets/images/pic1.jpg',MaterialPageRoute(builder: (context) => Ep14Page())),                                   
        ],
        
        ),
      ),
      
    );
  }

//=============================================================
// BUILD CARD
//=============================================================   
  InkWell buildCard(String title, String subTitle, String imageStr, MaterialPageRoute route) {
//=============================================================
// RETURN INKWELL ( CHANGE TO BUTTON -> CAN ONTAP)
//=============================================================     
    return InkWell(
//=============================================================
// ONTAB EVENT
//=============================================================       
      onTap: (){Navigator.push(context, route);},
//=============================================================
// BUILD CARD
//=============================================================       
      child: Card(
            child: Column(children: <Widget>[
              Image(
                fit: BoxFit.fill,
                height: 150,
                width: double.infinity,
                image: AssetImage(imageStr)),
              Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.deepOrange)),
              Text(subTitle,style: TextStyle(fontSize: 10)),
            ],),
          ),
    );
  }
}