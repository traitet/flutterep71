
import 'package:cloud_firestore/cloud_firestore.dart';

//==================================================
// CLASS ORDER MODEL
//==================================================
class Ep67OrderModel{
//==================================================
// 1) CLASS PROPERTY
//==================================================
CustomerInfo customerInfo;
List <OrderItemInfo> listOrderItemInfo;
final String tableNo;
final String orderNo;
final DateTime createOrderTime;

//==================================================
// 2) CONSTUCTURE
//==================================================
Ep67OrderModel({
  this.listOrderItemInfo,
  this.customerInfo,
  this.tableNo,
  this.orderNo,
  this.createOrderTime,
});

//==================================================
// 3) FUNCTION TO FIRESTORE
//==================================================
Map<String, dynamic> toFireStore(){
  return {
    'listOrderItemInfo': List<dynamic>.from(listOrderItemInfo.map((e) => e.toFireStore())), // VERY DIFFICULT CODE
    'customerInfo': customerInfo.toFireStore(),
    'tableNo': tableNo,
    'orderNo': orderNo,
    'createOrderTime': DateTime.now(),    
  }; 
}

//========================================================
// 4) FACTORY METHOD (FROMFILESTORE) TO GENERATE  OBJECT
//========================================================
  factory Ep67OrderModel.fromFireStore(DocumentSnapshot doc){
    Map data = doc.data;
    return Ep67OrderModel(
      tableNo: data['tableNo'],
      orderNo: data['orderNo'],
      createOrderTime: data['createOrderTime'],
      customerInfo: CustomerInfo.fromFireStore(doc),
      // listOrderItemInfo: List<OrderItemInfo>.from(data['orderItemInfo'].map((e)=> OrderItemInfo.fromFireStore(doc))), 
      listOrderItemInfo: List<OrderItemInfo>.from(data['orderItemInfo'].map((e) { 
        OrderItemInfo.fromFireStore(doc);
      })),
                                        
    );
  }

//==================================================
// 5) SAVE ORDER
//==================================================
saveOrder(){
  Firestore.instance.collection('TT_V1_ORDERS').document(this.orderNo).setData(this.toFireStore())
  .then((value) {
    print('SAVED ORDER ${this.orderNo} COMPLETED');
  })
  .catchError((error){
    print('SAVED ERROR $error COMPLETED');    
  })
  .whenComplete(() {
    print('WHEN COMPLATED "FINALLY"');    
    print("WHEN COMPLATED 'FINALLY'");          
  });
}

//==================================================
// 6) GET ORDER
//==================================================
getOrder(){
  Firestore.instance.collection('TT_V1_ORDERS').document(this.orderNo).get()
  .then((DocumentSnapshot value) {
    print('SAVED ORDER ${this.orderNo} COMPLETED');
    print(value.data.toString());
  })
  .catchError((error){
    print('SAVED ERROR $error COMPLETED');    
  })
  .whenComplete(() {
    print('WHEN COMPLATED "FINALLY"');    
    print("WHEN COMPLATED 'FINALLY'");          
  });
}//END FUNCTION
}//END CLASS


//==================================================
// CLASS CUSTOMER INFO
//==================================================
class CustomerInfo{
//==================================================
// 1) CLASS PROPERTY
//==================================================
final String customerName;
final String mobileNo;

//==================================================
// 2) CONSTUCTURE
//==================================================
CustomerInfo({
  this.customerName,
  this.mobileNo
});

//==================================================
// 3) FUNCTION TO FIRESTORE
//==================================================
Map<String, dynamic> toFireStore(){
  return {
    'customerName': customerName,
    'mobileNo': mobileNo
  }; 
}

//========================================================
// 4) FACTORY METHOD (FROMFILESTORE) TO GENERATE  OBJECT
//========================================================
  factory CustomerInfo.fromFireStore(DocumentSnapshot doc){
    Map data = doc.data;
    return CustomerInfo(
      customerName: data['customerName'],
      mobileNo: data['mobileNo'],
                                          
    );
  }


}

//==================================================
//CLASS ORDER ITEM INFO --> LIST
//==================================================
class OrderItemInfo{
//==================================================
// 1) CLASS PROPERTY
//==================================================
final String menuId;
final String menuNameEng;
final int qty;
final String status;

//==================================================
// 2) CONSTUCTURE
//==================================================
OrderItemInfo({
  this.menuId,
  this.menuNameEng,
  this.qty,
  this.status,
});

//==================================================
// 3) FUNCTION TO FIRESTORE
//==================================================
Map<String, dynamic> toFireStore(){
  return {
    'menuId': menuId,
    'menuNameEng': menuNameEng,
    'qty': qty,
    'status': status,
  }; 
}

//========================================================
// 4) FACTORY METHOD (FROMFILESTORE) TO GENERATE  OBJECT
//========================================================
  factory OrderItemInfo.fromFireStore(DocumentSnapshot doc){
    Map data = doc.data;
    return OrderItemInfo(
      menuId: data['menuId'],
      menuNameEng: data['menuNameEng'],
      qty: data['qty'],
      status: data['status'],                                         
    );
  }


}