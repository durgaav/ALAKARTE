import 'package:alakarte/homepage.dart';
import 'package:alakarte/menuPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  Color black = Color(0xff000000);
  Color red = Color(0xffDB90000);
  Color white = Color(0xffFFFFFF);

//form validate region
  final _formKey = GlobalKey<FormState>();

  final uname = MultiValidator([RequiredValidator(errorText: 'Cannot be blank')]);
  final number = MultiValidator([RequiredValidator(errorText: 'Cannot be blank')]);
  final mail = MultiValidator([RequiredValidator(errorText: 'Cannot be blank')]);
  final password = MultiValidator([RequiredValidator(errorText: 'Cannot be blank')]);

  TextEditingController name = TextEditingController();
  TextEditingController phno = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
//end region
@override
  void initState() {
    // TODO: implement initState
  Color red = Color(0xffDB90000);
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     statusBarColor: red
  // ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
         appBar: AppBar(
          backgroundColor: red,
          centerTitle: true,
         title: Text('REGISTER'),
            leading: IconButton(
              icon:Icon(CupertinoIcons.chevron_back),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
         ),
        body:SingleChildScrollView(
        child:Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
         child: Form(
              key:  _formKey,
         child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Center(
              child: Container(
                padding: EdgeInsets.only(top:20),
              height: 100,
                width: 100,
                child: Image(
                  image: AssetImage("assets/images/logo.png"),),
              ),),
            SizedBox(
              height: 35,
            ),
            TextFormField(
              controller: name,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                prefixIcon: Icon(CupertinoIcons.person_fill, color: Colors.black87),
                hintText: 'Name',
              ),
              validator: uname,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller:phno,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                prefixIcon: Icon(CupertinoIcons.phone_fill, color:Colors.black87),
                hintText: 'Phonenumber',
              ),
              validator: number,
             // maxLength: 10,
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: email,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                prefixIcon: Icon(CupertinoIcons.mail_solid , color:Colors.black87),
                hintText: 'Eamil',
              ),
              validator: mail,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: pass,
              obscureText: true,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                prefixIcon: Icon(CupertinoIcons.lock_fill, color:Colors.black87),
                hintText: 'Password',
              ),
               validator: password,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 180,
           // height: 40,
            child:RaisedButton(
              color: red,
              onPressed: (){
                 Navigator.push(
                     context, MaterialPageRoute(builder: (context) => HomePage()));
              },
            child: Text('Register',style: TextStyle(color: white,fontSize: 20),),)
            ),
          ],
        )
    ))));
  }

}
