
//==========================================================================
// CLASS APP DATA
// HOW TO USE 1) IMPORT 2) REF. e.g. globalAppDat.email
//==========================================================================
class GlobalAppData {
//==========================================================================
// DECLARE VARIABLE
//==========================================================================  
  static final GlobalAppData _globalAppData = new GlobalAppData._internal();
//==========================================================================
// SHARED VARIABLE
//==========================================================================
  String text = '';
  bool  isLogin = false;
  String userName = '';
  String email = '';
  String name = '';
  String surname = '';
  String imageProfileUrl = '';
  String mobile = '';
  String orderNo = '';
  String tableNo = '';

//==========================================================================
// FACTORY APP DATA
//==========================================================================  
  factory GlobalAppData() {
    return _globalAppData;
  }
  GlobalAppData._internal();
}
//==========================================================================
// APP DATA = APPDATA
//==========================================================================
final globalAppData = GlobalAppData();


//==========================================================================
// HOW TO USE
// import '../singletons/GlobalAppData.dart';
// declare varaible e.g. GlobalAppData globalAppData = GlobalAppData();
// set data e.g. globalAppData.name = 'traitet';
// get data e.g. Text('Global Data (Singleton), Name: ${globalAppData.name}'),
//==========================================================================