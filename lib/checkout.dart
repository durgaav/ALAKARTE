import 'package:alakarte/ordersummary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  final _formKey = GlobalKey<FormState>();
  Color red = Color(0xffDB90000);
  Color black = Color(0xff000000);
  Color white = Color(0xffFFFFFF);
  Color grey = Color(0xff7D7699);



  bool bottomSheetVisible = true;
  bool _switchvalue = false;
  bool _switch = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: red,
        centerTitle: true,
        title: Text('CHECKOUT'),
        leading: IconButton(
          icon:Icon(CupertinoIcons.chevron_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Form(
                  key:  _formKey,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      TextFormField(
                       // controller: name,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Flatno',
                          labelText: 'Flatno'
                        ),
                      //  validator: uname,
                      ),

                      TextFormField(
                      //  controller:phno,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Address',
                            labelText: 'Address'

                        ),
                       // validator: number,
                        // maxLength: 10,
                      ),

                      TextFormField(
                      //  controller: email,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Landmark',
                            labelText: 'Landmark'

                        ),
                       // validator: mail,
                      ),

                      TextFormField(
                      //  controller: pass,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Pincode',
                            labelText: 'Pincode'

                        ),
                      //  validator: password,
                      ),

                      TextFormField(
                       // controller: pass,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Mobileno',
                            labelText: 'Mobileno'

                        ),
                       // validator: password,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey[300],
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Container(padding:EdgeInsets.only(top: 10),child: Center(child: Text('PaymentOption',style: TextStyle(fontSize: 16),),)),
                            Divider(color: black,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(child: Text('COD'),),
                              Switch(value: _switchvalue, onChanged: (bool value){
                                setState(() =>
                                  _switchvalue = value);
                              })
                            ],
                          ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(child: Text('CARD(Debit or Credit)'),),
                                Switch(value: _switch, onChanged: (bool value){
                                  setState(() =>
                                  _switch = value);
                                })
                              ],
                            )

                          ],
                        ),
                      )
                    ],
                  )
              )
            ],
          ),
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
                  child: Text('CHECKOUT YOUR ORDER',style: TextStyle(color: white),),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderSummary()));
                  },
                ),
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_outlined,color: white,))

            ],
          ),
        );
      });
    }else{
      return Container(child: Text(''),);
    }
  }

}
