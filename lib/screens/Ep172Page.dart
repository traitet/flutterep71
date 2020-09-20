//=============================================================
// IMPORT
//=============================================================  
import 'package:flutter/material.dart';
import 'package:flutterep11/models/CardModel.dart';
import '../screens/Ep12BasicWidgetPage.dart';


//=============================================================
// MAIN CLASS
//=============================================================  
class Ep172Page extends StatefulWidget {
  @override
  _Ep172PageState createState() => _Ep172PageState();
}

//=============================================================
// STATE CLASS
//=============================================================  
class _Ep172PageState extends State<Ep172Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//=============================================================
// APP BAR
//=============================================================        
      appBar: AppBar(title: Text('EP17-2 - GridviewBuilder'),),
//=============================================================
// BODY
//=============================================================        
      body: Container(
        color: Colors.black12,
        child: 
//=============================================================
// GRID VIEW BUILDER
//=============================================================
    GridView.builder(
      itemCount: _listCardModel.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
      itemBuilder: (BuildContext context, int index){
        return buildCard(_listCardModel[index].title, _listCardModel[index].subTitle,_listCardModel[index].imagePath, MaterialPageRoute(builder: (context) => Ep12BasicWidgetPage()) );
      }
      
      )           
//=============================================================
// GRID VIEW
//=============================================================        
        // GridView.count(crossAxisCount: 2,
        // children: <Widget>[
        //   buildCard('Bangkok','Grand Palance','assets/images/pic1.jpg',MaterialPageRoute(builder: (context) => Ep12BasicWidgetPage())),
        //   buildCard('EP12','Basic Widget#1','assets/images/pic2.jpg',MaterialPageRoute(builder: (context) => Ep12BasicWidgetPage())),
        //   buildCard('EP13','Basic Widget#2','assets/images/pic3.jpg',MaterialPageRoute(builder: (context) => Ep13Page())),
        //   buildCard('EP14','Snackbar and Dialog','assets/images/pic1.jpg',MaterialPageRoute(builder: (context) => Ep14Page())),                            
        //   buildCard('Bangkok','Grand Palance','assets/images/pic1.jpg',MaterialPageRoute(builder: (context) => Ep12BasicWidgetPage())),
        //   buildCard('EP12','Basic Widget#1','assets/images/pic2.jpg',MaterialPageRoute(builder: (context) => Ep12BasicWidgetPage())),
        //   buildCard('EP13','Basic Widget#2','assets/images/pic3.jpg',MaterialPageRoute(builder: (context) => Ep13Page())),
        //   buildCard('EP14','Snackbar and Dialog','assets/images/pic1.jpg',MaterialPageRoute(builder: (context) => Ep14Page())),   
        //   buildCard('Bangkok','Grand Palance','assets/images/pic1.jpg',MaterialPageRoute(builder: (context) => Ep12BasicWidgetPage())),
        //   buildCard('EP12','Basic Widget#1','assets/images/pic2.jpg',MaterialPageRoute(builder: (context) => Ep12BasicWidgetPage())),
        //   buildCard('EP13','Basic Widget#2','assets/images/pic3.jpg',MaterialPageRoute(builder: (context) => Ep13Page())),
        //   buildCard('EP14','Snackbar and Dialog','assets/images/pic1.jpg',MaterialPageRoute(builder: (context) => Ep14Page())),                                   
        // ],
        
        // ),
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



//=======================================================
// DECLARE CARD LIST VARIABLE
//======================================================= 
final List<CardModel> _listCardModel = [
          // CardModel(title: 'xx',subTitle: 'yy',imagePath: 'xx'),
          // CardModel(title: 'xx',subTitle: 'yy',imagePath: 'xx'),
          // CardModel(title: 'xx',subTitle: 'yy',imagePath: 'xx'),    
          CardModel(title: 'Bangkok',subTitle: 'Nice City',imagePath: 'assets/images/pic1.jpg',),
          CardModel(title: 'London',subTitle: 'Nice Place',imagePath: 'assets/images/pic2.jpg',),
          CardModel(title: 'Rome',subTitle: 'Lovely Hotel',imagePath: 'assets/images/pic3.jpg',),   
          CardModel(title: 'Bangkok',subTitle: 'Nice City',imagePath: 'assets/images/pic1.jpg',),
          CardModel(title: 'London',subTitle: 'Nice Place',imagePath: 'assets/images/pic2.jpg',),
          CardModel(title: 'Rome',subTitle: 'Lovely Hotel',imagePath: 'assets/images/pic3.jpg',),    
          CardModel(title: 'Bangkok',subTitle: 'Nice City',imagePath: 'assets/images/pic1.jpg',),
          CardModel(title: 'London',subTitle: 'Nice Place',imagePath: 'assets/images/pic2.jpg',),
          CardModel(title: 'Rome',subTitle: 'Lovely Hotel',imagePath: 'assets/images/pic3.jpg',),                               

];

