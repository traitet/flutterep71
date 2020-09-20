import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Ep12BasicWidgetPage extends StatefulWidget {
  @override
  _Ep12BasicWidgetPageState createState() => _Ep12BasicWidgetPageState();
}


class _Ep12BasicWidgetPageState extends State<Ep12BasicWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text('Basic Widget EP11'),),
      body: 
      ListView(
        
        // scrollDirection: Axis.vertical,
        children: <Widget>[
          ListViewItemWidget(),
          ListViewItemWidget(),     
          ListViewItemWidget(),
          ListViewItemWidget(),                         

                


      ],) 
      
      // Center(child: Text('Test 11')),
      
    );
  }
}

//=================================================================
// CLASS ListViewItemWidget
//=================================================================   
class ListViewItemWidget extends StatelessWidget {
  const ListViewItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.yellow,
      width: 100,
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
//=================================================================
// ROW
//=================================================================              
        child: Row(
          children: <Widget>[
            Container(
//=================================================================
// IMAGE (ROW 1)
//=================================================================                     
              // height: 150,
              // width: 150,
              child: Image.network('https://www.planetware.com/photos-tiles/thailand-bangkok-city-view-at-night.jpg')),
//=================================================================
// COLUMN : TEXTS (ROW2)
//=================================================================                     
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('London', style: TextStyle(color: Colors.pink, fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Go to many places and enjoy London bridge and London Eye',maxLines: 2,),
                )
              ],
            )),
//=================================================================
// TEXT PRICE (ROW 3)
//=================================================================                   
            Text('500 Baht', style: TextStyle(color: Colors.pink, fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}