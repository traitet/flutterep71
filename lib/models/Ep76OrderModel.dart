
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterep11/singletons/GlobalAppData.dart';
//==================================================
// GLOBAL VARIABLE = SINGLETON = SHARE VARIABLE IN APP (EP76)
//==================================================
import '../singletons/GlobalAppData.dart';

//==================================================
// CLASS ORDER MODEL
//==================================================
class Ep76OrderModel{
//==================================================
// 1) CLASS PROPERTY
//==================================================
CustomerInfo customerInfo;
List <OrderItemInfo> listOrderItemInfo;
final String tableNo;
final String orderNo;
final DateTime timeStamp;

//==================================================
// 2) CONSTUCTURE
//==================================================
Ep76OrderModel({
  this.listOrderItemInfo,
  this.customerInfo,
  this.tableNo,
  this.orderNo,
  this.timeStamp,
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
    'timeStamp': DateTime.now(),    
  }; 
}

//========================================================
// 4) FACTORY METHOD (FROMFILESTORE) TO GENERATE  OBJECT
//========================================================
  factory Ep76OrderModel.fromFireStore(DocumentSnapshot doc){
    Map data = doc.data;
    return Ep76OrderModel(
      tableNo: data['tableNo'],
      orderNo: data['orderNo'],
      timeStamp: data['timeStamp'],
      customerInfo: CustomerInfo.fromFireStore(doc),
      // listOrderItemInfo: List<OrderItemInfo>.from(data['orderItemInfo'].map((e)=> OrderItemInfo.fromFireStore(doc))), 
      listOrderItemInfo: List<OrderItemInfo>.from(data['orderItemInfo'].map((e) { 
        OrderItemInfo.fromFireStore(doc);
      })),
                                        
    );
  }

}//END CLASS

//==================================================
// ORDER SERVICE CLASS
//==================================================
class OrderService{
  static void openTable({ int noOfGuest,String customerName, String customerMobileNo, String tableNo,})
  {
//==================================================
// DECLARE VARIABLE
//==================================================    
    String _orderNo = DateTime.now().millisecondsSinceEpoch.toString();
    CustomerInfo _customerInfo = CustomerInfo(customerName: customerName,mobileNo: customerMobileNo,noOfGuest: noOfGuest);
//==================================================
// **** EP76 ***: SET GLOBAL VARIABLE DATA
//==================================================
  globalAppData.tableNo = tableNo;
  globalAppData.orderNo = _orderNo;

//==================================================
// PREPARE VARIABLE (MODEL = OBJECT) TABLE
//==================================================
  TableModel _tableModel = TableModel(
    customerInfo: _customerInfo,
    tableNo: tableNo,
    orderNo: _orderNo,
    orderStatus: 'OPEN',
  );
//==================================================
// PREPARE VARIABLE (MODEL = OBJECT) ORDER
//==================================================
    Ep76OrderModel _orderModel = Ep76OrderModel(
        customerInfo: _customerInfo,
        listOrderItemInfo: [],
        tableNo: tableNo,
        orderNo: _orderNo,
    );
//==================================================
// SAVE DATA TO TM_EP75_TABLE DATABASE
//==================================================
  Firestore.instance.collection('TM_EP76_TABLES').document(tableNo).setData(_tableModel.toFireStore()).then((value) {
    print('Save TM_EP67_TABLES Completed with ${_tableModel.toFireStore()}' );
  }).catchError((error){
    print('Error to save table $error');
  });

//==================================================
// SAVE DATA TO T5_EP75_ORDER DATABASE
//================================================== 
  Firestore.instance.collection('TT_EP75_ORDERS').document(_orderNo).setData(_orderModel.toFireStore()).then((value) {
    print('Save TT_EP67_ORDERS Completed with ${_orderModel.toFireStore()}' );
  }).catchError((error){
    print('Error to save table $error');
  });   
  }
}

//==================================================
// CLASS TABLE INFO (EP75)
//==================================================
class TableModel{
//==================================================
// 1) CLASS PROPERTY
//==================================================
final String tableNo;
final String orderNo;
final String orderStatus;
final DateTime timeStamp;
final CustomerInfo customerInfo;

//==================================================
// 2) CONSTUCTURE
//==================================================
TableModel({
  this.tableNo,
  this.orderNo,
  this.orderStatus,
  this.timeStamp,  
  this.customerInfo,
});

//==================================================
// 3) FUNCTION TO FIRESTORE
//==================================================
Map<String, dynamic> toFireStore(){
  return {
    'tableNo': tableNo,
    'orderNo': orderNo,
    'orderStatus': orderStatus,
    'timeStamp': DateTime.now(),
    'customerInfo': customerInfo.toFireStore(),        
  }; 
}

//========================================================
// 4) FACTORY METHOD (FROMFILESTORE) TO GENERATE  OBJECT
//========================================================
  factory TableModel.fromFireStore(DocumentSnapshot doc){
    Map data = doc.data;
    return TableModel(
      tableNo: data['tableNo'],
      orderNo: data['orderNo'],
      orderStatus: data['orderStatus'],
      timeStamp: DateTime.now(),
      customerInfo: CustomerInfo.fromFireStore(doc),       
                                          
    );
  }
}



//==================================================
// CLASS CUSTOMER INFO
//==================================================
class CustomerInfo{
//==================================================
// 1) CLASS PROPERTY
//==================================================
final String customerName;
final String mobileNo;
final int noOfGuest;

//==================================================
// 2) CONSTUCTURE
//==================================================
CustomerInfo({
  this.customerName,
  this.mobileNo,
  this.noOfGuest,
});

//==================================================
// 3) FUNCTION TO FIRESTORE
//==================================================
Map<String, dynamic> toFireStore(){
  return {
    'customerName': customerName,
    'mobileNo': mobileNo,
    'noOfGuest': noOfGuest,    
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
      noOfGuest: data['noOfGuest'],      
                                          
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