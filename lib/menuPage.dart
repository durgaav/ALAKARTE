import 'package:alakarte/menucategory.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Color red = Color(0xffDB90000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: red,
        centerTitle: true,
        title: Text('MENU'),
        leading:IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            },
        ) ,
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child:GridView.builder(
      itemCount: 5,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10),
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuCategory()));
          },
            child:Card(
          child: Container(
            padding: EdgeInsets.all(10),
            child:Column(
            children: [
              Container(
                height:75,
                width: 65,
                child:CircleAvatar(
                  backgroundImage:AssetImage('assets/images/food.jpeg'),
              )
              ),
              Row(
                children: [
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 35),
                      child: Divider(
                        color: Colors.black,
                        height: 36,
                      )),
                ),
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 3.0, right: 3.0),
                        child: Divider(
                          color: Colors.black,
                          height: 36,
                        )),
                  ),
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(right: 36),
                        child: Divider(
                          color: Colors.black,
                          height: 36,
                        )),
                  ),

                ],
              ),
              
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Lunch')
              )
            ],
          ),
          ),

        ));
      },
    ),
    ));
  }
}
