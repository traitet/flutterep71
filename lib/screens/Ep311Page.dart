import 'package:flutter/material.dart';


class Ep311Page extends StatefulWidget {
  @override
  _Ep311PageState createState() => _Ep311PageState();
}

class _Ep311PageState extends State<Ep311Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP31-1: App Icon for Andriod and Ios'),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(''),
              Text('Ref web: https://pub.dev/packages/flutter_launcher_icons \n'),        
              Text('Step#1: Create folder assets/icon/ \n'),
              Text('Step#2: Prepare png file and place in assets/icon/icon.png \n'),          
              Text('Step#3: Add line in pubspec.yaml file & Get Package \n'),   
              Text('Step#4: Open Teminal and run command: flutter pub run flutter_launcher_icons:main \n'),              
              Text('Step#5: Try to build in Emulator and Andriod \n'),    
          ],),
        ),
      )   ,
      
    );
  }
}