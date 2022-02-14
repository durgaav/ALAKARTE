import 'package:alakarte/checkout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  Color red = Color(0xffDB90000);
  Color grey = Color(0xff7EABB7);
  Color white = Color(0xffFFFFFF);
  Color black = Color(0xff000000);
  bool bottomSheetVisible = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:WillPopScope(
          onWillPop: () async{
            print("poppp");
            return false;
          },
          child: Scaffold(
              bottomSheet: bottomSheet(),
              appBar: AppBar(
                backgroundColor: red,
                centerTitle: true,
                leading: IconButton(
                  onPressed: (){
                    Navigator.of(context).pop(context);
                  },
                  icon: Icon(CupertinoIcons.back),
                ),
                title: Text('CART'),
              ),
              body: Container(
                padding: EdgeInsets.only(bottom: 50),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.9,
                child: SingleChildScrollView(
                  child: Column(
                    children:<Widget> [
                      Container(
                        color: grey,
                        margin: EdgeInsets.all(7),
                        padding: EdgeInsets.only(left : 10),
                        height: 45,
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width,
                        child: Text("YOUR ORDER",style: TextStyle(fontWeight: FontWeight.w800,color: black,fontSize: 13),),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.35,
                          width: MediaQuery.of(context).size.width,
                        child:Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                              children:<Widget>
                              [
                                Container(
                                  height:200,
                                  width: MediaQuery.of(context).size.width,
                                  child: Scrollbar(
                                    thickness: 5,
                                    child: ListView.builder(
                                      itemCount : 4,
                                        itemBuilder: (context , index){
                                          return Container(
                                            height:100,
                                            child: Card(
                                              child: ListTile(
                                                title:Row(
                                                  children:<Widget> [
                                                    Text("Rava dosa"),
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
                                                  ],
                                                ),
                                                subtitle: Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  alignment: Alignment.topLeft,
                                                  child: Container(
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

                                                              });
                                                            },
                                                            child: Icon(
                                                              Icons.remove,
                                                              color: white,
                                                            )),
                                                        Text(
                                                          '2',
                                                          style: TextStyle(
                                                              color: white,
                                                              fontSize: 14),
                                                        ),
                                                        GestureDetector(
                                                            onTap: () {
                                                              setState(() {

                                                              });
                                                            },
                                                            child: Icon(
                                                              Icons.add,
                                                              color: white,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                trailing: Column(
                                                  children: [
                                                    Text("RS: 100"),
                                                    Text("(10*10)",style: TextStyle(color: Colors.black38,fontSize: 12)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    child: RaisedButton(
                                      color: red,
                                      onPressed: (){},
                                      child: Text('Add more items',style: TextStyle(fontSize: 16,color: white),),
                                    ),
                                  ),
                                ),
                              ]
                          ),
                      ),
                      Container(
                        color: grey,
                        margin: EdgeInsets.all(7),
                        padding: EdgeInsets.only(left : 10),
                        height: 45,
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width,
                        child: Text("BILL DETAILS",style: TextStyle(fontWeight: FontWeight.w800,color: black,fontSize: 13),),
                      ),

                      Column(
                        children: [
                          Card(
                            child: ListTile(
                              title: Text("Sub total"),
                              trailing: Text("RS: 400"),
                            ),
                          )
                        ],
                      ),

                      Card(
                        child: Column(
                          children: [
                          ListTile(
                              title: Text("Offer dicount"),
                              trailing: Text("RS: 000"),
                            ),
                            ListTile(
                              title: Text("Tax -14 (or) GST -12%"),
                              trailing: Text("RS: 100"),
                            ),
                            ListTile(
                              title: Text("Delivery charge"),
                              trailing: Text("RS: 050"),
                            ),
                          ],
                        ),
                      ),

                      Card(
                        child: ListTile(
                          title: Text("All Total"),
                          trailing: Text("RS: 550"),
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),
        ),
      );
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
              Icon(Icons.shopping_cart,size: 23.0,color: white,),
              Text(' Total = RS: 550',style: TextStyle(color: white,fontWeight: FontWeight.bold,fontSize: 13.5)),
              Expanded(
                child:GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> CheckoutPage()));
                  },
                  child: Container(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:<Widget> [
                          Text('Proceed to checkout',style: TextStyle(color: white,fontWeight: FontWeight.bold,fontSize: 13.5)),
                          IconButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> CheckoutPage()));
                              },
                              icon: Icon(Icons.arrow_forward,size: 23.0,color: white,)
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
