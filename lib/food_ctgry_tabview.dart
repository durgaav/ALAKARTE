
import 'package:alakarte/productdetials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cart_screen.dart';

class FoodCateTab extends StatefulWidget {
  const FoodCateTab({Key? key}) : super(key: key);
  @override
  _FoodCateTabState createState() => _FoodCateTabState();
}

class _FoodCateTabState extends State<FoodCateTab> {
  Color red = Color(0xffDB90000);
  Color grey = Color(0xff7EABB7);
  Color white = Color(0xffFFFFFF);
  Color black = Color(0xff000000);

  List<Tab> tabs = <Tab>[
    Tab(text: "Idly"),
    Tab(text: "Dosa"),
    Tab(text: "Biriyani"),
    Tab(text: "Variety rice"),
    Tab(text: "Chinees food"),
    Tab(text: "Chicken"),
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
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: tabs.length,
            child: Container(
              child: Builder(builder: (BuildContext context) {
                final TabController tabController =
                    DefaultTabController.of(context)!;
                tabController.addListener(() {
                  if (!tabController.indexIsChanging) {
                    setState(() {
                      tabText = tabs[tabController.index].text!;
                      print(tabText);
                    });
                    // Your code goes here.
                    // To get index of current tab use tabController.index
                  }
                });
                return Scaffold(
                  appBar: AppBar(
                    actions: [
                      Stack(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));
                            },
                            icon: Icon(Icons.shopping_cart),
                            iconSize: 28,
                          ),
                          Positioned(
                            top: 4,
                            right: 8,
                            child: Opacity(
                              opacity: opacity,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));
                                },
                                child: CircleAvatar(
                                  backgroundColor: grey,
                                  radius: 9,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 2),
                                    child: Text(
                                      "$cartItemCount",
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
                    backgroundColor: red,
                    centerTitle: true,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.of(context,rootNavigator: true).pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    title: Text("${tabText.toUpperCase()}"),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(50.0),
                      child: Container(
                        color: Colors.red,
                        child: TabBar(
                          isScrollable: true,
                          tabs: tabs,
                        ),
                      ),
                    ),
                  ),
                  body: TabBarView(
                    children: tabs.map((Tab tab) {
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
                                              Navigator.push(
                                                  context, MaterialPageRoute(builder: (context) => ProductDetials()));
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
                                            Navigator.push(
                                                context, MaterialPageRoute(builder: (context) => ProductDetials()));
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
                  bottomSheet: bottomSheet()
                );
              }),
            )));
  }
  Widget bottomSheet(){
    if (bottomSheetVisible){
      return BottomSheet(
          onClosing:(){}, builder: (context){
            return Container(
              padding: EdgeInsets.only(bottom: 5,left: 10,right: 10),
              color: red,
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget>
                [
                  Icon(Icons.shopping_cart,size: 28.0,color: white,),
                  Text(' ${cartItemCount} items in cart',style: TextStyle(color: white,fontWeight: FontWeight.bold,fontSize: 13.5)),
                  Expanded(
                      child:GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));
                        },
                        child: Container(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children:<Widget> [
                                  Text('Proceed to cart',style: TextStyle(color: white,fontWeight: FontWeight.bold,fontSize: 13.5)),
                                  IconButton(
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));
                                      },
                                      icon: Icon(Icons.arrow_forward,size: 28.0,color: white,)
                                  )
                                ],
                              ),
                            ),
                          ),
                      ),

                  ),
                ],
              ),
            );
      });
    }else{
      return Container(child: Text(''),);
    }
  }
}
