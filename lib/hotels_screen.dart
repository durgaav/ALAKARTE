import 'package:alakarte/home_activity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Hotesls extends StatefulWidget {
  const Hotesls({Key? key}) : super(key: key);

  @override
  _HoteslsState createState() => _HoteslsState();
}

class _HoteslsState extends State<Hotesls> {
  Color red = Color(0xffDB90000);
  Color black = Color(0xff000000);
  Color grey = Color(0xff7D7699);
  Color white = Color(0xffFFFFFF);

  LatLng currentMapPosition = LatLng(11.01685, 76.95583);
  GoogleMapController? _controller;
  Set<Marker> pinLocation = Set();

  bool locationView = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      currentMapPosition = LatLng(11.01685, 76.95583);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              snap: false,
              pinned: false,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(//Text
                background: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: GoogleMap(
                    zoomGesturesEnabled: true,
                    myLocationButtonEnabled: true,
                    tiltGesturesEnabled: true,
                    scrollGesturesEnabled: true,
                    rotateGesturesEnabled: true,
                    zoomControlsEnabled: true,
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: currentMapPosition,
                      zoom: 12,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller = controller;
                    },
                  ),
                ),
              ), //FlexibleSpaceBar
              expandedHeight: 300,
            ), //SliverAppBar
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                    height:MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width,
                    child:GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => HomeActivity()));
                      },
                      child:Card(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width:100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: new AssetImage('assets/images/idly.jpg'),fit: BoxFit.cover),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width-110,
                                  padding: EdgeInsets.symmetric(horizontal: 6,vertical: 6),
                                  child: Column(
                                    children: [
                                      Container(
                                          child:Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Text('Hotel Annapoorna pure veg'
                                                    ,style: TextStyle(fontSize: 16)),
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
                                                    child: SizedBox(
                                                      height:15,
                                                      // width: 89,
                                                      child: CustomPaint(
                                                        painter: PriceTagPaint(),
                                                        child: Center(
                                                          child: Text(
                                                            "Chettinad food",
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
                ), //ListTile
                childCount: 10,
              ), //SliverChildBuildDelegate
            ),

            //SliverList
          ], //<Widget>[]
        ) //CustonScrollView
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