// @dart=2.9
import 'package:alakarte/homepage.dart';
import 'package:alakarte/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'introscreen.dart';

void main() {
  runApp(MyApp());
  Color red = Color(0xffDB90000);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: red
  ));
  // WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Color red = Color(0xffDB90000);
  Color grey = Color(0xff7D7699);
  Color white = Color(0xffFFFFFF);
  Color black = Color(0xff000000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: HomePage() // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

