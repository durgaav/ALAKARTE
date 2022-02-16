import 'package:alakarte/paymethod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {

  Color red = Color(0xffDB90000);
  Color black = Color(0xff000000);
  Color white = Color(0xffFFFFFF);
  Color grey = Color(0xff7D7699);

  bool bottomSheetVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar:AppBar(
        backgroundColor: red,
        centerTitle: true,
        title: Text('ORDERSUMMARY'),
        leading: IconButton(
          icon:Icon(CupertinoIcons.chevron_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              child: Container(
                color: white, padding: EdgeInsets.all(10),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(padding:EdgeInsets.all(7),child: Text('Order Detials',style: TextStyle(fontSize: 17),),),
                    Divider(color: black,),
                    Container(
                       child:Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Container(child: Text('dhosa',style: TextStyle(fontSize: 15),),),
                           Container(child: Text('8',style: TextStyle(fontSize: 15),),),
                           Container(child: Text('Rs:250',style: TextStyle(fontSize: 15),),),

                         ],
                       ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 7),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(child: Text('dhosa',style: TextStyle(fontSize: 15),),),
                          Container(child: Text('2',style: TextStyle(fontSize: 15),),),
                          Container(child: Text('Rs:50',style: TextStyle(fontSize: 15),),),

                        ],
                      ),
                    ),
                    SizedBox(height: 10,),

                    Container(
                      padding: EdgeInsets.only(bottom: 7),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(child: Text('dhosa'),),
                          Container(child: Text(''),),
                          Container(child: Text('Rs:25'),),

                        ],
                      ),
                    ),

                    Divider(color: black,),
                    Container(
                      padding: EdgeInsets.all(7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(child: Text('Total'),),
                          Container(child: Text('Rs.325'),),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 7,),
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                color: white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(padding:EdgeInsets.all(7),child: Text('Order Detials',style: TextStyle(fontSize: 17),),),
                    Divider(color: black,),
                    Container(padding:EdgeInsets.all(7),child: Text('UserName',style: TextStyle(fontSize: 17),),),
                    Container(padding:EdgeInsets.all(7),child: Text('125/ R.S.Puram, Coimbatore,TamilNadu',style: TextStyle(fontSize: 17),),),
                    Container(padding:EdgeInsets.all(7),child: Text('+9876543210',style: TextStyle(fontSize: 17),),),
                    Container(padding:EdgeInsets.all(7),child: Text('email123@gmail.com',style: TextStyle(fontSize: 17),),),


                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomSheet: bottomSheet(),

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
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children:<Widget>[
              TextButton(
                child: Text('CONFORM TO PAY',style: TextStyle(color: white),),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PayMethod()));
                },
              ),
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PayMethod()));
              }, icon: Icon(Icons.arrow_forward_outlined,color: white,))
            ],
          ),
        );
      });
    }else{
      return Container(child: Text(''),);
    }
  }


}
