import 'package:flutter/material.dart';
import 'package:flutterep11/main.dart';
import 'package:splashscreen/splashscreen.dart';

class Ep341Page extends StatefulWidget {
  @override
  _Ep341PageState createState() => _Ep341PageState();
}

class _Ep341PageState extends State<Ep341Page> {
  @override
  Widget build(BuildContext context) {
    return       
    SplashScreen(
      seconds: 5,
      navigateAfterSeconds: MyHomePage(title: 'See-Flutter เรียนรู้ไปด้วยกัน START EP31',),
      title: Text('Welcome to See-Flutter',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
      image: Image.asset('assets/icon/icon.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("See-Flutter"),
      loaderColor: Colors.red
    );
  }
}