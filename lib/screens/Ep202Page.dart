import 'package:flutter/material.dart';

class Ep202Page extends StatefulWidget {
  @override
  _Ep202PageState createState() => _Ep202PageState();
}

//====================================================
// STATE CLASS
//====================================================
class _Ep202PageState extends State<Ep202Page> {
//====================================================
// DECLARE VARAIBLE
//====================================================   
  String _output = '';
  String _dropdownValue = 'One';   //for dropdown button
//====================================================
// VARIABLE FOR PopupMenuButton
//====================================================     
  Choice _selectedChoice = choices[0];
//====================================================
// FUNCTION FOR PopupMenuButton
//====================================================     
  void _select(Choice choice) {
    setState(() {_selectedChoice = choice;});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//====================================================
// ACTION: ICONBUTTON IN APPBAR
//====================================================        
        actions: <Widget>[
//====================================================
// ICON BUTTON
//====================================================             
          IconButton(icon: Icon(Icons.save), onPressed: (){setState(() {_output = 'Click Save';});}),
          IconButton(icon: Icon(Icons.search), onPressed: (){setState(() {_output = 'Click Search';});}),      
//====================================================
// POPUP MENU BUTTON: ref https://flutter.dev/docs/catalog/samples/basic-app-bar
//==================================================== 
        PopupMenuButton(
          onSelected: _select,
          itemBuilder:(BuildContext context){
          return choices.map((Choice choice) {
            return PopupMenuItem<Choice>(
              value: choice,
              child: Text(choice.title));
          }).toList();

        })
        ],
        title: Text('EP20-2 Adv Button'),),
        body: 

        ListView(children: <Widget>[
//====================================================
// OUTLINE BUTTON
//====================================================        
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlineButton(onPressed: (){setState(() {_output = 'Click Outline Button#1';});},
          child: Text('Outline Button#1'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlineButton(onPressed: (){setState(() {_output = 'Click Outline Button#2';});},
          child: Text('Outline Button#2'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),),
        ), 
//====================================================
// DROPDOWN BUTTON: https://api.flutter.dev/flutter/material/DropdownButton-class.html
//====================================================
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Dropdown Button',style: TextStyle(color: Colors.red,fontSize: 20)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<String>(
          onChanged: (String newValue){setState(() {
            _dropdownValue = newValue;
          });},
          value: _dropdownValue,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 18,
          underline: Container(height: 2,color: Colors.deepPurpleAccent,),        
          style: TextStyle(color: Colors.red,fontSize: 20),
          items: <String>['One','Two','Three'].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(child: Text(value),value: value);
          }).toList() ,
        ),
      ),

//====================================================
// TEXT: DOWNDOWN BUTTON VALUE
//====================================================        
      Text("Dropdown Button Value: $_dropdownValue"),
//====================================================
// TEXT: OUTPUT AFTER CLICK OUTLINE BUTTON, ICON BUTTON
//====================================================
      Container(
        color: Colors.black12,
        alignment: Alignment.center,
        height: 150,
        child: Text('Output: ' + _output)),    
//====================================================
// SHOW TEXT & ICON SELECTED FROM POPUP MENU
//==================================================== 
      SizedBox(height: 20,),        
      Center(child: Text('You select PopupMenuButton :'+_selectedChoice.title)),   
      Icon(_selectedChoice.icon,size: 120,)
//====================================================
// END WIDGET OF LISTVIEW
//====================================================                           
        ],),


      
    );
  }
}

//====================================================
// CLASS CHOICE
//====================================================
class Choice{
  final String title;
  final IconData icon;
  Choice({this.title,this.icon});
}

//====================================================
// DECLARE VARIABLE AND ASSIGN VALUE TO CHIICE
//====================================================
List<Choice> choices  = <Choice> [
  Choice(title: 'Car',icon: Icons.directions_car),
  Choice(title: 'Bicycle',icon: Icons.directions_bike),
  Choice(title: 'Boat',icon: Icons.directions_boat),  
];