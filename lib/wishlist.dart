import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {

  Color red = Color(0xffDB90000);
  Color grey = Color(0xff7D7699);
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
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){},
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        Container(
                                         // padding: const EdgeInsets.all(3),
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
                                            '(available)',
                                            style: TextStyle(color: black),
                                          ),
                                        ),
                                      ],
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    // padding: const EdgeInsets.all(3),
                                      child: Text(
                                        'This is sample description',
                                        style: TextStyle(
                                            color: grey,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w900),
                                      )
                                  ),
                                  addedCart[index] != 0
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
                                ],
                              ),

                              
                            ],
                          ),
                        ),
                      ),
                    ),
                    /*Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                height: 0.6,
                                color: black,
                              ),*/
                  ],
                ),
              );
            }),
      ),
    );
  }
}
