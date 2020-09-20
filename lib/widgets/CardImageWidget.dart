import 'package:flutter/material.dart';


//=======================================================
// CLASS
//=======================================================
class CardImageWidget extends StatelessWidget {
//=======================================================
// PROPERTY
//=======================================================  
  final String title;
  final String subTitle;
  final String imagePath;
//=======================================================
// CONSTRUCTURE
//=======================================================  
  const CardImageWidget({
    this.title,
    this.subTitle,
    this.imagePath,
    Key key,
  }) : super(key: key);
//=======================================================
// BUILD WIDGET
//=======================================================
  @override
  Widget build(BuildContext context) {
    return Card(child: Column(children: <Widget>[
      Image(
        height: 150,
        width: 200,
        image: AssetImage(imagePath),),
      Text(title),
      Text(subTitle)
    ],),);
  }
}