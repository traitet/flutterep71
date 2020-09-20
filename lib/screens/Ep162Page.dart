import 'package:flutter/material.dart';

class Ep162Page extends StatefulWidget {
  @override
  _Ep162PageState createState() => _Ep162PageState();
}

class _Ep162PageState extends State<Ep162Page> {
//==============================================================
// DECLARE VARIABLE
//==============================================================
  final List<Tab> _tab = [
    Tab(text: 'Tab 1'),
    Tab(text: 'Tab 2'),
    Tab(text: 'Tab 3'),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tab.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('EP16-2 Tabbar'),
          bottom: TabBar(tabs: _tab),
        ),
        body: TabBarView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text('Tab 1'),
                Image.asset('assets/images/pic1.jpg')
              ],
            ),
            Center(child: Text("Tab's 2")),
            Column(
              children: <Widget>[
                Text('Tab 3'),
                Image.asset('assets/images/pic2.jpg')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
