
import 'package:flutter/material.dart';
import '../screens/Ep12BasicWidgetPage.dart';
import '../screens/Ep13Page.dart';
import '../screens/Ep14Page.dart';
import '../screens/NewPage.dart';


//===============================================================
// CLASS
//===============================================================      
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
//===============================================================
// DRAWER HEADER
//===============================================================           
      DrawerHeader(child: Text('Main Menu'), 
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/pic1.jpg')),
      ) ,
      
      ),
//===============================================================
// LISTTIME
//===============================================================
    ListTile(leading: Icon(Icons.copyright), title: Text('Main Menu'),onTap: () {},) ,          
    ListTile(leading: Icon(Icons.credit_card), title: Text('EP11'),onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => NewPage()),);},) ,      
    ListTile(leading: Icon(Icons.people), title: Text('EP12'),onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep12BasicWidgetPage()),);},) ,      
    ListTile(leading: Icon(Icons.stop), title: Text('EP13'),onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep13Page()),);},) ,      
    ListTile(leading: Icon(Icons.straighten), title: Text('EP14'),onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep14Page()),);},) ,                                 
    ],

    );
  }
}