// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class fresherTemplate1 extends StatefulWidget {
  fresherTemplate1({Key? key}) : super(key: key);

  @override
  State<fresherTemplate1> createState() => _fresherTemplate1State();
}

class _fresherTemplate1State extends State<fresherTemplate1> {
  @override
  Widget build(BuildContext context) {
    double h(double height) {
      return MediaQuery.of(context).size.height * height;
    }

    double w(double width) {
      return MediaQuery.of(context).size.width * width;
    }

    int index = 0;
    // Color _colorIndex = Colors.grey;

    String name = "Shashank";

    // List<Color> col = [Colors.grey, Colors.red, Colors.pink];

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Container(
            decoration: BoxDecoration(
              // color: Colors.white,

              border: Border.all(width: 2),
            ),
            height: h(0.07),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.black,
                  onPressed: () {},
                ),
                Icon(
                  Icons.color_lens_rounded,
                  color: Colors.black,
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  color: Colors.black,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.black,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    color: Colors.black,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: w(0.03),
                        top: h(0.034),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: h(0.2)),
                            child: Text(
                              "Contacts",
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Text(
                            "Email: " + "someone@something.com",
                            style: GoogleFonts.lato(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "Phone: " + "+00 123456789",
                            style: GoogleFonts.lato(
                              fontSize: 12,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: h(0.03),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Awards",
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "2015",
                                    style: GoogleFonts.lato(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Awarad 1",
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                    style: GoogleFonts.lato(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 15.0),
                                  child: Text(
                                    "2016",
                                    style: GoogleFonts.lato(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Awarad 2",
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                    style: GoogleFonts.lato(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: h(0.03),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Education",
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          "2015 - 2020",
                                          style: GoogleFonts.lato(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "University/Coledge",
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        "9.1",
                                        style: GoogleFonts.lato(
                                          fontSize: 10,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: Text(
                                          "2013 - 2015",
                                          style: GoogleFonts.lato(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Secondary High School",
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        "94%",
                                        style: GoogleFonts.lato(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: h(0.02)),
                                  child: Text(
                                    "Intrests",
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            "Chess",
                                            style: GoogleFonts.lato(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            "Gamming",
                                            style: GoogleFonts.lato(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            "Drawing",
                                            style: GoogleFonts.lato(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              "Chess",
                                              style: GoogleFonts.lato(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              "Gamming",
                                              style: GoogleFonts.lato(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              "Drawing",
                                              style: GoogleFonts.lato(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.grey,
                    child: InkWell(
                      onTap: () => {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: h(0.04),
                            ),
                            child: Text(
                              name,
                              style: GoogleFonts.josefinSlab(
                                fontSize: 45,
                              ),
                            ),
                          ),
                          Text(
                            "Deepak",
                            style: GoogleFonts.josefinSlab(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: h(0.079),
                              left: w(0.02),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Skills",
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "• C++",
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "• Java",
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "• Python",
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "• Flutter",
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: h(0.03)),
                                  child: Text(
                                    "Projects",
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: h(0.02)),
                                  child: Text(
                                    "Project Heading 1",
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing",
                                    style: GoogleFonts.lato(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: h(0.015)),
                                  child: Text(
                                    "Project Heading 2",
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing",
                                    style: GoogleFonts.lato(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: h(0.02),
                                  ),
                                  child: Text(
                                    "Project Heading 3",
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing",
                                    style: GoogleFonts.lato(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: h(0.03)),
                                  child: Text(
                                    "Socials",
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: h(0.02),
                                  ),
                                  child: Text(
                                    "GitHub",
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    "@shashankdeepak",
                                    style: GoogleFonts.lato(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: h(0.02),
                                  ),
                                  child: Text(
                                    "LinkDin",
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    "@shashankdeepak",
                                    style: GoogleFonts.lato(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
