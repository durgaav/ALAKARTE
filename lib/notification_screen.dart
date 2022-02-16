import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Color red = Color(0xffDB90000);
  Color grey = Color(0xff7EABB7);
  Color white = Color(0xffFFFFFF);
  Color black = Color(0xff000000);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.89,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        height: 100,
                        padding: EdgeInsets.only(bottom: 20),
                        child: Icon(
                          CupertinoIcons.person_alt_circle,
                          color: grey,
                          size: 75,
                        ),
                      ),
                      title: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'hi surya , we received your order soon we will deliver it on time keep shop thank you.',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          "10/10/2010",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    );
                  }),
            )
          ],
        )
    );

  }
}