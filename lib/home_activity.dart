
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'food_ctgry_tabview.dart';

class HomeActivity extends StatefulWidget {
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


  List<Tab> tabs = <Tab>[
    Tab(child: ListTile(leading: CircleAvatar(child: Image(image: AssetImage('assets/images/idly.png'),),),
                        title: Text('lunch'),),),
    Tab(child: ListTile(leading: CircleAvatar(child: Image(image: AssetImage('assets/images/idly.png'),),),
      title: Text('lunch'),),),
    Tab(child: ListTile(leading: CircleAvatar(child: Image(image: AssetImage('assets/images/idly.png'),),),
      title: Text('lunch'),),),
    Tab(child: ListTile(leading: CircleAvatar(child: Image(image: AssetImage('assets/images/idly.png'),),),
      title: Text('lunch'),),),
  ];

  List foodList = [
    "idly",
    "idly",
    "idly",
    "idly",
    "idly",
    "idly",
    "Dosa",
  ];


  List<int> addedCart = [];

  bool listVisible = true;
  bool gridVisible = false;
  bool bottomSheetVisible = true;

  String tabText = "";
  int cartItemCount = 0;
  double opacity = 0.0;
  bool _switchValue = false;

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
    setState(() {
      tabText = tabs[0].text!;
      if (cartItemCount <= 0) {
        opacity = 0.0;
        bottomSheetVisible = false;
      } else {
        opacity = 1.0;
      }
      //Getting item count from added food
      for (int i = 0; i <= foodList.length; i++) {
        addedCart.add(0);
      }
    });
    // TODO: implement initState
    super.initState();
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(statusBarColor: red));
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodCateTab()));
              },
              icon: Icon(Icons.menu),
            ),
            title: Text('HOME'),
            actions: [
              Stack(
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart),
                    iconSize: 28,
                  ),
                  Positioned(
                    top: 4,
                    right: 8,
                    child: Opacity(
                      opacity: 1.0,
                      child: GestureDetector(
                        onTap: () {},
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
                              height: 170,
                                 child: Stack(
                                    children: <Widget>[
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height,
                                        margin: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image:
                                              AssetImage("${foodItems[index]}"),
                                            )),
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
                                        top: 11,
                                        left: 9,
                                        child: Center(
                                            child: Text(
                                              '${rate[index]}%',
                                              style:
                                              TextStyle(color: black, fontSize: 13),
                                            )),
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

                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                  //  color: black,
                    child: Column(
                      children: [
                        Container(
                          child: DefaultTabController(
                            length: 4,
                            child: Column(
                              children: [
                                Container(
                                  width:300,
                                  child: TabBar(tabs: [Tab(text: 'lunch',),Tab(text: 'lunch',),Tab(text: 'lunch',),Tab(text: 'lunch',)],),
                                  // child: TabBar(tabs:[  Tab(child: ListTile(leading: CircleAvatar(child: Image(image: AssetImage('assets/images/idly.png'),),),
                                  //   title: Text('lunch'),),),
                                  //   Tab(child: ListTile(leading: CircleAvatar(child: Image(image: AssetImage('assets/images/idly.png'),),),
                                  //     title: Text('lunch'),),),
                                  //   Tab(child: ListTile(leading: CircleAvatar(child: Image(image: AssetImage('assets/images/idly.png'),),),
                                  //     title: Text('lunch'),),),
                                  //   Tab(child: ListTile(leading: CircleAvatar(child: Image(image: AssetImage('assets/images/idly.png'),),),
                                  //     title: Text('lunch'),),),]),

                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height,
                                  child: TabBarView(
                                      children:tabs.map((Tab tab) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    child: Column(
                                      children: <Widget>[
                                        //Header
                                        Container(
                                            padding: EdgeInsets.all(10),
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  '${tabText} list',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w800),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.centerRight,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                      children: <Widget>[
                                                        Container(
                                                            child: IconButton(
                                                              icon: Icon(Icons.grid_view),
                                                              onPressed: () {
                                                                setState(() {
                                                                  listVisible = false;
                                                                  gridVisible = true;
                                                                });
                                                              },
                                                            )),
                                                        Container(
                                                            child: IconButton(
                                                              icon: Icon(Icons.list),
                                                              onPressed: () {
                                                                setState(() {
                                                                  listVisible = true;
                                                                  gridVisible = false;
                                                                });
                                                              },
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        //ListView
                                        Visibility(
                                          visible: listVisible,
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            height:
                                            MediaQuery.of(context).size.height * 0.76,
                                            child: ListView.builder(
                                                itemCount: foodList.length,
                                                itemBuilder: (context, index) {
                                                  return Card(
                                                    elevation: 2,
                                                    child: ListTile(
                                                      onTap: (){
                                                        // Navigator.push(
                                                        //     context, MaterialPageRoute(builder: (context) => ProductDetials()));
                                                      },
                                                      trailing: addedCart[index] != 0
                                                          ? Container(
                                                        margin:
                                                        EdgeInsets.only(top: 17),
                                                        color: red,
                                                        width: 65,
                                                        height: 30,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: <Widget>[
                                                            GestureDetector(
                                                                onTap: () {
                                                                  print("-");
                                                                  setState(() {
                                                                    addedCart[index] = addedCart[index] - 1;
                                                                    cartItemCount--;
                                                                    if (cartItemCount == 0) {
                                                                      opacity = 0.0;
                                                                      bottomSheetVisible = false;
                                                                    }
                                                                  });
                                                                },
                                                                child: Icon(
                                                                  Icons.remove,
                                                                  color: white,
                                                                )),
                                                            Text(
                                                              '${addedCart[index]}',
                                                              style: TextStyle(
                                                                  color: white,
                                                                  fontSize: 14),
                                                            ),
                                                            GestureDetector(
                                                                onTap: () {
                                                                  setState(() {
                                                                    bottomSheetVisible = true;
                                                                    addedCart[index] =
                                                                        addedCart[
                                                                        index] + 1;
                                                                    cartItemCount++;
                                                                  });
                                                                },
                                                                child: Icon(
                                                                  Icons.add,
                                                                  color: white,
                                                                )),
                                                          ],
                                                        ),
                                                      )
                                                          : Container(
                                                        margin:
                                                        EdgeInsets.only(top: 17),
                                                        width: 65,
                                                        height: 30,
                                                        child: RaisedButton(
                                                          color: red,
                                                          onPressed: () {
                                                            setState(() {
                                                              print(foodList);
                                                              cartItemCount++;
                                                              addedCart[index] =
                                                                  addedCart[index] +
                                                                      1;
                                                              if (cartItemCount > 0) {
                                                                opacity = 1.0;
                                                                bottomSheetVisible = true;
                                                              } else {
                                                                opacity = 0.0;
                                                                bottomSheetVisible = false;
                                                              }
                                                            });
                                                          },
                                                          child: Text(
                                                            "ADD",
                                                            style: TextStyle(
                                                                color: white,
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                      ),
                                                      title: Row(
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets.all(3),
                                                            child: Text(
                                                                '${foodList[index].toString()}'),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.all(3),
                                                            decoration: BoxDecoration(
                                                                color: white,
                                                                border: Border.all()),
                                                            padding: EdgeInsets.all(3.5),
                                                            child: CircleAvatar(
                                                              radius: 3.5,
                                                              backgroundColor: Colors.green,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets.all(3),
                                                            child: Text(
                                                              '(available)',
                                                              style: TextStyle(
                                                                  color: black,
                                                                  fontSize: 14),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      subtitle: Column(
                                                        children: <Widget>[
                                                          Container(
                                                              alignment:
                                                              Alignment.centerLeft,
                                                              width: double.infinity,
                                                              child: Text(
                                                                'This is sample description helloo how are you uuuuuuuuuuuuuu',
                                                                style: TextStyle(
                                                                    color: grey,
                                                                    fontSize: 11,
                                                                    fontWeight:
                                                                    FontWeight.w900),
                                                              )),
                                                          Container(
                                                            margin: EdgeInsets.only(top: 8),
                                                            alignment: Alignment.centerLeft,
                                                            child: Text(
                                                              'RS: 75',
                                                              style: TextStyle(
                                                                  color: black,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                  FontWeight.w900),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ),
                                        //Gridview
                                        Visibility(
                                            visible: gridVisible,
                                            child: Container(
                                              width: MediaQuery.of(context).size.width,
                                              height:
                                              MediaQuery.of(context).size.height * 0.76,
                                              child: GridView.builder(
                                                padding: EdgeInsets.all(7),
                                                gridDelegate:
                                                SliverGridDelegateWithMaxCrossAxisExtent(
                                                    maxCrossAxisExtent: 200,
                                                    childAspectRatio: 3 / 3,
                                                    crossAxisSpacing: 20,
                                                    mainAxisSpacing: 20),
                                                itemCount: foodList.length,
                                                itemBuilder: (context, index) {
                                                  return GestureDetector(
                                                    onTap: (){
                                                      // Navigator.push(
                                                      //     context, MaterialPageRoute(builder: (context) => ProductDetials()));
                                                    },
                                                    child: Card(
                                                      elevation: 2,
                                                      child: Container(
                                                        margin: EdgeInsets.all(7),
                                                        child:Column(
                                                          children: <Widget>[
                                                            Row(
                                                              children:<Widget> [
                                                                Padding(
                                                                  padding:
                                                                  const EdgeInsets.all(3),
                                                                  child: Text(
                                                                      '${foodList[index].toString()}'),
                                                                ),
                                                                Expanded(
                                                                    child: Container(
                                                                      alignment: Alignment.centerRight,
                                                                      child: Container(
                                                                        margin: EdgeInsets.all(3),
                                                                        decoration: BoxDecoration(
                                                                            color: white,
                                                                            border: Border.all()),
                                                                        padding: EdgeInsets.all(3.5),
                                                                        child: CircleAvatar(
                                                                          radius: 3.5,
                                                                          backgroundColor: Colors.green,
                                                                        ),
                                                                      ),
                                                                    )
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                'This is sample description helloo how are you uuuuuuuuuuuuuu',
                                                                style: TextStyle(
                                                                    color: grey,
                                                                    fontSize: 11,
                                                                    fontWeight:
                                                                    FontWeight.w900),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Row(
                                                                children:<Widget> [
                                                                  Padding(
                                                                    padding:
                                                                    const EdgeInsets.all(3),
                                                                    child: Text(
                                                                        'RS: 75'),
                                                                  ),
                                                                  Expanded(
                                                                      child: addedCart[index] != 0 ?
                                                                      Container(
                                                                        alignment: Alignment.centerRight,
                                                                        child: Container(
                                                                          color: red,
                                                                          width: 65,
                                                                          height: 30,
                                                                          child: Row(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceBetween,
                                                                            children: <Widget>[
                                                                              GestureDetector(
                                                                                  onTap: () {
                                                                                    print("-");
                                                                                    setState(() {
                                                                                      addedCart[index] = addedCart[index] - 1;
                                                                                      cartItemCount--;
                                                                                      if (cartItemCount == 0) {
                                                                                        opacity = 0.0;
                                                                                        bottomSheetVisible = false;
                                                                                      }
                                                                                    });
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.remove,
                                                                                    color: white,
                                                                                  )),
                                                                              Text(
                                                                                '${addedCart[index]}',
                                                                                style: TextStyle(
                                                                                    color: white,
                                                                                    fontSize: 14),
                                                                              ),
                                                                              GestureDetector(
                                                                                  onTap: () {
                                                                                    setState(() {
                                                                                      bottomSheetVisible = true;
                                                                                      addedCart[index] =
                                                                                          addedCart[
                                                                                          index] +
                                                                                              1;
                                                                                      cartItemCount++;
                                                                                    });
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.add,
                                                                                    color: white,
                                                                                  )),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ):
                                                                      Container(
                                                                          alignment: Alignment.centerRight,
                                                                          child: Container(
                                                                            width: 65,
                                                                            height: 30,
                                                                            child: RaisedButton(
                                                                              color: red,
                                                                              onPressed: () {
                                                                                setState(() {
                                                                                  print(foodList);
                                                                                  cartItemCount++;
                                                                                  addedCart[index] =
                                                                                      addedCart[index] +
                                                                                          1;
                                                                                  if (cartItemCount > 0) {
                                                                                    bottomSheetVisible = true;
                                                                                    opacity = 1.0;
                                                                                  } else {
                                                                                    opacity = 0.0;
                                                                                    bottomSheetVisible = false;
                                                                                  }
                                                                                });
                                                                              },
                                                                              child: Text(
                                                                                "ADD",
                                                                                style: TextStyle(
                                                                                    color: white,
                                                                                    fontSize: 12),
                                                                              ),
                                                                            ),
                                                                          )
                                                                      )
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            )),
                                      ],
                                    ));
                              }).toList(),
                            ),
                            ),
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

                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                //ListView Items

              ],
            )
    )
                )]))
    ));
  }
}








































// import 'dart:async';
// import 'dart:convert';
// import 'package:alakarte/menuPage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import 'food_ctgry_tabview.dart';
// import 'order_confirmation.dart';
//
// class HomeActivity extends StatefulWidget {
//   const HomeActivity({Key? key}) : super(key: key);
//   @override
//   _HomeActivityState createState() => _HomeActivityState();
// }
//
// class _HomeActivityState extends State<HomeActivity> {
//   Color red = Color(0xffDB90000);
//   Color grey = Color(0xff7EABB7);
//   Color white = Color(0xffFFFFFF);
//   Color black = Color(0xff000000);
//
//   List foodItems = [
//     "assets/images/idly.jpg",
//     "assets/images/biriyani.jpg",
//     "assets/images/parotta.jpg",
//     "assets/images/dosa.jpg"
//   ];
//
//   List rate = [20, 10, 15, 35];
//
//
//   List<Tab> tabs = <Tab>[
//     Tab(child: ListTile(leading: CircleAvatar(child: Image(image: AssetImage('assets/images/idly.png'),),),
//                         title: Text('lunch'),),),
//     Tab(child: ListTile(leading: CircleAvatar(child: Image(image: AssetImage('assets/images/idly.png'),),),
//       title: Text('lunch'),),),
//     Tab(child: ListTile(leading: CircleAvatar(child: Image(image: AssetImage('assets/images/idly.png'),),),
//       title: Text('lunch'),),),
//     Tab(child: ListTile(leading: CircleAvatar(child: Image(image: AssetImage('assets/images/idly.png'),),),
//       title: Text('lunch'),),),
//   ];
//
//   List foodList = [
//     "idly",
//     "idly",
//     "idly",
//     "idly",
//     "idly",
//     "idly",
//     "Dosa",
//   ];
//
//
//   List<int> addedCart = [];
//
//   bool listVisible = true;
//   bool gridVisible = false;
//   bool bottomSheetVisible = true;
//
//   String tabText = "";
//   int cartItemCount = 0;
//   double opacity = 0.0;
//   bool _switchValue = false;
//
//   int slideIndex = 0;
//   PageController _controller = PageController(initialPage: 0);
//   late Timer _timer;
//   Widget _buildPageIndicator(bool isCurrentPage) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 4.0),
//       height: isCurrentPage ? 10.0 : 7.0,
//       width: isCurrentPage ? 10.0 : 7.0,
//       decoration: BoxDecoration(
//         color: isCurrentPage ? red : grey,
//         borderRadius: BorderRadius.circular(10),
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//     setState(() {
//       tabText = tabs[0].text!;
//       if (cartItemCount <= 0) {
//         opacity = 0.0;
//         bottomSheetVisible = false;
//       } else {
//         opacity = 1.0;
//       }
//       //Getting item count from added food
//       for (int i = 0; i <= foodList.length; i++) {
//         addedCart.add(0);
//       }
//     });
//     // TODO: implement initState
//     super.initState();
//     // SystemChrome.setSystemUIOverlayStyle(
//     //     SystemUiOverlayStyle(statusBarColor: red));
//   }
//   @override
//   void dispose() {
//     super.dispose();
//     _timer.cancel();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//           //APP BAR
//           appBar: AppBar(
//             leading: IconButton(
//               onPressed: (){
//                 Navigator.pop(context);
//               },
//               icon: Icon(CupertinoIcons.back),
//             ),
//             bottom: PreferredSize(
//               preferredSize: Size.fromHeight(50.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: white, borderRadius: BorderRadius.circular(6)),
//                 padding: EdgeInsets.only(
//                   left: 6,
//                 ),
//                 width: double.infinity,
//                 alignment: Alignment.center,
//                 height: 40,
//                 margin: EdgeInsets.all(10),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                       contentPadding: EdgeInsets.all(5),
//                       hintText: "Search",
//                       border: InputBorder.none,
//                       suffixIcon: IconButton(
//                         onPressed: () {},
//                         icon: Icon(Icons.search),
//                       )),
//                 ),
//               ),
//             ),
//             backgroundColor: red,
//             centerTitle: true,
//             title: Text('HOME'),
//             actions: [
//               Stack(
//                 children: <Widget>[
//                   IconButton(
//                     onPressed: () {
//
//                     },
//                     icon: Icon(Icons.shopping_cart),
//                     iconSize: 28,
//                   ),
//                   Positioned(
//                     top: 4,
//                     right: 8,
//                     child: Opacity(
//                       opacity: 1.0,
//                       child: GestureDetector(
//                         onTap: () {
//                         },
//                         child: CircleAvatar(
//                           backgroundColor: grey,
//                           radius: 9,
//                           child: Padding(
//                             padding: const EdgeInsets.only(bottom: 2),
//                             child: Text(
//                               "5",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 11,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           //MAIN SCREEN
//           body: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height * 0.9,
//             child: ListView(
//               children: <Widget>[
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height * 0.2,
//                     child: PageView.builder(
//                           controller: _controller,
//                           onPageChanged: (index) {
//                             setState(() {
//                               slideIndex = index;
//                             });
//                           },
//                           itemCount: foodItems.length,
//                           scrollDirection: Axis.horizontal,
//                           itemBuilder: (context, index) {
//                             return Container(
//                               height: 170,
//                                  child: Stack(
//                                     children: <Widget>[
//                                       Container(
//                                         width: MediaQuery.of(context).size.width,
//                                         height: MediaQuery.of(context).size.height,
//                                         margin: EdgeInsets.all(6),
//                                         decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(10),
//                                             image: DecorationImage(
//                                               fit: BoxFit.cover,
//                                               image:
//                                               AssetImage("${foodItems[index]}"),
//                                             )),
//                                       ),
//                                       Positioned(
//                                           child: Icon(
//                                             Icons.brightness_5_sharp,
//                                             color: Color(0xffF7CE16),
//                                             size: 40,
//                                           )),
//                                       Positioned(
//                                           top: 5,
//                                           left: 5,
//                                           child: CircleAvatar(
//                                             backgroundColor: Color(0xffF7CE16),
//                                             radius: 13,
//                                           )),
//                                       Positioned(
//                                         top: 11,
//                                         left: 9,
//                                         child: Center(
//                                             child: Text(
//                                               '${rate[index]}%',
//                                               style:
//                                               TextStyle(color: black, fontSize: 13),
//                                             )),
//                                       ),
//
//                                 ],
//                               )
//                             );
//                           }),
//                     ),
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       for (int i = 0; i < foodItems.length; i++)
//                         i == slideIndex
//                             ? _buildPageIndicator(true)
//                             : _buildPageIndicator(false),
//                     ],
//                   ),
//                 ),
//                 //Page indictors
//                 Container(
//                   margin: EdgeInsets.only(left: 10, right: 10,top: 10),
//                   height: 0.3,
//                   color: black,
//                 ),
//                 //Container Text
//                 Container(
//                   margin: EdgeInsets.all(10),
//                   height: 20,
//                   width: double.infinity,
//                   child: Text(
//                     'BEST SALE',
//                     style: TextStyle(color: black, fontSize: 16),
//                   ),
//                 ),
//                 //ListView Items
//                 DefaultTabController(
//                     length: 5,
//                     child: Column(
//                       children: [
//                         Container(
//                           child: TabBar(tabs: tabs,isScrollable: true,),
//
//                         ),
//                         Card(
//                           child: Container(
//                             margin: EdgeInsets.all(15),
//                             width: MediaQuery.of(context).size.width,
//                             height: MediaQuery.of(context).size.height,
//                             child: TabBarView(children:tabs.map((Tab tab) {
//                                 return Container(
//                                     width: MediaQuery.of(context).size.width,
//                                     height: MediaQuery.of(context).size.height,
//                                     child: Column(
//                                       children: <Widget>[
//                                         //Header
//                                         Container(
//                                             padding: EdgeInsets.all(10),
//                                             height: 50,
//                                             child: Row(
//                                               mainAxisAlignment: MainAxisAlignment.start,
//                                               children: <Widget>[
//                                                 Text(
//                                                   '${tabText} list',
//                                                   style: TextStyle(
//                                                       fontSize: 18,
//                                                       fontWeight: FontWeight.w800),
//                                                 ),
//                                                 Expanded(
//                                                   child: Container(
//                                                     alignment: Alignment.centerRight,
//                                                     child: Row(
//                                                       mainAxisAlignment:
//                                                       MainAxisAlignment.end,
//                                                       children: <Widget>[
//                                                         Container(
//                                                             child: IconButton(
//                                                               icon: Icon(Icons.grid_view),
//                                                               onPressed: () {
//                                                                 setState(() {
//                                                                   listVisible = false;
//                                                                   gridVisible = true;
//                                                                 });
//                                                               },
//                                                             )),
//                                                         Container(
//                                                             child: IconButton(
//                                                               icon: Icon(Icons.list),
//                                                               onPressed: () {
//                                                                 setState(() {
//                                                                   listVisible = true;
//                                                                   gridVisible = false;
//                                                                 });
//                                                               },
//                                                             )),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             )),
//                                         //ListView
//                                         Visibility(
//                                           visible: listVisible,
//                                           child: Container(
//                                             width: MediaQuery.of(context).size.width,
//                                             height:
//                                             MediaQuery.of(context).size.height * 0.76,
//                                             child: ListView.builder(
//                                                 itemCount: foodList.length,
//                                                 itemBuilder: (context, index) {
//                                                   return Card(
//                                                     elevation: 2,
//                                                     child: ListTile(
//                                                       onTap: (){
//                                                         // Navigator.push(
//                                                         //     context, MaterialPageRoute(builder: (context) => ProductDetials()));
//                                                       },
//                                                       trailing: addedCart[index] != 0
//                                                           ? Container(
//                                                         margin:
//                                                         EdgeInsets.only(top: 17),
//                                                         color: red,
//                                                         width: 65,
//                                                         height: 30,
//                                                         child: Row(
//                                                           mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                           children: <Widget>[
//                                                             GestureDetector(
//                                                                 onTap: () {
//                                                                   print("-");
//                                                                   setState(() {
//                                                                     addedCart[index] = addedCart[index] - 1;
//                                                                     cartItemCount--;
//                                                                     if (cartItemCount == 0) {
//                                                                       opacity = 0.0;
//                                                                       bottomSheetVisible = false;
//                                                                     }
//                                                                   });
//                                                                 },
//                                                                 child: Icon(
//                                                                   Icons.remove,
//                                                                   color: white,
//                                                                 )),
//                                                             Text(
//                                                               '${addedCart[index]}',
//                                                               style: TextStyle(
//                                                                   color: white,
//                                                                   fontSize: 14),
//                                                             ),
//                                                             GestureDetector(
//                                                                 onTap: () {
//                                                                   setState(() {
//                                                                     bottomSheetVisible = true;
//                                                                     addedCart[index] =
//                                                                         addedCart[
//                                                                         index] + 1;
//                                                                     cartItemCount++;
//                                                                   });
//                                                                 },
//                                                                 child: Icon(
//                                                                   Icons.add,
//                                                                   color: white,
//                                                                 )),
//                                                           ],
//                                                         ),
//                                                       )
//                                                           : Container(
//                                                         margin:
//                                                         EdgeInsets.only(top: 17),
//                                                         width: 65,
//                                                         height: 30,
//                                                         child: RaisedButton(
//                                                           color: red,
//                                                           onPressed: () {
//                                                             setState(() {
//                                                               print(foodList);
//                                                               cartItemCount++;
//                                                               addedCart[index] =
//                                                                   addedCart[index] +
//                                                                       1;
//                                                               if (cartItemCount > 0) {
//                                                                 opacity = 1.0;
//                                                                 bottomSheetVisible = true;
//                                                               } else {
//                                                                 opacity = 0.0;
//                                                                 bottomSheetVisible = false;
//                                                               }
//                                                             });
//                                                           },
//                                                           child: Text(
//                                                             "ADD",
//                                                             style: TextStyle(
//                                                                 color: white,
//                                                                 fontSize: 12),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       title: Row(
//                                                         children: <Widget>[
//                                                           Padding(
//                                                             padding:
//                                                             const EdgeInsets.all(3),
//                                                             child: Text(
//                                                                 '${foodList[index].toString()}'),
//                                                           ),
//                                                           Container(
//                                                             margin: EdgeInsets.all(3),
//                                                             decoration: BoxDecoration(
//                                                                 color: white,
//                                                                 border: Border.all()),
//                                                             padding: EdgeInsets.all(3.5),
//                                                             child: CircleAvatar(
//                                                               radius: 3.5,
//                                                               backgroundColor: Colors.green,
//                                                             ),
//                                                           ),
//                                                           Padding(
//                                                             padding:
//                                                             const EdgeInsets.all(3),
//                                                             child: Text(
//                                                               '(available)',
//                                                               style: TextStyle(
//                                                                   color: black,
//                                                                   fontSize: 14),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                       subtitle: Column(
//                                                         children: <Widget>[
//                                                           Container(
//                                                               alignment:
//                                                               Alignment.centerLeft,
//                                                               width: double.infinity,
//                                                               child: Text(
//                                                                 'This is sample description helloo how are you uuuuuuuuuuuuuu',
//                                                                 style: TextStyle(
//                                                                     color: grey,
//                                                                     fontSize: 11,
//                                                                     fontWeight:
//                                                                     FontWeight.w900),
//                                                               )),
//                                                           Container(
//                                                             margin: EdgeInsets.only(top: 8),
//                                                             alignment: Alignment.centerLeft,
//                                                             child: Text(
//                                                               'RS: 75',
//                                                               style: TextStyle(
//                                                                   color: black,
//                                                                   fontSize: 14,
//                                                                   fontWeight:
//                                                                   FontWeight.w900),
//                                                             ),
//                                                           )
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   );
//                                                 }),
//                                           ),
//                                         ),
//                                         //Gridview
//                                         Visibility(
//                                             visible: gridVisible,
//                                             child: Container(
//                                               width: MediaQuery.of(context).size.width,
//                                               height:
//                                               MediaQuery.of(context).size.height * 0.76,
//                                               child: GridView.builder(
//                                                 padding: EdgeInsets.all(7),
//                                                 gridDelegate:
//                                                 SliverGridDelegateWithMaxCrossAxisExtent(
//                                                     maxCrossAxisExtent: 200,
//                                                     childAspectRatio: 3 / 3,
//                                                     crossAxisSpacing: 20,
//                                                     mainAxisSpacing: 20),
//                                                 itemCount: foodList.length,
//                                                 itemBuilder: (context, index) {
//                                                   return GestureDetector(
//                                                     onTap: (){
//                                                       // Navigator.push(
//                                                       //     context, MaterialPageRoute(builder: (context) => ProductDetials()));
//                                                     },
//                                                     child: Card(
//                                                       elevation: 2,
//                                                       child: Container(
//                                                         margin: EdgeInsets.all(7),
//                                                         child:Column(
//                                                           children: <Widget>[
//                                                             Row(
//                                                               children:<Widget> [
//                                                                 Padding(
//                                                                   padding:
//                                                                   const EdgeInsets.all(3),
//                                                                   child: Text(
//                                                                       '${foodList[index].toString()}'),
//                                                                 ),
//                                                                 Expanded(
//                                                                     child: Container(
//                                                                       alignment: Alignment.centerRight,
//                                                                       child: Container(
//                                                                         margin: EdgeInsets.all(3),
//                                                                         decoration: BoxDecoration(
//                                                                             color: white,
//                                                                             border: Border.all()),
//                                                                         padding: EdgeInsets.all(3.5),
//                                                                         child: CircleAvatar(
//                                                                           radius: 3.5,
//                                                                           backgroundColor: Colors.green,
//                                                                         ),
//                                                                       ),
//                                                                     )
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                             Container(
//                                                               child: Text(
//                                                                 'This is sample description helloo how are you uuuuuuuuuuuuuu',
//                                                                 style: TextStyle(
//                                                                     color: grey,
//                                                                     fontSize: 11,
//                                                                     fontWeight:
//                                                                     FontWeight.w900),
//                                                               ),
//                                                             ),
//                                                             Expanded(
//                                                               child: Row(
//                                                                 children:<Widget> [
//                                                                   Padding(
//                                                                     padding:
//                                                                     const EdgeInsets.all(3),
//                                                                     child: Text(
//                                                                         'RS: 75'),
//                                                                   ),
//                                                                   Expanded(
//                                                                       child: addedCart[index] != 0 ?
//                                                                       Container(
//                                                                         alignment: Alignment.centerRight,
//                                                                         child: Container(
//                                                                           color: red,
//                                                                           width: 65,
//                                                                           height: 30,
//                                                                           child: Row(
//                                                                             mainAxisAlignment:
//                                                                             MainAxisAlignment
//                                                                                 .spaceBetween,
//                                                                             children: <Widget>[
//                                                                               GestureDetector(
//                                                                                   onTap: () {
//                                                                                     print("-");
//                                                                                     setState(() {
//                                                                                       addedCart[index] = addedCart[index] - 1;
//                                                                                       cartItemCount--;
//                                                                                       if (cartItemCount == 0) {
//                                                                                         opacity = 0.0;
//                                                                                         bottomSheetVisible = false;
//                                                                                       }
//                                                                                     });
//                                                                                   },
//                                                                                   child: Icon(
//                                                                                     Icons.remove,
//                                                                                     color: white,
//                                                                                   )),
//                                                                               Text(
//                                                                                 '${addedCart[index]}',
//                                                                                 style: TextStyle(
//                                                                                     color: white,
//                                                                                     fontSize: 14),
//                                                                               ),
//                                                                               GestureDetector(
//                                                                                   onTap: () {
//                                                                                     setState(() {
//                                                                                       bottomSheetVisible = true;
//                                                                                       addedCart[index] =
//                                                                                           addedCart[
//                                                                                           index] +
//                                                                                               1;
//                                                                                       cartItemCount++;
//                                                                                     });
//                                                                                   },
//                                                                                   child: Icon(
//                                                                                     Icons.add,
//                                                                                     color: white,
//                                                                                   )),
//                                                                             ],
//                                                                           ),
//                                                                         ),
//                                                                       ):
//                                                                       Container(
//                                                                           alignment: Alignment.centerRight,
//                                                                           child: Container(
//                                                                             width: 65,
//                                                                             height: 30,
//                                                                             child: RaisedButton(
//                                                                               color: red,
//                                                                               onPressed: () {
//                                                                                 setState(() {
//                                                                                   print(foodList);
//                                                                                   cartItemCount++;
//                                                                                   addedCart[index] =
//                                                                                       addedCart[index] +
//                                                                                           1;
//                                                                                   if (cartItemCount > 0) {
//                                                                                     bottomSheetVisible = true;
//                                                                                     opacity = 1.0;
//                                                                                   } else {
//                                                                                     opacity = 0.0;
//                                                                                     bottomSheetVisible = false;
//                                                                                   }
//                                                                                 });
//                                                                               },
//                                                                               child: Text(
//                                                                                 "ADD",
//                                                                                 style: TextStyle(
//                                                                                     color: white,
//                                                                                     fontSize: 12),
//                                                                               ),
//                                                                             ),
//                                                                           )
//                                                                       )
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   );
//                                                 },
//                                               ),
//                                             )),
//                                       ],
//                                     ));
//                               }).toList(),
//                             ),
//                           ),
//                         )
//                       ],
//                     ))
//                               ])
//                         // child: ListView.builder(
//                         //     itemCount: 8,
//                         //     itemBuilder: (context, index) {
//                               // return Column(
//                               //   children: <Widget>[
//                               //     Card(
//                               //       child: ListTile(
//                               //         onTap:(){
//                               //          // Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPage()));
//                               //         },
//                               //         trailing: Container(
//                               //           margin:EdgeInsets.only(left: 55,top: 20),
//                               //           child: GestureDetector(
//                               //               child: Icon(Icons.arrow_forward_ios,size: 18,color: Colors.grey,)
//                               //           ),
//                               //         ),
//                               //         title: Row(
//                               //           children: <Widget>[
//                               //             Padding(
//                               //               padding: const EdgeInsets.all(3),
//                               //               child: Text('Masala roast'),
//                               //             ),
//                               //             Container(
//                               //               margin: EdgeInsets.all(3),
//                               //               decoration: BoxDecoration(
//                               //                   color: white, border: Border.all()),
//                               //               padding: EdgeInsets.all(3.5),
//                               //               child: CircleAvatar(
//                               //                 radius: 3.5,
//                               //                 backgroundColor: Colors.green,
//                               //               ),
//                               //             ),
//                               //             Row(children: <Widget>[
//                               //               Icon(
//                               //                 Icons.star,size: 18,
//                               //                 color: Color(0xffF7CE16),
//                               //               ),
//                               //               Text(
//                               //                 " 4.5",
//                               //                 style: TextStyle(color: black),
//                               //               )
//                               //             ]),
//                               //           ],
//                               //         ),
//                               //         subtitle: Column(
//                               //           crossAxisAlignment:CrossAxisAlignment.start,
//                               //           children: <Widget>[
//                               //             Container(
//                               //               padding: const EdgeInsets.all(3),
//                               //               child: Text(
//                               //                 'Rs:70',
//                               //                 style: TextStyle(color: black,fontSize: 17),
//                               //               ),
//                               //             ),
//                               //             Container(
//                               //                 alignment: Alignment.centerLeft,
//                               //                 width: double.infinity,
//                               //                 child: Text(
//                               //                   'This is sample description',
//                               //                   style: TextStyle(
//                               //                       color: grey,
//                               //                       fontSize: 13,
//                               //                       fontWeight: FontWeight.w900),
//                               //                 ))
//                               //           ],
//                               //         ),
//                               //       ),
//                               //     ),
//                               //     /*Container(
//                               //       margin: EdgeInsets.only(left: 10, right: 10),
//                               //       height: 0.6,
//                               //       color: black,
//                               //     ),*/
//                               //   ],
//                               // );
//                            // }
//                            // ),
//                       ))
//
//     );}
// }
