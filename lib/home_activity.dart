import 'dart:async';
import 'dart:convert';
import 'package:alakarte/menuPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'food_ctgry_tabview.dart';
import 'order_confirmation.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({Key? key}) : super(key: key);
  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  Color red = Color(0xffDB90000);
  Color grey = Color(0xff7EABB7);
  Color white = Color(0xffFFFFFF);
  Color black = Color(0xff000000);

  List foodItems = [
    "assets/images/idly.jpg",
    "assets/images/biriyani.jpg",
    "assets/images/parotta.jpg",
    "assets/images/dosa.jpg"
  ];

  List rate = [20, 10, 15, 35];

  int slideIndex = 0;
  PageController _controller = PageController(initialPage: 0);
  late Timer _timer;
  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: isCurrentPage ? 10.0 : 7.0,
      width: isCurrentPage ? 10.0 : 7.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? red : grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(statusBarColor: red));

   /* _timer = Timer.periodic(Duration(seconds: 5), (Timer timer)
    {
      if (slideIndex < 2) {
        slideIndex++;
      } else {
        slideIndex = 0;
      }

      _controller.animateToPage(
        slideIndex,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    });*/
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          //APP BAR
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: Container(
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(6)),
                padding: EdgeInsets.only(
                  left: 6,
                ),
                width: double.infinity,
                alignment: Alignment.center,
                height: 40,
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      hintText: "Search",
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search),
                      )),
                ),
              ),
            ),
            backgroundColor: red,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                /*Navigator.push(context, MaterialPageRoute(builder: (context)=> Sample()));*/
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderConfirmation()));
              },
              icon: Icon(Icons.menu),
            ),
            title: Text('HOME'),
            actions: [
              Stack(
                children: <Widget>[
                  IconButton(
                    onPressed: () {

                    },
                    icon: Icon(Icons.shopping_cart),
                    iconSize: 28,
                  ),
                  Positioned(
                    top: 4,
                    right: 8,
                    child: Opacity(
                      opacity: 1.0,
                      child: GestureDetector(
                        onTap: () {
                        },
                        child: CircleAvatar(
                          backgroundColor: grey,
                          radius: 9,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Text(
                              "5",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          //MAIN SCREEN
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            child: ListView(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                    child: PageView.builder(
                          controller: _controller,
                          onPageChanged: (index) {
                            setState(() {
                              slideIndex = index;
                            });
                          },
                          itemCount: foodItems.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 150,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:<Widget> [
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image:
                                              AssetImage("${foodItems[index]}"),
                                            )),
                                        height: 150,
                                        width: 160,
                                      ),
                                      Positioned(
                                          child: Icon(
                                            Icons.brightness_5_sharp,
                                            color: Color(0xffF7CE16),
                                            size: 40,
                                          )),
                                      Positioned(
                                          top: 5,
                                          left: 5,
                                          child: CircleAvatar(
                                            backgroundColor: Color(0xffF7CE16),
                                            radius: 13,
                                          )),
                                      Positioned(
                                        top: 6,
                                        left: 5,
                                        child: Center(
                                            child: Text(
                                              '${rate[index]}%',
                                              style:
                                              TextStyle(color: black, fontSize: 13),
                                            )),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image:
                                              AssetImage("${foodItems[index]}"),
                                            )),
                                        height: 150,
                                        width: 160,
                                      ),
                                      Positioned(
                                          child: Icon(
                                            Icons.brightness_5_sharp,
                                            color: Color(0xffF7CE16),
                                            size: 40,
                                          )),
                                      Positioned(
                                          top: 5,
                                          left: 5,
                                          child: CircleAvatar(
                                            backgroundColor: Color(0xffF7CE16),
                                            radius: 13,
                                          )),
                                      Positioned(
                                        top: 6,
                                        left: 5,
                                        child: Center(
                                            child: Text(
                                              '${rate[index]}%',
                                              style:
                                              TextStyle(color: black, fontSize: 13),
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            );
                          }),
                    ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < foodItems.length; i++)
                        i == slideIndex
                            ? _buildPageIndicator(true)
                            : _buildPageIndicator(false),
                    ],
                  ),
                ),
                //Page indictors
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10,top: 10),
                  height: 0.3,
                  color: black,
                ),
                //Container Text
                Container(
                  margin: EdgeInsets.all(10),
                  height: 20,
                  width: double.infinity,
                  child: Text(
                    'BEST SALE',
                    style: TextStyle(color: black, fontSize: 16),
                  ),
                ),
                //ListView Items
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.54,
                  child: ListView.builder(
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            Card(
                              child: ListTile(
                                onTap:(){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPage()));
                                },
                                trailing: Container(
                                  margin:EdgeInsets.only(left: 55,top: 20),
                                  child: GestureDetector(
                                      child: Icon(Icons.arrow_forward_ios,size: 18,color: Colors.grey,)
                                  ),
                                ),
                                title: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Text('Masala roast'),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: white, border: Border.all()),
                                      padding: EdgeInsets.all(3.5),
                                      child: CircleAvatar(
                                        radius: 3.5,
                                        backgroundColor: Colors.green,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Text(
                                        'Rs:70',
                                        style: TextStyle(color: black),
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  children: <Widget>[
                                    Row(children: <Widget>[
                                      Icon(
                                        Icons.star,
                                        color: Color(0xffF7CE16),
                                      ),
                                      Text(
                                        " 4.5",
                                        style: TextStyle(color: black),
                                      )
                                    ]),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        width: double.infinity,
                                        child: Text(
                                          'This is sample description',
                                          style: TextStyle(
                                              color: grey,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w900),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            /*Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              height: 0.6,
                              color: black,
                            ),*/
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
