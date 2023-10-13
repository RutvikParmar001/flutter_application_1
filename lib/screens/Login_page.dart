import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Forgot_pass.dart';
import 'package:flutter_application_1/screens/Home_page.dart';
import 'package:flutter_application_1/screens/Signup_page.dart';
// import 'package:flutter_fb_auth_email';

// ignore: camel_case_types
class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

// ignore: camel_case_types
class _Login_pageState extends State<Login_page> {
  // final _formkey = GlobalKey();
  final _formkey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  // userLogin() async {
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(email: email, password: password);
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: ((context) => Home_Page())));
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-ffound') {
  //       print("No User Found");
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(const SnackBar(content: Text("User Not Found")));
  //     } else if (e.code == 'wrong-password') {
  //       print("Wrong Password");
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(const SnackBar(content: Text("Wrong Password")));
  //     }
  //   }
  // }
  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Signup_Page()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("no user found");
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "No user Found",
              style: TextStyle(fontSize: 20.0),
            )));
      } else if (e.code == 'worng-password') {
        print("Worng password provid by User");
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Worng password provide by user",
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
            "Login Page",
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Welcone back",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Email:",
                    border: OutlineInputBorder(),
                  ),
                  controller: emailcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter your email";
                    } else if (!value.contains('@')) {
                      return "Please Enter your vaild email";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password:",
                    border: OutlineInputBorder(),
                  ),
                  controller: passwordcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter your email";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
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
                            password = passwordcontroller.text;
                          });

                          userLogin();
                        }
                      },
                      child: const Text("Login"),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const Forgot_Password())));
                        },
                        child: const Text("forgot password")),
                    ElevatedButton(
                        onPressed: () {
                          emailcontroller.clear();
                          passwordcontroller.clear();
                        },
                        child: const Text("Reset"))
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Dont't have Account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const Signup_Page())));
                        },
                        child: const Text("Signup"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
