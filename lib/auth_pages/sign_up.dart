// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duckme/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

FirebaseFirestore firestore = FirebaseFirestore.instance;
User? user = FirebaseAuth.instance.currentUser;

bool _obscureText = true;

String name = "";
String email = "";
String password = "";
var uid = user!.uid;

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    double heightOfDevice = MediaQuery.of(context).size.height;
    double widthOfDevice = MediaQuery.of(context).size.width;

    bool snackBar(String name, String email, String password) {
      if (!email.contains('@')) {
        final snackBar = SnackBar(
          content: const Text('Please enter a vaild email'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return false;
      }
      if (password.length < 6) {
        final snackBar = SnackBar(
          content: const Text('Password must be greater than 6'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return false;
      }
      if (name == '') {
        final snackBar = SnackBar(
          content: const Text('Name cannot be empty'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return false;
      }

      if (email == '') {
        final snackBar = SnackBar(
          content: const Text('Email cannot be empty'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return false;
      }
      if (password == '') {
        final snackBar = SnackBar(
          content: const Text('Password cannot be empty'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return false;
      }
      return true;
    }

    void signUp(String email, String password) {
      if (email == "") {}
    }

    double h(double height) {
      return heightOfDevice * height;
    }

    double w(double width) {
      return widthOfDevice * width;
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: w(1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: h(0.14), right: w(0.508)),
                  child: Text(
                    "SignUp",
                    style: GoogleFonts.lato(
                      fontSize: 50,
                      color: HexColor("2E2E2E"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: h(0.014),
                    right: w(0.65),
                  ),
                  child: Text(
                    "Welcome!",
                    style: GoogleFonts.lato(
                      fontSize: 22,
                      color: HexColor("2E2E2E"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: w(0.05),
                    top: h(0.03),
                    left: w(0.05),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text("Name"),
                      labelStyle: GoogleFonts.lato(fontSize: 20),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "Brad Johnson",
                      hintStyle: GoogleFonts.lato(fontSize: 18),
                      fillColor: HexColor("939393"),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: HexColor("2E2E2E"), width: 1),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onChanged: (value) {
                      name = value;
                      //(name);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: w(0.05),
                    top: h(0.03),
                    left: w(0.05),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text("E-mail Address"),
                      labelStyle: GoogleFonts.lato(fontSize: 20),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "bradjohnson19@gmail.com",
                      hintStyle: GoogleFonts.lato(fontSize: 18),
                      fillColor: HexColor("939393"),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: HexColor("2E2E2E"), width: 1),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                      //(password);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: w(0.05),
                    top: h(0.03),
                    left: w(0.05),
                  ),
                  child: TextFormField(
                    //controller: passwordController,
                    style: TextStyle(fontSize: 16.0),
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: HexColor("2E2E2E"), width: 1),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      label: Text("Password"),
                      labelStyle: GoogleFonts.lato(fontSize: 20),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "********",
                      hintStyle: GoogleFonts.lato(fontSize: 18),
                      fillColor: HexColor("939393"),
                      suffixIcon: IconButton(
                        icon: (_obscureText
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),

                    onChanged: (value) {
                      password = value;
                      //(password);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h(0.05)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: SizedBox(
                      width: w(0.65),
                      height: h(0.075),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: HexColor("FF5D02").withOpacity(0.8)),
                        onPressed: () async {
                          if (snackBar(name, email, password)) {
                            try {
                              UserCredential credential = await FirebaseAuth
                                  .instance
                                  .createUserWithEmailAndPassword(
                                      email: email, password: password);
                              if (credential != null) {
                                await firestore
                                    .collection("users")
                                    .doc(uid)
                                    .set({
                                  "name": name,
                                  "email": email,
                                });

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()),
                                );
                              }
                            } on FirebaseAuthException {
                              final snackBar = SnackBar(
                                content: Text('Email already in use'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        },
                        child: Text(
                          "SIGNUP",
                          style: GoogleFonts.lato(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/Bottom people.svg"),
                ],
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/Bottom people.svg"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
