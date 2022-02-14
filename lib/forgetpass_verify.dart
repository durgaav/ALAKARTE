import 'package:alakarte/pass_reset_activity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

class ForgetPassOtp extends StatefulWidget {
  @override
  _ForgetPassOtpState createState() => _ForgetPassOtpState();
}

class _ForgetPassOtpState extends State<ForgetPassOtp> {
  Color red = Color(0xffDB90000);
  Color grey = Color(0xff7EABB7);
  Color white = Color(0xffFFFFFF);
  Color black = Color(0xff000000);
  Color lightred = Color(0xffB24A19);
  Color maroon = Color(0xff933E16);

  TextEditingController code = new TextEditingController();
  
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
          title: Text('VERIFICATION'),
        ),
        body:Center(
          child: Container(
            padding: EdgeInsets.all(35),
            margin: EdgeInsets.only(top: 25),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  //Text
                  Text("ENTER OTP",
                    style: TextStyle(fontSize: 25,color: black),),
                  //Otp text
                  Container(
                    margin: EdgeInsets.only(top: 28),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Text("OTP has been sent to you on your mobile number.Please enter it below",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17,color: black),),
                  ),
                  //OTP code editor
                  Container(
                    margin: EdgeInsets.only(top: 50,left: 20,right: 20),
                    child: TextField()
                  ),
                  //Send btn
                  Container(
                    margin: EdgeInsets.only(top: 50,left: 20,right: 20),
                    width: 150,
                    height: 45,
                    child: RaisedButton(
                      color: red,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> PassReset()));
                      },
                      child: Text('SEND',style: TextStyle(fontSize: 16,color: white),),
                    ),
                  ),

                  //Resend
                  Container(
                    height: 30,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 30),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: Text("Didn't receive the OTP?",
                              style: TextStyle(fontSize: 15,color: black),
                            )
                        ),
                        InkWell(
                          onTap: (){},
                            child:Text(" Resend OTP",
                                style: TextStyle(fontSize: 15,color: black),
                            ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}

