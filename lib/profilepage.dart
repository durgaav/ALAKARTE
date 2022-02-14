import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final _formKey = GlobalKey<FormState>();

  Color red = Color(0xffDB90000);
  Color grey = Color(0xff7D7699);
  Color white = Color(0xffFFFFFF);
  Color black = Color(0xff000000);
  bool _switchValue = false;
  final double coverHeight = 200;
  final double profileHeight = 144;
  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2;

    return Scaffold(
      appBar:AppBar(
        backgroundColor: red,
        centerTitle: true,
        title: Text('Profile page'),
        leading:IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){

          },
        ) ,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Stack(
              //   clipBehavior: Clip.none,
              //   alignment: Alignment.center,
              //   children: [
              //     Container(
              //       height: 150,
              //       color: grey,
              //     ),
              //       Positioned(
              //         top: 80,
              //           child: CircleAvatar(
              //             child: Icon(Icons.person,size: 100,),
              //             maxRadius: 50,
              //             foregroundColor: Colors.grey[300],
              //             backgroundColor: Colors.grey,
              //           )),
              //   ],
              // ),


              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  // background image and bottom contents
                  Column(
                    children: <Widget>[
                      Container(
                        height: 200.0,
                        color: Colors.orange,
                        child: Center(
                          child: Text('Background image goes here'),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Center(
                            child: Text('Content goes here'),
                          ),
                        ),
                      )
                    ],
                  ),
                  // Profile image
                  Positioned(
                    top: 150.0, // (background container size) - (circle height / 2)
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green
                      ),
                    ),
                  )
                ],
              ),

              Container(
                color: white,
                child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        Container(
                          child: TabBar(tabs:[ Tab(child: Text('Profile Detials',style: TextStyle(fontSize: 16,color: black),),),
                            Tab(child: Text('Settings',style: TextStyle(fontSize: 16,color:black),),)]),

                        ),
                        Card(
                          child: Container(
                            margin: EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: TabBarView(children: [
                              SingleChildScrollView(
                                child: Container(
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextFormField(
                                          // controller: name,
                                          decoration: const InputDecoration(
                                              border: UnderlineInputBorder(),
                                              hintText: 'Name',
                                              labelText: 'Name',
                                              prefixIcon: Icon(Icons.person)
                                          ),
                                          //  validator: uname,
                                        ),
                                        TextFormField(
                                          // controller: name,
                                          decoration: const InputDecoration(
                                              border: UnderlineInputBorder(),
                                              hintText: 'email',
                                              labelText: 'Email',
                                              prefixIcon: Icon(Icons.email)
                                          ),
                                          //  validator: uname,
                                        ),
                                        TextFormField(
                                          // controller: name,
                                          decoration: const InputDecoration(
                                              border: UnderlineInputBorder(),
                                              hintText: 'phonenumber',
                                              labelText: 'phonenumber',
                                              prefixIcon: Icon(Icons.phone)
                                          ),
                                          //  validator: uname,
                                        ),
                                        TextFormField(
                                          // controller: name,
                                          decoration: const InputDecoration(
                                              border: UnderlineInputBorder(),
                                              hintText: 'DOB',
                                              labelText: 'DOB',
                                              prefixIcon: Icon(Icons.calendar_today )
                                          ),
                                          //  validator: uname,
                                        ),
                                        TextFormField(
                                          // controller: name,
                                          decoration: const InputDecoration(
                                              border: UnderlineInputBorder(),
                                              hintText: 'Sex',
                                              labelText: 'Sex',
                                              prefixIcon: Icon(Icons.people)
                                          ),
                                          //  validator: uname,
                                        ),
                                        SizedBox(height: 10,),
                                        Container(
                                            color: red,
                                            child: FlatButton(onPressed: (){},child: Text('Edit Profile',style: TextStyle(color: white,fontSize: 17),),))
                                      ],
                                    ),
                                  ),



                                ),
                              ),
                              SingleChildScrollView(
                                child: Container(
                                    child: Column(
                                      children:<Widget> [
                                        ListTile(
                                          title: Text('Notifications'),
                                          trailing: CupertinoSwitch(
                                            activeColor: Colors.green,
                                            value: _switchValue,
                                            onChanged: (value) {
                                              setState(() {
                                                _switchValue = value;
                                              });
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: Text('Password Reset'),
                                          trailing: Container(
                                            margin:EdgeInsets.only(left: 55,),
                                            child: GestureDetector(
                                                child: Icon(Icons.arrow_forward_ios,size: 18,color: Colors.grey,)
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          title: Text('Location'),
                                          subtitle: Text("1/4 vellandipalaym , Thekkalur , Avinashi",style: TextStyle(fontSize: 13),),
                                          trailing: Container(
                                            margin:EdgeInsets.only(left: 55,),
                                            child: GestureDetector(
                                                onTap: (){
                                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> NotificationScreen()));
                                                },
                                                child: Icon(Icons.arrow_forward_ios,size: 18,color: Colors.grey,)
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),
                            ]),
                          ),
                        )
                      ],
                    )),
              ),          ],
          ),
        ),
      ),
    );
  }
}

