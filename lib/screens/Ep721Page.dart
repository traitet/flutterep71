//================================================
// IMPORT
//================================================  
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//================================================
// MAIN CLASS
//================================================  
class Ep721Page extends StatefulWidget {
  @override
  _Ep721PageState createState() => _Ep721PageState();
}

//================================================
// STATE CLASS
//================================================  
class _Ep721PageState extends State<Ep721Page> {
//================================================
// DECLARE VARAIBLE (SCAN RESULT: FOR EP72)
//================================================   
  ScanResult _scanResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP711: Code UI Open Table Home'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,        
        children: <Widget>[        
//================================================
// COLUMN#1 (EDITED EP72)
//================================================        
        Expanded(flex: 3,child: Transform.rotate(
          angle: -0.5,
          child: Container(
            alignment: Alignment.center,
            //color: Colors.yellow,
            // alignment: FractionalOffset.bottomLeft,
            // padding: EdgeInsets.only(bottom: 50),
            // transform: Matrix4.rotationZ(-0.6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('See Food ', style: TextStyle(fontSize: 40),),
                Text('No.1 Street Food', style: TextStyle(fontSize: 40),),                
              ],
            )),
        )), 
//================================================
// EP72: TEXT
//================================================
    //if (_scanResult != null) Text('Scan Result: ${_scanResult.rawContent??''}'),          
    _scanResult != null ? Text('Scan Result: ${_scanResult.rawContent??''}'):Text('Scan Result: '), 
//================================================
// EP72: NEXT STEP: READ TABLE NO -> FIND TABLE 
// (1) FREE: OPEN TABLE
// (2) BUY: FILL PASS CODE
//================================================             
//================================================
// COLUMN#2
//================================================ 
        Expanded(flex: 1,child: 
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            color: Colors.green,onPressed: (){
//================================================
// EP72: CALL FUNCTION SCAN QR
//================================================               
              fnScan();
            }, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Scan QR', style: TextStyle(fontSize: 60,color: Colors.white)),
            ),),
        )),
//================================================
// COLUMN#3
//================================================   
        Expanded(flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: <Widget>[
//================================================
// COLUMN#3, ROW#1
//================================================                
              Expanded(child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                color: Colors.deepOrange,onPressed: (){},child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Sign-in', style: TextStyle(fontSize: 30,color: Colors.white)),
              ),)),
//================================================
// COLUMN#3, ROW#2
//================================================                  
              SizedBox(width: 10,),
//================================================
// COLUMN#3, ROW#3
//================================================                  
              Expanded(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),                  
                  color: Colors.blue,onPressed: (){},child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Sign-up', style: TextStyle(fontSize: 30,color: Colors.white)),
              ),)),                  
            ],),
          ),
        )          
      ],),
      
    );
  }

//================================================
// FUNCTION
//================================================ 
Future fnScan() async {
//================================================
// TRY
//================================================   
    try {
//================================================
// GET RESULT
//================================================       
      var result = await BarcodeScanner.scan();
//================================================
// SET STATE
//================================================ 
      setState(() => _scanResult = result);
    } 
//================================================
// CATCH ERROR
//================================================     
    on PlatformException catch (e) {
      var result = ScanResult(
        type: ResultType.Error,
        format: BarcodeFormat.unknown,
    );    
//================================================
// ERROR: CAMERA DEDIED
//================================================ 
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result.rawContent = 'The user did not grant the camera permission!';
        });
//================================================
// ERROR: OTHER
//================================================         
      } else {result.rawContent = 'Unknown error: $e';}
//================================================
// RETURN ERROR
//================================================       
      setState(() {_scanResult = result;});
    }
  }




} // END CLASS