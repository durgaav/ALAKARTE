import 'dart:async';
import 'package:alakarte/registerpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login_screen.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  Color red = Color(0xffDB90000);
  Color grey = Color(0xff7D7699);

  int slideIndex = 0;
  PageController _controller = PageController(initialPage: 0);
  late Timer _timer;

  Widget _buildPageIndicator(bool isCurrentPage){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: isCurrentPage ? 11.0 : 7.0,
      width: isCurrentPage ? 11.0 : 7.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? red :grey,
        borderRadius: BorderRadius.circular(13),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
     Color white = Color(0xffFFFFFF);
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
         statusBarColor: red
     ));
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (slideIndex < 2) {
        slideIndex++;
      } else {
        slideIndex = 0;
      }

      _controller.animateToPage(
        slideIndex,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          body:Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height*0.8,
                    child:PageView(
                      controller: _controller,
                      onPageChanged: (index){
                        setState(() {
                          slideIndex = index;
                        });
                      },
                      children: [
                        Container(
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.grey[300],
                                height:400,
                                width: 300,
                                child:Container(
                                 // width: 20,
                                 // height: 70,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: new AssetImage('assets/images/screen1.png'),fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text('Welcome to our app keep enjoying Welcome to our app keep enjoying Welcome to our app keep enjoying'),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.grey[300],
                                height:400,
                                width: 300,
                                child:Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: new AssetImage('assets/images/screen2.png'),fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text('Welcome to our app keep enjoying Welcome to our app keep enjoying Welcome to our app keep enjoying'),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.grey[300],
                                height:400,
                                width: 300,
                                child:Container(
                                 // width: 70,
                                //  height: 70,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: new AssetImage('assets/images/screen3.png'),fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text('Welcome to our app keep enjoying Welcome to our app keep enjoying Welcome to our app keep enjoying'),
                              ),
                            ],
                          ),
                        ),
                      ]
                    ),
                ),
                        Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 3 ; i++) i == slideIndex ? _buildPageIndicator(true): _buildPageIndicator(false),
                    ],),
                ),


              ]
          ),
          bottomSheet: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 15),
            color: Colors.grey[300],
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget>[
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginApp()));
                  } ,
                      child: Text('Login',style: TextStyle(color: Colors.black,fontSize: 18),)
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterPage()),);} ,
                      child: Text('Register',style: TextStyle(color: Colors.black,fontSize: 18),)),
                ]
            ),
          ),
        )
    );
  }
}




