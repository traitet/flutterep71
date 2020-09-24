import 'package:flutter/material.dart';
import '../screens/Ep761BPage.dart';
import '../models/Ep76OrderModel.dart';

//===========================================
// MAIN CLASS
//===========================================  

class Ep761APage extends StatefulWidget {
  @override
  _Ep761APageState createState() => _Ep761APageState();
}

class _Ep761APageState extends State<Ep761APage> {
//===========================================
// DECLARE VARIABLE
//=========================================== 
TextEditingController _nameController =   TextEditingController()..text = 'John';
TextEditingController _mobileNoController =   TextEditingController()..text = '0851234144';
TextEditingController _noOfGuestController =   TextEditingController()..text = '4';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP76-1A: Code Logic: Save Fill Customer Info'),),
      body: Column(children: <Widget>[
//===========================================
// COLUMN#1: TEXT FORM FIELD (NAME)
//===========================================  
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                hintText: 'Fill Name',
            ),),
          ),
//===========================================
// COLUMN#1: TEXT FORM FIELD (MOBILE NO)
//===========================================
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _mobileNoController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Mobile No',
                hintText: 'Fill Mobile No',
            ),),
          ),   
//===========================================
// COLUMN#1: TEXT FORM FIELD (NO GUESTS)
//===========================================
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _noOfGuestController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'No of Guests',
                hintText: 'Fill Guests',
            ),),
          ),     
//===========================================
// COLUMN#4: RAISED BUTTON
//===========================================
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(8),
          child: RaisedButton(
            onPressed: (){
//===========================================
// EP75: OPENTABLE
//===========================================
            fnOpenTable();

            },
            color: Colors.green,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Next',style: TextStyle(fontSize: 40,color: Colors.white,)),
            ),
          ),
        )

//===========================================
// NEXT COLUMN
//===========================================
      ],),
    );
  }

//===========================================
// EP75: OPENTABLE
//===========================================
fnOpenTable(){
  OrderService.openTable(
    customerMobileNo: _mobileNoController.text,
    noOfGuest: int.parse(_noOfGuestController.text),
    tableNo: 'T0020',
    customerName: _nameController.text
  );
//===========================================
// EP76: REDIRECT
//===========================================  
    Navigator.push(context,MaterialPageRoute(builder: (context) => Ep761BPage()),);

}


}