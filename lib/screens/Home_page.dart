//
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/screens/Login_page.dart';
import 'package:flutter_application_1/screens/drawer.dart';
import 'package:flutter_application_1/test/test_page1.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final Stream<QuerySnapshot> _userStream =
      FirebaseFirestore.instance.collection('students').snapshots();

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   drawer: Drawer_Page(),
    // );
    return StreamBuilder(
        stream: _userStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Somthing want wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Center(
                child: Text(
                    "Full Name: ${data['name']}${data['email']}${data['name']}"),
              );
            }).toList(),
          );
        });
  }
}
