import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Login_page.dart';
import 'package:lottie/lottie.dart';

class Splesh_Page extends StatefulWidget {
  const Splesh_Page({super.key});

  @override
  State<Splesh_Page> createState() => _Splesh_PageState();
}

class _Splesh_PageState extends State<Splesh_Page> {
  var subscrition;
  String status = "ofline";
  @override
  // void initState() {
  //   super.initState();
  // }

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 10),
        (() => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) => const Login_page()),
              ),
            )));
    subscrition = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          status = "offline";
        });
      } else {
        setState(() {
          status = "online";
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscrition.cancel();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(status)),
      ),
      body: Lottie.asset("assets/smile.json"),
    );
  }
}
