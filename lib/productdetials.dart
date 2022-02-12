import 'package:alakarte/checkout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetials extends StatefulWidget {
  const ProductDetials({Key? key}) : super(key: key);

  @override
  _ProductDetialsState createState() => _ProductDetialsState();
}

class _ProductDetialsState extends State<ProductDetials> {
  Color red = Color(0xffDB90000);
  Color black = Color(0xff000000);
  Color white = Color(0xffFFFFFF);
  Color grey = Color(0xff7D7699);

  bool postcomment = false;

  List comments = [
    "hiii",
    "hellooo"
  ];
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: red,
        centerTitle: true,
        title: Text('FOODDetials'),
        leading:IconButton(
          icon:Icon(CupertinoIcons.chevron_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
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
              color: white,
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
                          color: red,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                  onTap: () {
                                    print("-");
                                    // setState(() {
                                    //   addedCart[index] = addedCart[index] - 1;
                                    //   cartItemCount--;
                                    //   if (cartItemCount == 0) {
                                    //     opacity = 0.0;
                                    //     bottomSheetVisible = false;
                                    //   }
                                    // });
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: white,
                                  )),
                              Text(
                                '3',
                                style: TextStyle(
                                    color: white,
                                    fontSize: 16),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    // setState(() {
                                    //   bottomSheetVisible = true;
                                    //   addedCart[index] =
                                    //       addedCart[
                                    //       index] +
                                    //           1;
                                    //   cartItemCount++;
                                    // });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: white,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                    Divider(color: black,),
                    Container(
                      height: 35,
                      child: IntrinsicHeight(
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
                              child: TextButton(
                                  onPressed: (){
                                    setState(() {
                                      postcomment = true;
                                      print(postcomment);
                                    });
                                    },
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
                      ),
                    )

                  ],
                )
            ),
            Container(
              color: white,
              child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      Container(
                        child: TabBar(tabs:[ Tab(child: Text('Description',style: TextStyle(fontSize: 16,color: black),),),
                          Tab(child: Text('Ingreadients',style: TextStyle(fontSize: 16,color:black),),)]),

                      ),
                      Container(
                        margin: EdgeInsets.only(top:15,right: 10,left: 10),
                        height: 78,
                        width: MediaQuery.of(context).size.width,
                        child: TabBarView(children: [
                          SingleChildScrollView(
                            child: Container(
                              child: Text('Highgenic healthy and tasty foods are available 24/7 Highgenic healthy and tasty foods are available 24/7 Highgenic healthy and tasty foods are available 24/7'
                                  ' Highgenic healthy and tasty foods are available 24/7 Highgenic healthy and tasty foods are available 24/7 Highgenic healthy and tasty foods are available 24/7'),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Container(
                              child: Text('Highgenic healthy and tasty foods are available 24/7 Highgenic healthy and tasty foods are available 24/7'),
                            ),
                          ),
                        ]),
                      )
                    ],
                  )),
            ),
                  SizedBox(height: 7,),
            Container(
              color: white,
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(child: Text('Comments',style: TextStyle(fontSize: 17),),),
                  Container(
                    height: 100,
                    child: ListView.builder(
                        itemCount: comments.length,
                        itemBuilder: (context,index){
                          return ListTile(
                            // leading:Icon(CupertinoIcons.person_alt_circle_fill,color: grey,size: 40,),
                            title: Row(
                              children: <Widget>[
                                Container(
                                    padding:EdgeInsets.all(0),
                                    decoration:BoxDecoration(
                                      shape:BoxShape.circle,
                                      color: red,
                                    ),
                                    child: Icon(CupertinoIcons.person_alt_circle_fill,color: white,size: 44,)
                                ),
                                Padding(
                                  padding:EdgeInsets.only(left: 18),
                                  child: Text('Durga',style: TextStyle(fontWeight: FontWeight.bold),),
                                )
                              ],
                            ),
                            subtitle: Container(
                                margin: EdgeInsets.only(left: 68),
                                child: Text(
                                  '${comments[index].toString()}',
                                  style: TextStyle(fontSize: 13,color: black),
                                )),
                          );
                        }
                    ),
                  ),
                  Visibility(
                    visible: postcomment,
                    child: Column(
                      children:<Widget> [
                        Container(
                          margin: EdgeInsets.all(10),
                          color: grey,
                          height: 100,
                          child: TextFormField(
                            controller: controller,
                            maxLines: 5,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(7),
                                border: InputBorder.none,
                                hintText: "Add comment"
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          child: Container(
                            width: 100,
                            child: RaisedButton(
                              color: red,
                              onPressed: (){
                                setState(() {
                                  comments.add(controller.text.toString());
                                });
                                // controller.dispose();
                              },
                              child: Text('POST',style: TextStyle(fontSize: 16,color: white),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )







          ],
        ),
      ),
    );
  }
}

