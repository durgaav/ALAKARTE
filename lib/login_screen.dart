import 'package:alakarte/forgetpass_verify.dart';
import 'package:alakarte/registerpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_activity.dart';

class LoginApp extends StatefulWidget {
  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {

  Color red = Color(0xffDB90000);
  Color grey = Color(0xff7EABB7);
  Color white = Color(0xffFFFFFF);
  Color black = Color(0xff000000);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: red
    // ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: red,
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(CupertinoIcons.back),
          ),
          title: Text('LOGIN'),
        ),
        body:Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.9,
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Logo image
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 30.0),
                      width: 67,
                      height: 67,
                      child: Image(
                        image: AssetImage("assets/images/logo.png"),
                      ),
                    ),
                  ),
                  //edit text Container
                  Container(
                    padding: EdgeInsets.all(5),
                    // color: Colors.grey,
                    height: 300,
                    margin: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:<Widget> [
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Name",
                            prefixIcon: Icon(Icons.person_sharp,size: 30,color: black,),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: Icon(Icons.lock_open_rounded,size: 30,color: black,),

                            ),
                          ),
                        ),

                        //Forgot password
                        Container(
                          margin: EdgeInsets.only(top: 20,bottom: 10),
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                             onTap: (){
                               print('hiiii');
                               Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgetPassOtp()));
                             },
                              child:Text("Forget password?",
                                  style: TextStyle(fontSize: 15,color: black,fontWeight: FontWeight.w400),
                              ),
                              ),
                        ),

                        //Buttons ROW
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //LOGIN BTN
                              Container(
                                width: 150,
                                child: RaisedButton(
                                  color: red,
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeActivity()));
                                  },
                                  child: Text('LOGIN',style: TextStyle(fontSize: 16,color: white),),
                                ),
                              ),
                              Container(
                                width: 150,
                                child: RaisedButton(
                                  color: red,
                                  onPressed: (){
                                    print('hiiii');
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeActivity()));
                                  },
                                  child: Text('Login with FACEBOOK',style: TextStyle(fontSize: 10,color: white,),maxLines: 1,),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //Not yet a member
                        Container(
                          padding: EdgeInsets.only(top: 15),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text('Not yet a member?',style: TextStyle(fontSize: 15,color: black,fontWeight: FontWeight.w300),)
                              ),
                              InkWell(
                                  child:Text(" REGISTER"
                                    ,style: TextStyle(fontSize: 17,color: black),
                                  ),
                                  onTap: () => setState(()
                                  {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
                                    print('hiiii');
                                  })),
                            ],
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

