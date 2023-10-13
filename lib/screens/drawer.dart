import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Drawer_Page extends StatefulWidget {
  const Drawer_Page({Key? key}) : super(key: key);

  @override
  State<Drawer_Page> createState() => _Drawer_PageState();
}

class _Drawer_PageState extends State<Drawer_Page> {
  // Widget listtitle({IconData icon,String title}){
  //   return listtitle(
  //     leading:Icon(
  //       icon,
  //       size: 32,
  //     )
  //     title:
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: ListView(
        children: [
          DrawerHeader(
              child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 43,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.amber,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Text("welcome"),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                      height: 30,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 15),
                        ),
                      ))
                ],
              )
            ],
          )),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text("Home"),
            onLongPress: () {},
          ),
          ListTile(
            leading: Icon(Icons.shop_outlined),
            title: Text("Review Cart"),
            onLongPress: () {},
          ),
          ListTile(
            leading: Icon(Icons.person_outlined),
            title: Text("My Profile"),
            onLongPress: () {},
          ),
          ListTile(
            leading: Icon(Icons.notifications_outlined),
            title: Text("Notification"),
            onLongPress: () {},
          ),
          ListTile(
            leading: Icon(Icons.star_outlined),
            title: Text("Reating & Review"),
            onLongPress: () {},
          ),
          ListTile(
            leading: Icon(Icons.favorite_outlined),
            title: Text("Wish List"),
            onLongPress: () {},
          ),
          ListTile(
            leading: Icon(Icons.copy_outlined),
            title: Text("Raise a Complaint"),
            onLongPress: () {},
          ),
          ListTile(
            leading: Icon(Icons.format_quote_outlined),
            title: Text("FAQs"),
            onLongPress: () {},
          )
        ],
      ),
    );
  }
}
