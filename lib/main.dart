import 'package:flutterep11/screens/Ep701Page.dart';

import './screens/Ep691Page.dart';
import './screens/Ep681Page.dart';
import './screens/Ep671Page.dart';
import './screens/Ep661Page.dart';
import './screens/Ep651Page.dart';
import './screens/Ep641Page.dart';
import './screens/Ep631Page.dart';
import './screens/Ep621Page.dart';
import './screens/Ep622Page.dart';
import './screens/Ep611Page.dart';
import './screens/Ep591Page.dart';
import './screens/Ep592Page.dart';
import './screens/Ep601Page.dart';
import './screens/Ep602Page.dart';
import './screens/Ep582Page.dart';
import './screens/Ep581Page.dart';
import './screens/Ep571Page.dart';
import './screens/Ep561Page.dart';
import './screens/Ep551Page.dart';
import './screens/Ep541Page.dart';
import './screens/Ep531APage.dart';
import './screens/Ep531BPage.dart';
import './screens/Ep521Page.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import './screens/Ep511APage.dart';
import './screens/Ep511BPage.dart';
import './screens/Ep501Page.dart';
import './screens/Ep491Page.dart';
import './screens/Ep481Page.dart';
import './screens/Ep471APage.dart';
import './screens/Ep471BPage.dart';
import './screens/Ep461Page.dart';
import './screens/Ep451Page.dart';
import './screens/Ep441Page.dart';
import './screens/Ep431APage.dart';
import './screens/Ep431BPage.dart';
import './screens/Ep421Page.dart';
import './screens/Ep411CPage.dart';
import './screens/Ep411APage.dart';
import './screens/Ep411BPage.dart';
import './screens/Ep401APage.dart';
import './screens/Ep401BPage.dart';
import './screens/Ep392APage.dart';
import './screens/Ep392BPage.dart';
import './screens/Ep391APage.dart';
import './screens/Ep391BPage.dart';
import './screens/Ep371Page.dart';
import './screens/Ep381Page.dart';
import './screens/Ep361Page.dart';
import './screens/Ep351Page.dart';
import './screens/Ep341Page.dart';
import './screens/Ep331Page.dart';
import './screens/Ep321Page.dart';
import './screens/Ep311Page.dart';
import './screens/Ep301Page.dart';
import './screens/Ep291Page.dart';
import './screens/Ep281Page.dart';
import './screens/Ep271Page.dart';
import './screens/Ep241Page.dart';
import './screens/Ep231Page.dart';
import './screens/Ep221Page.dart';
import './screens/Ep222Page.dart';
import './screens/Ep202Page.dart';
import './screens/Ep201Page.dart';
import './screens/Ep19Page.dart';
import './screens/Ep18Page.dart';
import './screens/Ep171Page.dart';
import './screens/Ep172Page.dart';
import './screens/Ep164Page.dart';
import './screens/Ep12BasicWidgetPage.dart';
import './screens/Ep13Page.dart';
import './screens/Ep14Page.dart';
import './screens/Ep161Page.dart';
import './screens/Ep162Page.dart';
import './screens/Ep163Page.dart';
import './screens/NewPage.dart';
import './screens/Ep251Page.dart';
import './screens/Ep252Page.dart';
import './screens/Ep261Page.dart';
void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//======================================================================
// DIAABLE BANNER
//======================================================================  
      //debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  
//==============================================
// SPLASH SCREEN PAGE
//==============================================          
      SplashScreen(
      seconds: 3,
      navigateAfterSeconds: MyHomePage(title: 'See-Flutter เรียนรู้ไปด้วยกัน EP61-70',),
      title: Text('Welcome to See-Flutter',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
      image: Image.asset('assets/icon/icon.png'),
      backgroundColor: Colors.orange,
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 50,
      onClick: ()=>print("See-Flutter"),
      loaderColor: Colors.red
    )
//==============================================
// COMMENT FOR RUN SPLASHSCREEN PAGE
//==============================================       
      //MyHomePage(title: 'See-Flutter เรียนรู้ไปด้วยกัน START EP31'),
    );
  }
}

