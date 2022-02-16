import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  Color red = Color(0xffDB90000);
  Color grey = Color(0xff7EABB7);
  Color white = Color(0xffFFFFFF);
  Color black = Color(0xff000000);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height*0.9,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    color: grey,
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: white,
                      shape: BoxShape.circle,
                    ),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 100),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: grey,
                      child: Icon(
                        Icons.storefront_outlined,
                        size: 80,
                        color:black,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 220),
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "This app is made with ♥ by Mindmade This app is made with ♥ by Mindmade This app is made with ♥ by Mindmade"
                                "This app is made with ♥ by Mindmade This app is made with ♥ by Mindmade"
                                "This app is made with ♥ by Mindmade This app is made with ♥ by Mindmade This app is made with ♥ by Mindmade This app is made with ♥ by Mindmade"
                                "This app is made with ♥ by Mindmade This app is made with ♥ by Mindmade This app is made with ♥ by Mindmade This app is made with ♥ by Mindmade"
                            ,textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 12.5),
                          ),
                        ),
                      ),
                      Container(

                        margin: EdgeInsets.only(top: 25),
                        child: Center(
                          child: Text("www.mindmade.in",style: TextStyle(fontSize: 17),),
                        ),
                      ),
                      //Icons ROW
                      IntrinsicHeight(
                        child: Container(
                          margin: EdgeInsets.only(top: 25,left: 8,right: 8),
                          padding: EdgeInsets.only(left: 15,right: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: grey,
                          ),
                          height: 60,
                          width:MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.facebook_outlined,size: 40,),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: VerticalDivider(thickness: 2),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.facebook_outlined,size: 40,),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: VerticalDivider(thickness: 2),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.youtube_searched_for_outlined,size: 40,),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: VerticalDivider(thickness: 2),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.facebook_outlined,size: 40,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )

                    ],
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}