// import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Home_page.dart';
import 'package:flutter_application_1/screens/Login_page.dart';
import 'package:flutter_application_1/screens/Signup_page.dart';
import 'package:flutter_application_1/screens/Splesh_page.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_application_1/test/test.dart';
import 'package:flutter_application_1/test/test_page1.dart';
// import 'package:flutter_offline/flutter_offline.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Somthing want wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: true,
            title: "My Simple App",
            home: Test_Page1(),
          );
          // return Container();
        });
    // return
  }
}

// getConnectivity() async {
//   var connectivityResult = await (Connectivity().checkConnectivity());
//   if (connectivityResult == ConnectivityResult.mobile) {
//     print("Mobile Internet is connect");
//   } else if (connectivityResult == ConnectivityResult.wifi) {
//     print("Wifi Internet is connect");
//   } else {
//     print("No Internet");
//   }
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Login_page(),
//     );
//   }
// }
