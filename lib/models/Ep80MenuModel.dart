import 'package:cloud_firestore/cloud_firestore.dart';

class EP80MenuModel {
//========================================================
// 1) CALSS PROPERTY
//========================================================
  final String menuId;
  final String menuCategoryValue;
  final String menuNameEng;
  final String menuNameThai;  
  final String menuDescriptionEng;
  final String menuDescriptionThai;    
  final int rating;
  final double price;
  final int spicyLevel;
  final String imageUrl;

//========================================================
// 2) CONSTUCTURE
//========================================================
  EP80MenuModel({
    this.menuId,
    this.menuCategoryValue,
    this.menuNameEng,
    this.menuNameThai,
    this.menuDescriptionEng,
    this.menuDescriptionThai,
    this.rating,
    this.price,
    this.spicyLevel,
    this.imageUrl,
  });

//========================================================
// 3) MAP DATA TO FIRESTORE FORMAT
//========================================================
Map<String, dynamic> toFireStore() => {
  'menuId': menuId,
  'menuCategoryValue':menuCategoryValue,
  'menuNameEng':menuNameEng,
  'menuNameThai':menuNameThai,
  'menuDescriptionEng':menuDescriptionEng,
  'menuDescriptionThai':menuDescriptionThai,
  'rating':rating,
  'price': price,
  'spicyLevel':spicyLevel ,
  'imageUrl': imageUrl,

};

//========================================================
// 4) FUNCTION SAVE ORDER
//========================================================
  saveMenuFromOrder(
){
  Firestore.instance.collection('TT_ORDERS').document(menuId ).setData(this.toFireStore()
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

//========================================================
// EP80#1: GET MENU (RETURN SNAPSHOT)
//========================================================
static Future<DocumentSnapshot> getMenu({String menuId}){
  return Firestore.instance.collection('TM_MENUS').document(menuId).get();
}

//========================================================
// EP80#2: GET MENU (RETURN MODEL (OBJECT))
//========================================================
static Future<EP80MenuModel> getMenuModel({String menuId}){
  return Firestore.instance.collection('TM_MENUS').document(menuId).get().then((value) {
    return EP80MenuModel.fromFireStore(value);
  });
}

//========================================================
// 5) FUNCTION GET MENU (EP80)
//========================================================
  static Stream<QuerySnapshot> getMenusByCategory({String menuCategoryValue}){
   return Firestore.instance.collection('TM_MENUS').where('menuCategoryValue',isEqualTo: menuCategoryValue).snapshots();
   
}

//========================================================
// 6) FACTORY METHOD (FROMFILESTORE) TO GENERATE MENU OBJECT
//========================================================
  factory EP80MenuModel.fromFireStore(DocumentSnapshot doc){
    Map data = doc.data;
    return EP80MenuModel(
      menuId: data['menuId'],
      menuCategoryValue: data['menuId'],
      menuNameEng: data['menuNameEng'],
      menuNameThai: data['menuNameThai'],
      menuDescriptionEng: data['menuDescriptionEng'],
      menuDescriptionThai: data['menuDescriptionThai'],
      rating: data['rating'],
      price: data['price'],   
      spicyLevel: data['spicyLevel'],
      imageUrl: data['imageUrl'],                                           
    );
  }

}



