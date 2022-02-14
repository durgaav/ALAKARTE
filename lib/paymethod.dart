import 'package:alakarte/order_confirmation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PayMethod extends StatefulWidget {
  const PayMethod({Key? key}) : super(key: key);

  @override
  _PayMethodState createState() => _PayMethodState();
}

class _PayMethodState extends State<PayMethod> {
  final _formKey = GlobalKey<FormState>();

  Color red = Color(0xffDB90000);
  Color white = Color(0xffFFFFFF);

  bool bottomSheetVisible = true;

  String _selectedGender = '';
  String _selectedGender1 = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: red,
        centerTitle: true,
        title: Text('PAYMENT METHOD'),
        leading: IconButton(
          icon:Icon(CupertinoIcons.chevron_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding:EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
          //    width: 100,
             height: 120,
              child: Center(
                child: CircleAvatar(
                  child: Icon(Icons.person,size: 100,),
                  maxRadius: 50,
                  foregroundColor: Colors.grey[300],
                  backgroundColor: Colors.grey,
                )),
            ),
            Container(
              width: 100,
              height: 40,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all()
              ),
              child: Center(
                child: Text('Rs:400',style: TextStyle(fontSize: 20),),),
            ),


            Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width:180,
                    child: Row(children: [
                      Radio<String>(
                          value: 'Debitcard',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                      Text('Debit Card',style: TextStyle(fontSize: 17),)
                    ],)
                  ),
                  Expanded(
                    flex: 2,
                      child: Row(children: [
                        Radio<String>(
                          value: 'Debitcard',
                          groupValue: _selectedGender1,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender1 = value!;
                            });
                          },
                        ),
                        Text('Credit Card',style: TextStyle(fontSize: 17),)
                      ],)
                  ),
                ],
              ),
            ),



      Form(
        key:  _formKey,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextFormField(
              // controller: name,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'CardNumber',
                  labelText: 'CardNumber'
              ),
              //  validator: uname,
            ),

            TextFormField(
              //  controller:phno,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'CardHolderName',
                  labelText: 'CardHolderName'

              ),
              // validator: number,
              // maxLength: 10,
            ),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
                Container(
                  width: 170,
                  child: TextFormField(
                    // controller: name,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'ExpiryDate',
                        labelText: 'ExpiryDate'
                    ),
                    //  validator: uname,
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: TextFormField(
                  //  controller:phno,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'CVV',
                      labelText: 'CVV'

                  ),
                  // validator: number,
                  // maxLength: 10,
                ),
                )

  ],
)
              ],
            )

    ),
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
                child: Text('PAY SCECURE',style: TextStyle(color: white),),
                onPressed: (){
                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>PayMethod()));
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderConfirmation()));
                },
              ),
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderConfirmation()));
              }, icon: Icon(Icons.arrow_forward_outlined,color: white,))
            ],
          ),
        );
      });
    }else{
      return Container(child: Text(''),);
    }}



}
