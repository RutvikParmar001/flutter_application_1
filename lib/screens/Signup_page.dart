import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart  ';
// import 'package:flutter_application_1/screens/Home_page.dart';
import 'package:flutter_application_1/screens/Login_page.dart';

class Signup_Page extends StatefulWidget {
  const Signup_Page({super.key});

  @override
  State<Signup_Page> createState() => _Signup_PageState();
}

class _Signup_PageState extends State<Signup_Page> {
  final _formkey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  var confirmpassword = "";

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  registration() async {
    if (password == confirmpassword) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(userCredential);

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Registresion Successfully",
              style: TextStyle(fontSize: 20),
            )));
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => Login_page())));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak - password') {
          print("Password Provided is too weak");
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password Provided is too weak",
                style: TextStyle(fontSize: 20),
              )));
        } else if (e.code == 'email-already-in-use') {
          print("Account Already exists");
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 20),
              )));
        }
      }
    } else {
      print("Password and confirmpassword doesn' match");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            "Password and confirmpassword doesn' match",
            style: TextStyle(fontSize: 20),
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Sign page",
          style: TextStyle(fontSize: 15),
        )),
      ),
      body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ListView(children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "Enter Your Email",
                      border: OutlineInputBorder()),
                  controller: emailcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Your Email";
                      // } else if (value.contains('@')) {
                      //   return "Enter Your Valid Email";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: "Enter Your Password",
                      border: OutlineInputBorder()),
                  controller: passwordcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Your Password";
                    }
                  },
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Confirmpassword",
                      hintText: "Enter your Confirmpassword",
                      border: OutlineInputBorder()),
                  controller: confirmpasswordcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Your Confirm Password";
                    }
                  },
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = emailcontroller.text;
                              password = passwordcontroller.text;
                              confirmpassword = confirmpasswordcontroller.text;
                              // .then(signInUser){};
                            });
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: ((context) => Home_Page())),
                            // );
                            registration();
                          }
                        },
                        child: const Text("Signup"))
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("I have Already Account"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => Login_page()),
                          ),
                        );
                      },
                      child: const Text("Login"),
                    )
                  ],
                ),
              )
            ]),
          )),
    );
  }
}
