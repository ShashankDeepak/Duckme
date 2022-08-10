// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:duckme/Templates/Templates%201/FresherTemplate1.dart';
import 'package:duckme/pages/form.dart';
import 'package:duckme/pages/profile_page.dart';
import 'package:duckme/pages/title_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

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

int _selectedIndex = 1;

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
        // actions: [
        //   ClipRRect(
        //     borderRadius: BorderRadius.circular(100),
        //     child: ElevatedButton(
        //       style: ElevatedButton.styleFrom(primary: Colors.blue),
        //       onPressed: () async {
        //         await FirebaseAuth.instance.signOut();

        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => titlePage(),
        //           ),
        //         );

        //         print(uid);
        //       },
        //       child: Text("signout"),
        //     ),
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: w(1),
              height: h(0.6),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xffffaf51), Color(0xffffedd9)],
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Our Picks",
                      style: GoogleFonts.lato(fontSize: 30),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          pushNewScreen(
                            context,
                            screen: fresherTemplate1(),
                            withNavBar: false,
                          );
                        },
                        child: Container(
                          width: w(0.3),
                          height: h(0.22),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              // color: Color(0xffd9d9d9),
                              image: DecorationImage(
                                image: AssetImage("assets/template1.jpg"),
                                fit: BoxFit.fill,
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: w(0.3),
                          height: h(0.25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xffd9d9d9),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: w(0.3),
                          height: h(0.22),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xffd9d9d9),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Container(
                        width: w(1),
                        height: 620,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(58),
                            topRight: Radius.circular(58),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 45.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 163,
                                      height: 58,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xffff8e4e),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SvgPicture.asset(
                                              "assets/Girl fresher.svg"),
                                          Text(
                                            "Freshman",
                                            style: GoogleFonts.lato(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 163,
                                      height: 58,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xffff8e4e),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SvgPicture.asset(
                                              "assets/male employee.svg"),
                                          Text(
                                            "Experienced",
                                            style: GoogleFonts.lato(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 500,
                              child: GridView.count(
                                // primary: false,
                                physics: NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.all(20),
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                crossAxisCount: 2,
                                childAspectRatio: 1 / 1.4,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: w(0.3),
                                      height: h(0.25),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Color(0xffd9d9d9),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: w(0.3),
                                      height: h(0.25),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Color(0xffd9d9d9),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: w(0.3),
                                      height: h(0.25),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Color(0xffd9d9d9),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: w(0.3),
                                      height: h(0.25),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Color(0xffd9d9d9),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
