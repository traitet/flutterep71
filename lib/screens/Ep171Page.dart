import 'package:flutter/material.dart';
import 'package:flutterep11/models/CardModel.dart';
import '../widgets/CardImageWidget.dart';

//=======================================================
// MAIN CLASS
//=======================================================
class Ep171Page extends StatefulWidget {
  @override
  _Ep171PageState createState() => _Ep171PageState();
}

//=======================================================
// STATE CLASS
//=======================================================
class _Ep171PageState extends State<Ep171Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ep17 - ListView builder / hori'),),
      body: Container(
        height: 200,
        child: ListViewHoriWidget(listCardModel: _listCardModel ,),
      ),
 
      
    );
  }
}


//=======================================================
// LIST VIEW CLASS
//=======================================================
class ListViewHoriWidget extends StatelessWidget {
//=======================================================
// DECLARE VARIABLE = PROPERTY
//=======================================================  
  final List<CardModel> listCardModel; 
//=======================================================
// CONSTRUCTURE
//=======================================================  
  const ListViewHoriWidget({
    this.listCardModel,
    Key key,
  }) : super(key: key);
//=======================================================
// BUILD WIDGET
//=======================================================
  @override
  Widget build(BuildContext context) {
    return 
//=======================================================
// LIST VIEW BUILDER (1) SCROLLDIRECTION (2) COUNT (3) ITEMBUILD
//=======================================================    
      ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listCardModel.length,
        itemBuilder: (BuildContext context, int index){
          return CardImageWidget(title: listCardModel[index].title,subTitle: listCardModel[index].subTitle,imagePath: listCardModel[index].imagePath);
        },

      );

//     ListView(          
//       scrollDirection: Axis.horizontal,
//       children: <Widget>[
// //=======================================================
// // CARD
// //=======================================================        
//       CardImageWidget(title: 'Bangkok',subTitle: 'Nice City',imagePath: 'assets/images/pic1.jpg',),
//       CardImageWidget(title: 'London',subTitle: 'Nice Place',imagePath: 'assets/images/pic2.jpg',),
//       CardImageWidget(title: 'Rome',subTitle: 'Lovely Hotel',imagePath: 'assets/images/pic3.jpg',),                    
     
//     ],);
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

];

