// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Template1 extends StatefulWidget {
  Template1({Key? key}) : super(key: key);

  @override
  State<Template1> createState() => _Template1State();
}

class _Template1State extends State<Template1> {
  @override
  Widget build(BuildContext context) {
    double h(double height) {
      return MediaQuery.of(context).size.height * height;
    }

    double w(double width) {
      return MediaQuery.of(context).size.width * width;
    }

    List<Color> col = [Colors.grey, Colors.red, Colors.pink];
    int index = 0;

    increment() {
      setState(() {
        index++;
      });
    }

    decrement() {
      setState(() {
        index--;
      });
    }

    Widget rightExpanded(int index) {
      return Expanded(
        child: Container(
          color: col[index],
          child: Column(
            children: [],
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Container(
            color: Colors.orange,
            height: h(0.07),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    if (index == 0) {
                    } else {
                      decrement();
                    }
                  },
                ),
                Icon(
                  Icons.color_lens_rounded,
                  color: Colors.white,
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      if (index == col.length - 1) {
                      } else {
                        increment();
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        body: Row(
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
                      Text(
                        "Contacts",
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "Email: " + "someone@something.com",
                        style: GoogleFonts.lato(
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        "Phone: " + "+00 123456789",
                        style: GoogleFonts.lato(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Expanded(
            //   child: Container(
            //     color: col[index],
            //     child: Column(
            //       children: [],
            //     ),
            //   ),
            // ),
            rightExpanded(index),
          ],
        ),
      ),
    );
  }
}
