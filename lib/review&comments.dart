import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  Color red = Color(0xffDB90000);
  Color black = Color(0xff000000);
  Color white = Color(0xffFFFFFF);
  Color grey = Color(0xff7D7699);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: red,
        centerTitle: true,
        title: Text('Review & Comments'),
        leading: IconButton(
          icon:Icon(CupertinoIcons.chevron_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
                child:Text('Need discus with us')
          ),
        ));
  }
}
