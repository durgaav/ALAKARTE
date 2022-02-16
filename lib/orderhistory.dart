import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  Color red = Color(0xffDB90000);
  Color grey = Color(0xff7D7699);
  Color white = Color(0xffFFFFFF);
  Color black = Color(0xff000000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:  ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(left: 5,right: 5),
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(child: Text('Chicken Briyani',style: TextStyle(fontSize: 18),),),
                            Container(child: Text('(order placed)',style: TextStyle(fontSize: 13),),)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(child: Text('Order number-B144',style: TextStyle(fontSize: 13),),),
                            Container(child: Text('12-02-2022',style: TextStyle(fontSize: 15),),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      ),

    );
  }
}