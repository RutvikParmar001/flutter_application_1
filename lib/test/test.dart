// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);
  // Map data;

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  //  CollectionReference user = FirebaseFirestore.instance.collection("Rutvik");
  // user.add('demoData');
  // Map data;
  adddata() async {
    Map<String, dynamic> demoData = {
      "name": "Rutvik Parmar",
      "email": "Rutu1414@gmail.com"
    };
    CollectionReference user = FirebaseFirestore.instance.collection("student");
    user.add(demoData);
  }

  var data;

  fatchdata() {
    //   CollectionReference user = FirebaseFirestore.instance.collection("Student");
    //   user.snapshots().listen((snapshot) {
    //     // var data;
    //     setState(() {
    //       data = snapshot.docs[0].data;
    //       print(data);
    //     });
    //   });
    String rutvik;
    final Stream<QuerySnapshot> _userStream =
        FirebaseFirestore.instance.collection('students').snapshots();
    StreamBuilder(
        stream: _userStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Somthing want wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
          }).toList();
          // for (var i = 0; i < 5; i++) {
          //   return Text(storedocs[i]['name']);

          return Text(storedocs.toString());

          // return ListView(
          //     children: snapshot.data!.docs.map((DocumentSnapshot document) {
          //   Map<String, dynamic> data =
          //       document.data()! as Map<String, dynamic>;
          //   return Center(
          //     child: Text(data.toString()
          //         // "Full Name: ${data['name']}${data['email']}${data['name']}",
          //         ),
          //   );
          // }).toList());
        });
  }

  deletedata() async {
    CollectionReference user = FirebaseFirestore.instance.collection('student');
    // QuerySnapshot querySnapshot = await CollectionReference.get();
    Future<void> deleteuser() {
      return user
          .doc('std1')
          .delete()
          .then((value) => print("user deleted"))
          .catchError((error) => print("filed to delete user: $error"));
    }
  }

  // CollectionReference user = FirebaseFirestore.instance.collection('student');
  @override
  Widget build(BuildContext context) {
    // Future<void> deleteuser() {
    //   return user
    //       .doc('std1')
    //       .delete()
    //       .then((value) => print("user delet"))
    //       .catchError((error) => print("Field to delete user:$error"));
    // }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "About Data",
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            ElevatedButton(onPressed: fatchdata, child: Text("Fatch Data")),
            ElevatedButton(onPressed: adddata, child: Text("Add User")),
            ElevatedButton(onPressed: () {}, child: Text("Up Date")),
            ElevatedButton(onPressed: deletedata, child: Text("delete Data")),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(data.toString())],
            )
            // Text("Text")
          ],
        ),
      ),
      // body: Column(
      //   children: [
      //     Row(
      //       children: [
      //         ListView(
      //           children: [
      //             ElevatedButton(onPressed: () {}, child: Text("Fatch Data")),
      //             SizedBox(
      //               height: 20,
      //             ),
      //             ElevatedButton(onPressed: () {}, child: Text("Add Data")),
      //             SizedBox(
      //               height: 20,
      //             ),
      //             ElevatedButton(onPressed: () {}, child: Text("Update Data")),
      //             SizedBox(
      //               height: 20,
      //             ),
      //             ElevatedButton(onPressed: () {}, child: Text("Delete Data"))
      //           ],
      //         )
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}
