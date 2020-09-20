import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
//========================================================
// 1) CALSS PROPERTY
//========================================================
  final String menuId;
  final String menuNameEng;
  final String menuDescEng;
  final double price;
  final String orderNo;
  final String tableNo;
  final String customerName;
  final int qty;
  final DateTime orderTime ;
  final String imageUrl;
  final String status;
//========================================================
// 2) CONSTUCTURE
//========================================================
  OrderModel({
    this.menuId,
    this.menuNameEng,
    this.menuDescEng,
    this.price,
    this.orderNo,
    this.tableNo,
    this.customerName,
    this.qty,
    this.orderTime,
    this.imageUrl,
    this.status = 'ORDERING'
  });

//========================================================
// 3) MAP DATA TO FIRESTORE FORMAT
//========================================================
Map<String, dynamic> toFireStore() => {
  'menuId': menuId,
  'menuNameEng':menuNameEng,
  'menuDescEng':menuDescEng,
  'price':price,
  'orderNo':orderNo,
  'tableNo':tableNo,
  'customerName':customerName,
  'qty': qty,
  'orderTime': DateTime.now() ,
  'imageUrl': imageUrl,
  'status': status

};

//========================================================
// 4) FUNCTION SAVE ORDER
//========================================================
  saveOrder(
){
  Firestore.instance.collection('TT_ORDERS').document(orderNo + '|' + DateTime.now().millisecondsSinceEpoch.toString()).setData(this.toFireStore()
    // 'menuId': menuId,
    // 'menuNameEng': title,
    // 'menuDescEng': description,
    // 'price': price,    
    // 'orderNo': orderNo,
    // 'tableNo': tableNo,
    // 'customerName': customerName,
    // 'qty': 1,
    // 'orderTime': DateTime.now(),
    // 'status': 'ORDERING',
    // 'imageUrl': imageStr,
//==================================================
// THEN (IF SAVE COMPLETE)
//==================================================     
  ).then((value) {
    print('Save Complete');
//==================================================
// CATCH ERROR (IF ERROR)
//==================================================     
  }).catchError((error){
    print('Save Error $error');
//==================================================
// WHEN COMPLETE
//==================================================     
  }).whenComplete(() {
    print('When completed');
  });
}

}



