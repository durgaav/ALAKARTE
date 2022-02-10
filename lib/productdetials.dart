import 'package:flutter/material.dart';

class ProductDetials extends StatefulWidget {
  const ProductDetials({Key? key}) : super(key: key);

  @override
  _ProductDetialsState createState() => _ProductDetialsState();
}

class _ProductDetialsState extends State<ProductDetials> {
  Color red = Color(0xffDB90000);
  Color black = Color(0xff000000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: red,
        centerTitle: true,
        title: Text('FOODCATEGORY'),
        leading:IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            // showAlert(context);
          },
        ) ,
      ),
      body:  SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: new AssetImage('assets/images/food.jpeg'),fit: BoxFit.cover,
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
              child:Column(
                children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(color:Colors.grey[300],width:75,height: 30,child: FlatButton(onPressed: (){}, child: Text('Italian'),)),SizedBox(width: 10,),
                      Container(color:Colors.grey[300],width:85,height: 30,child: FlatButton(onPressed: (){}, child: Text('Chinese')))
                    ],
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite))
                ],
              ),
                  Container(
                    padding: EdgeInsets.only(top:5),
                    child: Row(
                      children: [
                        Container(
                          margin:EdgeInsets.only(right: 10),
                          child: Text('Ghee rost',style: TextStyle(fontSize: 25),),
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
                        Container(
                          margin:EdgeInsets.only(left: 10),
                          child: Text('(available)'),)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 7,bottom: 10),
                    child: Text('Ghee rost Ghee rost Ghee rost Ghee rost Ghee rost Ghee rost Ghee rost'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(child: Text('Rs:75.00/-',style: TextStyle(fontSize: 17),),),
                      Container(
                        child:Text('button here') ,
                      )
                    ],
                  ),
                  Divider(color: black,),
               IntrinsicHeight(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     //   DropdownButton(items: items, onChanged: onChanged)
                     IconButton(onPressed: (){}, icon: Icon(Icons.mood_outlined )),
                     VerticalDivider(thickness: 1,),
                     Container(
                       child: GestureDetector(
                         onTap: (){},
                         child: Row(
                         children: [
                           Text('4.4'),
                           Icon(Icons.star,size: 16,),
                           Text('Rates')
                         ],
                       )
                       ),
                     ),
                     VerticalDivider(thickness: 1,),
                     Container(
                    child: GestureDetector(
                       onTap: (){},
                         child: Row(
                           children: [
                             Text('2'),
                             Text('Comments'),
                             Icon(Icons.sms ,size: 17,),

                           ],
                         )
                     ),
                     )
                   ],
                 ),
               )

                ],
              )
              ),

Card(
  child:   Container(
    child:   Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: Text('Description'),
        ),
        Container(
          child: Text('Ingidients'),
        )
      ],
    ),
  ),
)









            ],
          ),
        ),
    );
  }
}
