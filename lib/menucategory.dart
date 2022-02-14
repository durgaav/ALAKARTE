import 'package:alakarte/food_ctgry_tabview.dart';
import 'package:alakarte/productdetials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuCategory extends StatefulWidget {
  const MenuCategory({Key? key}) : super(key: key);

  @override
  _MenuCategoryState createState() => _MenuCategoryState();
}

class _MenuCategoryState extends State<MenuCategory> {

  Color red = Color(0xffDB90000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          backgroundColor: red,
          centerTitle: true,
          title: Text('FOODCATEGORY'),
          leading:IconButton(
            icon:Icon(CupertinoIcons.chevron_back),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height*0.8,
          child: GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (BuildContext context, int index) {
              return new GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodCateTab()));
                  },
                  child:Card(
                  child: Column(
                    children: [
                      Container(
                        color: red,
                        height:110,
                        child: Image(
                             image: new AssetImage('assets/images/food1.jpeg'),fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text('Variety rice'),
                      )
                    ],
                  ),

                  )
              );
            },
          ),
        ),
      ),
    );
  }
}
