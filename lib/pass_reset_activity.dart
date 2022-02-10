import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:alakarte/forgetpass_verify.dart';

class PassReset extends StatefulWidget {
  const PassReset({Key? key}) : super(key: key);
  @override
  _PassResetState createState() => _PassResetState();
}

class _PassResetState extends State<PassReset> {
  Color red = Color(0xffDB90000);
  Color grey = Color(0xff7EABB7);
  Color white = Color(0xffFFFFFF);
  Color black = Color(0xff000000);

  TextEditingController code = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: red
    ));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: red,
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
                Navigator.pop(context);
            },
            icon: Icon(CupertinoIcons.back),
          ),
          title: Text('FORGOT PASSWORD',style: TextStyle(fontSize: 15,color: white),),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.9,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                //Kry icon
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: white,
                    child:Transform.rotate(
                      angle: 100,
                      child: Icon(
                          Icons.vpn_key_outlined,
                          size: 80,
                          color: grey,
                        ),
                    ),
                  ),
                ),
                //Title
                Padding(
                  padding: EdgeInsets.only(top: 35),
                  child: Text("FORGOT PASSWORD",style: TextStyle(color: black,fontSize: 22),),
                ),
                //Title info
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 300,
                    alignment: Alignment.center,
                    child: Text(
                      "Enter your new password below,We're just being extra safe",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: black,fontSize: 15),
                    )),
                //Password fieds
                Container(
                  height: 250,
                  margin: EdgeInsets.only(right: 20,left: 20,top: 30),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget> [
                      TextFormField(
                        obscureText: true,
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: "Password",
                          label: Text("New password",style: TextStyle(color: grey),)
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          style: TextStyle(fontSize: 14),
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Password",
                              label: Text("Confirm password",style: TextStyle(color: grey),)
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        width: 150,
                        child: RaisedButton(
                          color: red,
                          onPressed: (){},
                          child: Text('DONE',style: TextStyle(fontSize: 16,color: white),),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
