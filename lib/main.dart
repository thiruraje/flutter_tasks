import 'package:flutter/material.dart';
import 'package:testing/bootombar.dart';
import 'package:testing/drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MenuDashboardPage(),
    );
  }
}

class NewPage extends StatefulWidget {
  NewPage({Key key}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: RaisedButton(onPressed: (){
         Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
       },
       child:Text("Nexr Page")),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Back Image"),
      ),
      body: Center(
    child: Stack(
      children: <Widget>[
        Card(
          child: new Container(
            child: Image.network(
            'https://th.thgim.com/entertainment/movies/v8sl6j/article31820338.ece/alternates/FREE_435/MPMaster-1-2',
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                fit: BoxFit.cover,
                image: new AssetImage(
                  'assets/images/Master.jpg',
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
