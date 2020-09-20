import 'package:flutter/material.dart';

class Ep161Page extends StatefulWidget {
  @override
  _Ep161PageState createState() => _Ep161PageState();
}

class _Ep161PageState extends State<Ep161Page> {
//=============================================================================
// DECLARE VARIABLE: _TABINDEX
//=============================================================================  
  int _tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP16-1: BottomNavigationBar'),),
//=============================================================================
// BOTTOM NAVIGATION BAR
//=============================================================================        
      bottomNavigationBar: BottomNavigationBar(
//=============================================================================
// TYPE
//=============================================================================          
      type: BottomNavigationBarType.fixed,
//=============================================================================
// TYPE
//=============================================================================        
      onTap: (int index){setState(() {
        _tabIndex = index;            
      });},
//=============================================================================
// CURRENT INDEX: TO CHANGE AFTER CLICK
//=============================================================================  
      currentIndex: _tabIndex,
//=============================================================================
// ITEM
//=============================================================================        
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.stars), title: Text('Best Deal')),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Search Deal')),      
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), title: Text('More')),                              
        ],
      ),
      body: _tabIndex == 0 ? TabHomeWidget():
            _tabIndex == 1 ? TabBestDealWidget():
            _tabIndex == 2 ? TabSearchWidget():
            TabMoreWidget()
    
      
      //Container(child: Center(child: Text(_tabIndex.toString(),style: TextStyle(fontSize: 50),))),
      
    );
  }





}


//=============================================================================
// TAB: HOME
//=============================================================================  
class TabHomeWidget extends StatelessWidget {
  const TabHomeWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child:Center(child: Text('Home Widget')) );
  }
}

//=============================================================================
// TAB: bEST DEAL
//=============================================================================  
class TabBestDealWidget extends StatelessWidget {
  const TabBestDealWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child:
      ListView(children: <Widget>[
        Text('London'),
        Text('Rome'),      
        Text('Bangkok'),             
      ],)
    
    );
  }
}

//=============================================================================
// TAB: bEST DEAL
//=============================================================================  
class TabSearchWidget extends StatelessWidget {
  const TabSearchWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Image(image: AssetImage('assets/images/pic1.jpg')) );
  }
}

//=============================================================================
// TAB: bEST DEAL
//=============================================================================  
class TabMoreWidget extends StatelessWidget {
  const TabMoreWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child:
      ListView(children: <Widget>[
        ListTile(title: Text('Main Menu'),trailing: Icon(Icons.stay_primary_landscape) ,)
      ],)
     );
  }
}