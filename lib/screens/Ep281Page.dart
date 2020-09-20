import 'package:flutter/material.dart';

class Ep281Page extends StatefulWidget {
  @override
  _Ep281PageState createState() => _Ep281PageState();
}

class _Ep281PageState extends State<Ep281Page> {
  final TextEditingController menuIdController = TextEditingController()..text = 'M0001';
  final TextEditingController menuNameEngController = TextEditingController()..text = 'Fried Rice';
  final TextEditingController menuNameThaiController = TextEditingController()..text = 'ข้าวผัดหมู';
  final TextEditingController menuDescriptionEngController = TextEditingController()..text = 'Fried Rice. Awesome';
  final TextEditingController menuDescriptionThaiController = TextEditingController()..text = 'ข้าวผัดหมู อร่อยมาก ๆ';    
  final TextEditingController priceController = TextEditingController()..text = '100';         
  final TextEditingController remarkController = TextEditingController()..text = 'Good for forigeners';   
  final TextEditingController ratingController = TextEditingController()..text = '3';
  final TextEditingController spicyLevelController = TextEditingController()..text = '1';   
  String menuCategoryValue = 'Food';       
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('EP28-1: Maintain Menu'),
//===================================================
// ACTION
//===================================================      
        actions: <Widget>[
          IconButton(icon: Icon(Icons.photo_camera), onPressed: (){}),
          IconButton(icon: Icon(Icons.add), onPressed: (){}),          
        ],
      ),
//===================================================
// BODY
//===================================================
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: <Widget>[
//===================================================
// UPLOAD IMAGE
//===================================================          
          RaisedButton(onPressed: (){}, child: Text('Click to upload photo',style: TextStyle(color: Colors.white),), color: Colors.blue,),   
          Image(
            height: 150,
            width: 150,
            image: AssetImage('assets/images/pic1.jpg'),)  ,        

//===================================================
// TEXT FORM FIELD
//===================================================                       
          TextFormField(controller: menuIdController,autovalidate: true,decoration: InputDecoration(labelText: 'Menu ID',hintText: 'Menu ID 20 digits'),),
//===================================================
// MENU CATEGORY (DROPDOWN)
//===================================================
          DropdownButton<String>(
            value: menuCategoryValue,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 18,
            underline: Container(height: 2, color: Colors.blue,),
            style: TextStyle(color: Colors.red, fontSize: 20),
            items: <String> ['Food','Drinks','Dessert','Set Menu'].map<DropdownMenuItem<String>>((String value){
              return DropdownMenuItem<String>(child: Text(value),value: value);
            }).toList(),
            onChanged: (String newValue){menuCategoryValue = newValue;}),    
//===================================================
// TEXT FORM FIELD
//===================================================                   
          TextFormField(validator: (String value){if (value.isEmpty)  {return 'Please fill data';}else return null;},controller: menuNameEngController,autovalidate: true,decoration: InputDecoration(labelText: 'Menu Name Eng',hintText: 'Menu Name Eng 20 digits'),),
          TextFormField(controller: menuNameThaiController,autovalidate: true,decoration: InputDecoration(labelText: 'Menu Name Thai',hintText: 'Menu Name Thai 20 digits'),),
          TextFormField(validator: (String value){if (value.isEmpty)  {return 'Please fill data';}else if (value.length > 20)  {return 'Please fill equal or less than 20 digits';}
            else return null;},controller: menuDescriptionEngController,autovalidate: true,decoration: InputDecoration(labelText: 'Menu Desc Eng',hintText: 'Menu Description Eng 20 digits'),),
          TextFormField(validator: (String value){if (value.isEmpty)  {return 'Please fill data';}else if (value.length > 20)  {return 'Please fill equal or less than 20 digits';}
            else return null;},controller: menuDescriptionThaiController,autovalidate: true,decoration: InputDecoration(labelText: 'Menu Desc Thai',hintText: 'Menu Description Thai 20 digits'),),
          TextFormField(keyboardType: TextInputType.number,controller: priceController,autovalidate: true,decoration: InputDecoration(labelText: ' Price',hintText: 'Price 2 digits'),),       
          TextFormField(keyboardType: TextInputType.number,controller: spicyLevelController,autovalidate: true,decoration: InputDecoration(labelText: ' Spicy Level',hintText: 'Spicy Level'),), 
          TextFormField(keyboardType: TextInputType.number,controller: ratingController,autovalidate: true,decoration: InputDecoration(labelText: ' Rating',hintText: 'Rating'),),           
          TextFormField(controller: remarkController,autovalidate: true,decoration: InputDecoration(labelText: ' Remark',hintText: 'Remark',),maxLines: 5,minLines: 2,),
//===================================================
// BUTTON
//===================================================          
          RaisedButton(onPressed: (){}, child: Text('Save',style: TextStyle(color: Colors.white),), color: Colors.blue,),   
                                                             
        ],),
      ),
      
    );
  }
}