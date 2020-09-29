import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/Ep80MenuModel.dart';

//=====================================================
// MAIN CLASS
//=====================================================
class Ep801BPage extends StatefulWidget {
//=====================================================
// DECLARE VARIABLE
//=====================================================
final String menuId;

//=====================================================
// CONSTUCTURE
//===================================================== 
const Ep801BPage(
  {Key key, this.menuId}
): super (key: key);

//=====================================================
// OVERRIDE STATE
//=====================================================   
  @override
  _Ep801BPageState createState() => _Ep801BPageState();
}

//=====================================================
// STATE CLASS
//=====================================================
class _Ep801BPageState extends State<Ep801BPage> {
//=====================================================
// SNACKBAR STEP#1
//=====================================================  
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//=====================================================
// DECLARE LOCAL VARIABLE
//=====================================================
  final TextEditingController _menuNameEngController = TextEditingController()..text = '' ;  
  final TextEditingController _menuDescEngController = TextEditingController()..text = '' ;  
  int _qty = 1; 
  String _imageUrl = '';

//=====================================================
// EP60: INIT STATE
//=====================================================
  @override
  void initState(){
    super.initState();

//=====================================================
// EP80: CALL STATIC FUNCTION (GET MENU MODEL)
//=====================================================   
    EP80MenuModel.getMenuModel(menuId: widget.menuId).then((value) {
      setState(() {
          _imageUrl = value.imageUrl;
          _menuNameEngController.text =  value.menuNameEng; 
          _menuDescEngController.text =  value.menuDescriptionEng;  
      });
      print('Save completed');
    }).catchError((error){
      print('Error: $error');
    }).whenComplete(() {
      print('When completed');
    });
  }  
  @override
  Widget build(BuildContext context) {
//=====================================================
// RETURN 
//=====================================================    
    return Scaffold(
//=====================================================
// SNACKBAR STEP#2
//=====================================================   
      key: scaffoldKey,    
      appBar: AppBar(title: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('EP80-1 - A View Menu'),
//=====================================================
// EP60: GET PASSED PARAMETER FROM EP60-1 
//=====================================================     
            //Text(widget.documentId),        
            Text('Menu ID:' + widget.menuId??'Not Found Document ID'), //FIXED EP61
          ],
        ),),
      body: Column(
        children: <Widget>[
//=====================================================
// COLUMN#1: IMAGE / EP60: CONDITION IF(IMAGE = '') => Show Text(Image Loading..) , ELSE Show Image 
//=====================================================  
          _imageUrl==''?Text('Image Loading..'):  
          Container(
            padding: EdgeInsets.all(8),
            height: 300,
            // width: double.infinity,
            child: Image(
              fit: BoxFit.fill,
//=====================================================
// EP60: SHOW IMAGE FROM URL
//=====================================================                  
              image: NetworkImage(_imageUrl)),
          ),
//=====================================================
// COLUMN#2 TEXT 
//=====================================================    
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: 
                      _menuNameEngController.text!=''?Text(_menuNameEngController.text,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)):Text('Loading..'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(_menuDescEngController.text,style: TextStyle(fontSize: 15,),maxLines: 5,),
                  ),
                ],),
              ),
//=====================================================
// ROW#2
//=====================================================
              Row(children: <Widget>[
                IconButton(icon: Icon(Icons.arrow_drop_down,size: 50,), onPressed: (){
//=====================================================
// EP60: REDUCE QTY (MIN=1)
//=====================================================
                setState(() {
                  if(_qty!=0){_qty = _qty - 1;}
                });

                }),
//=====================================================
// EP60: GET QTY VARIABLE 
//=====================================================                
                Text(_qty.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),           
                IconButton(icon: Icon(Icons.arrow_drop_up,size: 50,), onPressed: (){
//=====================================================
// EP60: ADD QTY (MAX=9)
//=====================================================
                setState(() {
                  if(_qty!=9){_qty = _qty + 1;}
                });

                }),          
              ],)              
            ],),
          ),
//=====================================================
// COLUMN#3 BUTTON 
//===================================================== 
            Container(height: 20,),
            Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              child: RaisedButton(
                color: Colors.blue,
                onPressed: (){
//=====================================================
// EP622: UPDATE QTY
//===================================================== 
        Firestore.instance.collection('TT_ORDERS').document(widget.menuId).updateData({'qty': _qty}).then((value) {
          print('SAVE COMPLETED'); 
//=====================================================
// EP622: SNACKBAR STEP#3: SHOW SNACKBAR (OK)
//===================================================== 
          scaffoldKey.currentState.showSnackBar(SnackBar(backgroundColor: Colors.green,content: Text('Update Order Item ${widget.menuId} Completed'),));                    
        })
        .catchError((error){
          print('UPDATE ERROR: $error');  
//=====================================================
// EP622: SNACKBAR STEP#3.2: SHOW SNACKBAR (ERROR)
//===================================================== 
          scaffoldKey.currentState.showSnackBar(SnackBar(backgroundColor: Colors.red,content: Text('Update Error: $error'),));                    
        }).whenComplete(() {
          print('UPDATE COMPLETED');
        });

                },child: Text('Order',style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,fontWeight: FontWeight.bold)),)),
//=====================================================
// EP622: ADD SIZED BOX TO AVOID WHEN SHOWING SNACKBAR
//=====================================================         
        SizedBox(height: 35,) ,           
        ],

      ),
      
    );
  }
}