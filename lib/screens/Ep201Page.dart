import 'package:flutter/material.dart';

class Ep201Page extends StatefulWidget {
  @override
  _Ep201PageState createState() => _Ep201PageState();
}

//======================================================================
// STATECLASS
//======================================================================
class _Ep201PageState extends State<Ep201Page> {
  String _outputText = '';
  @override
  Widget build(BuildContext context) {
//======================================================================
// MATERIALAPP
//======================================================================    
    return MaterialApp(
//======================================================================
// THEME
//======================================================================  
      // debugShowCheckedModeBanner: false,    
      theme: ThemeData(primarySwatch: Theme.of(context).primaryColor),
      home: Scaffold(
        appBar: AppBar(
//======================================================================
// BACK BUTTON
//======================================================================          
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){Navigator.pop(context);}),
          title: Text('EP20-1 Basic Button, Material App 1'),),
        body: ListView(children: <Widget>[
//======================================================================
// TEXT
//======================================================================
            Text('Test EP20-1: Output Text: ' + _outputText, style: TextStyle(fontSize: 20),),
//======================================================================
// ICON BUTTON
//======================================================================
            Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.rate_review), onPressed: (){setState(() {_outputText = 'Click Icon Button';});}),    
                Text('This is IconButton', style: TextStyle(fontSize: 20),),                            
              ],
            ),
//======================================================================
// RAISED BUTTON
//======================================================================
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                color: Colors.blue,child: Text('Raised Button in ButtonBar',
                style: TextStyle(color: Colors.white)),
                onPressed: (){setState(() {_outputText = 'Click Raised Button';});}),
            ),     
//======================================================================
// FLAT BUTTON
//======================================================================                             
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(color: Colors.yellow,child: Text('Flat Button in ButtonBar'),onPressed: (){setState(() {_outputText = 'Click Flat Button';});}),
            ),     

//======================================================================
// BUTTON BAR
//======================================================================   
            ButtonBar(
              children: <Widget>[
              FlatButton(color: Colors.yellow,child: Text('Flat Button'),onPressed: (){setState(() {_outputText = 'Click Flat Button';});}),
              RaisedButton(color: Colors.blue,child: Text('Raised Button'),onPressed: (){setState(() {_outputText = 'Click Raised Button';});}),
              Text('This is Text in ButtonBar'),    

            ],),
//======================================================================
// INKWELL
//======================================================================    
            InkWell(
              onTap: (){setState(() {_outputText = 'Click InkWell';});},
              child: Container(
                height: 250,
                color: Colors.pink,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/pic1.jpg'),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('This is InkWell',style: TextStyle(color: Colors.white,fontSize: 20)),
                  )
              ],),),
            ) ,
            FloatingActionButton(
              child: Text('Click'),
              onPressed: (){setState(() {_outputText = 'Already clicked floating button';});},
            ),      
     
//======================================================================
// END WIDGET
//======================================================================  
        ],) ,
      )
      
    );
  }
}