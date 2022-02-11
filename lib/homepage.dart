import 'package:alakarte/menuPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color red = Color(0xffDB90000);
  Color black = Color(0xff000000);
  Color grey = Color(0xff7D7699);
  Color white = Color(0xffFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: red,
        centerTitle: true,
        title: Text('HOTELLIST'),
        leading:IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            _displayDialog(context);},
        ) ,
      ),
      body: Container(
          height:MediaQuery.of(context).size.height*0.9,
        width: MediaQuery.of(context).size.width,
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: grey, borderRadius: BorderRadius.circular(6)),
                padding: EdgeInsets.only(left: 6,),
                width: double.infinity,
                alignment: Alignment.center,
                height: 40,
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      hintText: "Search",
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search,color: white,),
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Text('Hotel List',style: TextStyle(fontSize: 18),),
              ),
          SingleChildScrollView(
              child: Container(
              height: 580,
            child: ListView.builder(
                    itemCount: 5,
                    itemBuilder:(BuildContext context, int index) {
                      return Container(
                        height: 150,
                        child:GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPage()));
                          },
                          child:Card(
                            child: Row(
                                children: [
                                  Container(
                                    width:80,
                                    height: 120,
                                    child: Image(
                                      image: AssetImage('assets/images/listimg3.jpeg'),
                                    ),
                                  ),
                                  Container(
                                    width: 255,
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            child:Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Text('Hotel Annapoorna',style: TextStyle(fontSize: 13)),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4),
                                              border: Border.all(),
                                            ),
                                            child: CircleAvatar(
                                              radius: 3,
                                              backgroundColor: Colors.green,
                                            ),
                                          ),
                                            Expanded(
                                              child: Container(
                                                color: red,
                                                child: SizedBox(
                                                height:15,
                                                width: 89,
                                                child: CustomPaint(
                                                  painter: PriceTagPaint(),
                                                  child: Center(
                                                    child: Text(
                                                      "Chettinadfood",
                                                      style: TextStyle(
                                                        fontSize: 9,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                              ),
                                            )
                                        ],
                                       )
                                        ),
                                        Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  child: Icon(
                                                    Icons.star,size: 19,color: Colors.yellow,
                                                  ),
                                                ),
                                                Container(child: Text('4.5'),)

                                              ],
                                            )
                                        ),
                                       Divider(color: black,),
                                        Container(
                                            child: Text('125/R.S.Puram,Coimbatore,TamilNadu 641002',style: TextStyle(fontSize: 13),)
                                        ),
                                      ],
                                    ),
                                  )

                                ]
                            )

                        ),
                      )
                      );
                    }
                )
            )
          )
            ]
          ),
        )
      )
    );
  }


  _displayDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(milliseconds: 200),
      // transitionBuilder: (context, animation, secondaryAnimation, child) {
      //   return FadeTransition(
      //     opacity: animation,
      //     child: ScaleTransition(
      //       scale: animation,
      //       child: child,
      //     ),
      //   );
      // },
      pageBuilder: (context, animation, secondaryAnimation) {
      return Container(
       // width: MediaQuery.of(context).size.width-100,
       //  height:MediaQuery.of(context).size.height,
        child: Scaffold(
          body: Container(
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                // width: MediaQuery.of(context).size.width-100,
                // height:MediaQuery.of(context).size.height,
                child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    height: 100,
                                    width: 110,
                                    child: Image(
                                      image: AssetImage("assets/images/logo.png"),),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                      right: 10,
                                      child: IconButton(onPressed: (){Navigator.pop(context);}, icon:Icon(Icons.cancel)))
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20),
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      onTap: (){},
                                      leading: Icon(Icons.home,color: black,),
                                      title: Text('HOME'),
                                    ),
                                    Divider(
                                      height: 1,
                                    ),
                                    ListTile(
                                      onTap: (){
                                        Navigator.pop(context);
                                        Navigator.pushReplacement(
                                            context, MaterialPageRoute(builder: (context) => MenuPage()));
                                      },
                                      leading: Icon(Icons.dining_rounded,color: black,),
                                      title: Text('MENU'),
                                    ),
                                    Divider(height: 2,),
                                    ListTile(
                                      onTap: (){},
                                      leading: Icon(Icons.person,color: black,),
                                      title: Text('PROFILE'),
                                    ),
                                    Divider(height: 2,),
                                    ListTile(
                                      onTap: (){},
                                      leading: Icon(Icons.description,color: black,),
                                      title: Text('WISHLIST'),
                                    ),
                                    Divider(height: 2,),
                                    ListTile(
                                      onTap: (){},
                                      leading: Icon(Icons.ballot,color: black,),
                                      title: Text('ORDERHISTORY'),
                                    ),
                                    Divider(height: 2,),
                                    ListTile(
                                      onTap: (){},
                                      leading: Icon(Icons.people,color: black,),
                                      title: Text('ABOUTUS'),
                                    ),
                                    Divider(height: 2,),
                                    ListTile(
                                      onTap: (){},
                                      leading: Icon(Icons.add_alert_rounded ,color: black,),
                                      title: Text('NOTIFICATION'),
                                    ),
                                    Divider(height: 2,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                              child:ListTile(
                                onTap: (){},
                                leading: Icon(Icons.logout,color: black,),
                                title: Text('LOGOUT',style: TextStyle(fontSize: 16),),
                              )
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      );
      },
    );
  }
}
class PriceTagPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.green
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    Path path = Path();

    path
      ..moveTo(0, size.height * .5)
      ..lineTo(size.width * .13, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * .13, size.height)
      ..lineTo(0, size.height * .5)
      ..close();
    canvas.drawPath(path, paint);

    //* Circle
    canvas.drawCircle(
      Offset(size.width * .13, size.height * .5),
      size.height * .15,
      paint..color = Colors.white,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}