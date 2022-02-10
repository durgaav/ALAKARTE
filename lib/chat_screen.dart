import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Color red = Color(0xffDB90000);
  Color grey = Color(0xff7EABB7);
  Color white = Color(0xffFFFFFF);
  Color black = Color(0xff000000);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: red));
  }

  List comments = [
    "hiii",
    "hellooo"
  ];
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              children:<Widget> [
               Container(
                 height: 400,
                 child: ListView.builder(
                   itemCount: comments.length,
                     itemBuilder: (context,index){
                       return ListTile(
                         // leading:Icon(CupertinoIcons.person_alt_circle_fill,color: grey,size: 40,),
                         title: Row(
                           children: <Widget>[
                             Container(
                               padding:EdgeInsets.all(0),
                                 decoration:BoxDecoration(
                                 shape:BoxShape.circle,
                                   color: red,
                               ),
                                 child: Icon(CupertinoIcons.person_alt_circle_fill,color: white,size: 44,)
                             ),
                             Padding(
                               padding:EdgeInsets.only(left: 18),
                               child: Text('Surya prakash',style: TextStyle(fontWeight: FontWeight.bold),),
                             )
                           ],
                         ),
                         subtitle: Container(
                           margin: EdgeInsets.only(left: 68),
                             child: Text(
                                 '${comments[index].toString()}',
                               style: TextStyle(fontSize: 13,color: black),
                             )),
                       );
                     }
                 ),
               ),
                Column(
                  children:<Widget> [
                    Container(
                      margin: EdgeInsets.all(10),
                      color: grey,
                      height: 130,
                      child: TextFormField(
                        controller: controller,
                        maxLines: 5,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(7),
                            border: InputBorder.none,
                            hintText: "Add comment"
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      child: Container(
                        width: 100,
                        child: RaisedButton(
                          color: red,
                          onPressed: (){
                            setState(() {
                              comments.add(controller.text.toString());
                            });
                            // controller.dispose();
                          },
                          child: Text('POST',style: TextStyle(fontSize: 16,color: white),),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
