import 'package:alakarte/about_us.dart';
import 'package:alakarte/hotels_screen.dart';
import 'package:alakarte/introscreen.dart';
import 'package:alakarte/menuPage.dart';
import 'package:alakarte/notification_screen.dart';
import 'package:alakarte/orderhistory.dart';
import 'package:alakarte/profilepage.dart';
import 'package:alakarte/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {

  final drawerItems = [
    new DrawerItem("HOME", Icons.home),
    new DrawerItem("MENU", Icons.dining_rounded),
    new DrawerItem("PROFILE", Icons.person),
    new DrawerItem("WISH LIST", Icons.description),
    new DrawerItem("ORDER HISTORY",Icons.ballot),
    new DrawerItem("ABOUT US", Icons.people),
    new DrawerItem("NOTIFICATIONS", Icons.notifications_active_sharp),
  ];
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new Hotesls();
      case 1:
        return new MenuPage();
      case 2:
        return new ProfilePage();
      case 3:
        return new WishList();
      case 4:
        return new OrderHistory();
      case 5:
        return new AboutUs();
      case 6:
        return new NotificationScreen();

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  Color red = Color(0xffDB90000);
  Color black = Color(0xff000000);
  Color grey = Color(0xff7D7699);
  Color white = Color(0xffFFFFFF);

  bool locationView = true;

  ScrollController _controller = new ScrollController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          Column(
            children: [
              new ListTile(
                leading: new Icon(d.icon,color: black,),
                title: Text(d.title),
                selected: i == _selectedDrawerIndex,
                onTap: () => _onSelectItem(i),

              ),
              Divider(
                height: 2,
              )
            ],
          )
      );
    }

    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.minScrollExtent) {
        // Perform your task
        setState(() {
          locationView = true;
        });
      }

      if (_controller.position.userScrollDirection == ScrollDirection.reverse) {
        setState(() {
          locationView = false;
        });
      }

    });

    return WillPopScope(
      onWillPop: () async{
        print("will pop....");
        return false;
      },
      child: Scaffold(
        drawer: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
          ),
          margin: EdgeInsets.only(top: 60,left: 7,bottom: 15,right: 7,),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  onPressed: (){Navigator.pop(context);}, icon:Icon(Icons.close),iconSize: 35,color: Colors.black38,)
                            ),
                          ),
                        ]
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(10),
                      height: 100,
                      width: double.infinity,
                      child: Image(
                        image: AssetImage("assets/images/logo.png"),),
                    ),
                  ],
                ),
                Column(
                  children: drawerOptions,
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.bottomLeft,
                      child:ListTile(
                        onTap: (){
                          Navigator.pop(context);
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => IntroScreen()));
                        },
                        leading: Icon(Icons.logout,color: black,),
                        title: Text('LOGOUT',style: TextStyle(fontSize: 16),),
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
            backgroundColor: red,
            centerTitle: true,
            title: widget.drawerItems[_selectedDrawerIndex].title=="HOME"?
            Text("HOTELS"):Text(widget.drawerItems[_selectedDrawerIndex].title),
          actions: [
            widget.drawerItems[_selectedDrawerIndex].title=="PROFILE"?Stack(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
                  },
                  icon: Icon(Icons.shopping_cart),
                  iconSize: 28,
                ),
              ],
            ): widget.drawerItems[_selectedDrawerIndex].title=="HOME"?Stack(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
                  },
                  icon: Icon(Icons.shopping_cart),
                  iconSize: 28,
                ),
              ],
            ):Container(),
          ],
        ),
        body: _getDrawerItemWidget(_selectedDrawerIndex),
      ),
    );
  }

}