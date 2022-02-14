import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class OrderConfirmation extends StatefulWidget {
  const OrderConfirmation({Key? key}) : super(key: key);

  @override
  _OrderConfirmationState createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  Color red = Color(0xffDB90000);
  Color grey = Color(0xff7EABB7);
  Color white = Color(0xffFFFFFF);
  Color black = Color(0xff000000);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: red,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text('ORDER CONFIRMATION'),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget> [
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: white,
                  child:Icon(
                      Icons.shopping_bag_outlined,
                      size: 80,
                      color: grey,
                    ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text("Thank you. Your Order has been Received",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800),)
              ),
              Container(
                margin:EdgeInsets.all(10),
                child: Card(
                  elevation: 1,
                  child: Container(
                    color: white,
                    margin:EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height*0.5,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text("ORDER DETAILS",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),)
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height*0.15,
                          width: MediaQuery.of(context).size.width,
                          child: Scrollbar(
                            isAlwaysShown: true,
                            child: ListView.builder(
                              itemCount: 3,
                                itemBuilder: (context , index){
                                  return ListTile(
                                    title: Text('Plain Dosa'),
                                    trailing: Text("RS : 100"),
                                  );
                                }
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text('Others'),
                          trailing: Text("RS : 050"),
                        ),
                        ListTile(
                          title: Text('Payment method'),
                          trailing: Text("Card"),
                        ),
                        ListTile(
                          title: Text('Total'),
                          trailing: Text("RS : 350",textAlign:TextAlign.start,),
                        ),

                        Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            child: RaisedButton(
                              color: red,
                              onPressed: (){},
                              child: Text('Continue Shoping',style: TextStyle(fontSize: 16,color: white),),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
