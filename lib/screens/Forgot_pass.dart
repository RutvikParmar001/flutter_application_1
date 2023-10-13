import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Home_page.dart';
import 'package:flutter_application_1/screens/Login_page.dart';

class Forgot_Password extends StatefulWidget {
  const Forgot_Password({super.key});

  @override
  State<Forgot_Password> createState() => _Forgot_PasswordState();
}

// ignore: camel_case_types
class _Forgot_PasswordState extends State<Forgot_Password> {
  final _formkey = GlobalKey<FormState>();

  var email = "";

  final emailcontroller = TextEditingController();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "Password Reset Email has been sant",
            style: TextStyle(fontSize: 20.0),
          )));
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const Login_page())));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No User Found For That Email");
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "No user Found For That Email",
              style: TextStyle(fontSize: 20.0),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text(
          "Forgot Password",
          style: TextStyle(fontSize: 15),
        ),
      )),
      body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: ListView(children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "Enter Your Email",
                      border: OutlineInputBorder()),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = emailcontroller.text;
                            });
                          }
                        },
                        child: const Text("Sand"))
                  ],
                ),
              )
            ]),
          )),
    );
  }
}
