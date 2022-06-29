// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:duckme/title_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

List<String> profileImage = [
  "Bored duck.svg",
  "Heart eye duck.svg",
  "Psy Duck.svg",
  "Surprised duck.svg",
  "Swag duck.svg"
];
User? user = FirebaseAuth.instance.currentUser;
var uid = user!.uid;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double heightOfDevice = MediaQuery.of(context).size.height;
    double widthOfDevice = MediaQuery.of(context).size.width;

    double h(double height) {
      return heightOfDevice * height;
    }

    double w(double width) {
      return widthOfDevice * width;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("FF8A00"),
        automaticallyImplyLeading: false,
        title: Text(
          "Duckmé",
          style: GoogleFonts.lilyScriptOne(color: Colors.white, fontSize: 30),
        ),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => titlePage(),
                  ),
                );

                print(uid);
              },
              child: Text("signout"),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: w(1),
          height: h(1),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xffffaf51), Color(0xffffedd9)],
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0, top: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Our Picks",
                    style: GoogleFonts.lato(fontSize: 24),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(
                    top: h(0.02),
                    left: w(0.038),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: w(0.27),
                        height: h(0.2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffd9d9d9),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Container(
                            width: w(0.3),
                            height: h(0.25),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffd9d9d9),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Container(
                            width: w(0.27),
                            height: h(0.2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffd9d9d9),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Expanded(
                  child: Container(
                    width: w(1),
                    height: h(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(58),
                        topRight: Radius.circular(58),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