//============================================================
// MAIN CLASS
//============================================================
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//============================================================
// STATE CLASS
//============================================================
class _MyHomePageState extends State<MyHomePage> {
//============================================================
// DECLARE VARIABLE
//============================================================  
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
//============================================================
// SCAFFOLD
//============================================================    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
//============================================================
// CREATE BUTTON
//============================================================
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep701Page()),);},child: Text('EP70-1 - Plan Project, Agile, Scrum,Jira'),), 
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep691Page()),);},child: Text('EP69-1 - Design UI and Flow: Open Table'),), 
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep681Page()),);},child: Text('EP68-1 - How to develop E-menu & Design UI/Functions'),), 
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep671Page()),);},child: Text('EP67-1 - Model Mapping for get order'),), 
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep661Page()),);},child: Text('EP66-1 - Class modelling for Ordering'),), 
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep651Page()),);},child: Text('EP65-1 - Design, modelling by class diagram'),), 
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep641Page()),);},child: Text('EP64-1 - Get Menu using Model'),), 
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep631Page()),);},child: Text('EP63-1 - Add Order using Model Class'),), 
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep621Page()),);},child: Text('EP62-1 - Logic: Order Item'),), 
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep622Page()),);},child: Text('EP62-2 - Logic: Edit Order Item (Qty)'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep611Page()),);},child: Text('EP61-1 - Download and Upload to Github'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep602Page()),);},child: Text('EP60-2 - Logic: Edit Order Item (Get Data)'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep601Page()),);},child: Text('EP60-1 - Logic: Order Item'),),            
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep592Page()),);},child: Text('EP59-2 - Logic: Add Order'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep591Page(orderNo: 'ORD007')),);},child: Text('EP59-1 - Logic: delete Order Item'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep582Page()),);},child: Text('EP58-2 - Logic: Add Order/ add image Url '),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep581Page(orderNo: 'ORD007')),);},child: Text('EP58-1 - Logic: Order Item'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep571Page()),);},child: Text('EP57-1 - Coding UI: Order Item'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep561Page()),);},child: Text('EP56-1 - Logic: Add Order/Count order items '),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep551Page()),);},child: Text('EP55-1 - Logic: Add Order'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep541Page()),);},child: Text('EP54-1 - Logic: Search Menu by Category'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep531BPage()),);},child: Text('EP53-1B - Logic: Upload Image/Edit (Menu Detail)'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep531APage()),);},child: Text('EP53-1A - Logic: Upload Image/Edit (Search)'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep521Page()),);},child: Text('EP52-1 - Concept: Upload Image to Google Cloud Storage'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep511BPage()),);},child: Text('EP51-1B - Logic: Edit Menu (Menu Detail)'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep511APage()),);},child: Text('EP51-1A - Logic: Edit Menu (Search)'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep501Page()),);},child: Text('EP50-1 - Logic: Search Food Menu using SteamBuilder'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep491Page()),);},child: Text('EP49-1 - Concept: Search Food Menu using SteamBuilder'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep481Page()),);},child: Text('EP48-1 - Logic: Save New food Menu to DB'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep471BPage()),);},child: Text('EP47-1B - Logic: Edit Profile: Get /save profile'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep471APage()),);},child: Text('EP47-1A - Logic: Edit Profile - login'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep461Page()),);},child: Text('EP46-1 - Logic: Edit Profile'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep451Page()),);},child: Text('EP45-1 - Read and Write Data to Firebase Database'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep441Page()),);},child: Text('EP44-1 - Config Firebase Web & Flutter for Database'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep431BPage()),);},child: Text('EP43-1B - Logic: Firebase: Forgot password (reset pwd)'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep431APage()),);},child: Text('EP43-1A - Logic Firebase: Forgot password (login)'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep421Page()),);},child: Text('EP42-1 - Logic: Firebase: Register Account'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep411CPage()),);},child: Text('EP41-1C - Global Variable Singleton'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep411BPage()),);},child: Text('EP41-1B - Global Variable Singleton: Home Page'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep411APage()),);},child: Text('EP41-1A - Global Variable Singleton: Login'),),            
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep401BPage()),);},child: Text('EP40-1B - Pass Parameter (Homepage)'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep401APage()),);},child: Text('EP40-1A - Pass Parameter (Login)'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep392BPage()),);},child: Text('EP39-2B - Firebase: Forgot password (reset pwd)'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep392APage()),);},child: Text('EP39-2A - Firebase: Forgot password (login)'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep391BPage()),);},child: Text('EP39-1B - Firebase: Forgot password (reset pwd)'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep391APage()),);},child: Text('EP39-1A - Firebase: Forgot password (login)'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep381Page()),);},child: Text('EP38-1 - Firebase Login by E-mail (cont)'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep371Page()),);},child: Text('EP37-1 - Firebase Login by E-mail'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep361Page()),);},child: Text('EP36-1 - Google Firebase for Case Study'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep351Page()),);},child: Text('EP35-1 - Release flutter web to github'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep341Page()),);},child: Text('EP34-1 - Splash Screen'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep331Page()),);},child: Text('EP33-1 - UI: Make Payment'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep321Page()),);},child: Text('EP32-1 - UI: Scan QR'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep311Page()),);},child: Text('EP31-1 - App Icon: auto gen for IOS, Andriod'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep301Page()),);},child: Text('EP30-1 - UI: Maintain Food Menu (Cont.)'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep291Page()),);},child: Text('EP29-1 - UI: Maintain Food Menu'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep281Page()),);},child: Text('EP28-1 - UI: Maintain Food Menu'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep271Page()),);},child: Text('EP27-1 - UI: View Order'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep261Page()),);},child: Text('EP26-1 - UI: View Food Menu Detail'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep252Page()),);},child: Text('EP25-2 - UI: Search Food Menu - Menu List'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep251Page()),);},child: Text('EP25-1 - UI: Search Food Menu - Food Cat'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep241Page()),);},child: Text('EP24-1 - UI: Edit User Account'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep231Page()),);},child: Text('EP23-1 - UI: Register Account'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep222Page()),);},child: Text('EP22-2 - Forgot Password'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep221Page()),);},child: Text('EP22-1 - Login'),),
            RaisedButton(onPressed: () {},child: Text('EP21 - Download code from GitHub, System & UI Design, E-menu case study (Develop Workable App)'),),           
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep202Page()),);},child: Text('EP20-2 - Advanced Button'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep201Page()),);},child: Text('EP20-1 - MaterialApp,BasicButton'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep19Page()),);},child: Text('EP19 - TextFormField'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep18Page()),);},child: Text('EP18 - TextField'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep172Page()),);},child: Text('EP17-2 - GridViewBuilder'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep171Page()),);},child: Text('EP17-1 - ListViewBuilder(Hori)'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep164Page()),);},child: Text('EP16-4 - GridView-Card Navigator'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep163Page()),);},child: Text('EP16-3 - Scaffold-Drawer'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep162Page()),);},child: Text('EP16-2 - Scaoffold-AppBar-TabBar'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep161Page()),);},child: Text('EP16-1 - BottomNavigationBar - Scaoffold'),),
            RaisedButton(onPressed: () {},child: Text('EP15 - No Code: Build Chorme & Release web to Git hub'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep14Page()),);},child: Text('EP14 - Snack Bar & Dialog'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep13Page()),);},child: Text('EP13 - Basic Widget#2'),),
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Ep12BasicWidgetPage()),);},child: Text('EP12 - Basic Widget#1'),),               
            RaisedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => NewPage()),);},child: Text('EP11 - New Project'),),
                                                
//============================================================
// TEXT
//============================================================
            SizedBox(height: 10,),
            Text('Download Source Code at:',textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
            SizedBox(height: 10,),                        
            Text('EP11-20: https://github.com/traitet/flutterep11.git',textAlign: TextAlign.center,style: TextStyle(fontSize: 15)),
            Text('EP21-30: https://github.com/traitet/flutterep21.git',textAlign: TextAlign.center,style: TextStyle(fontSize: 15)),  
            Text('EP31-40: https://github.com/traitet/flutterep31.git',textAlign: TextAlign.center,style: TextStyle(fontSize: 15)),                        
//============================================================
// TEXT
//============================================================   
            SizedBox(height: 10,),         
            Text(
              'EP-'
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
