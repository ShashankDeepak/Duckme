// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:duckme/auth_pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class titlePage extends StatelessWidget {
  const titlePage({super.key});

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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffffaf51), Color(0xffffedd9)],
          ),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(top: h(0.08)),
              child: SvgPicture.asset("assets/Group 28.svg"),
            ),
            Text(
              "Hey There!",
              style: GoogleFonts.lato(fontSize: 35),
            ),
            Padding(
              padding: EdgeInsets.only(top: h(0.058), bottom: 20),
              child: SvgPicture.asset("assets/good group.svg", width: w(0.85)),
            ),
            SvgPicture.asset("assets/Group 27.svg"),
            Center(
              child: Text("Create  your  very  own",
                  style: GoogleFonts.lato(fontSize: 28)),
            ),
            Stack(
              children: [
                Center(
                  child: Text("personalized resume",
                      style: GoogleFonts.lato(fontSize: 28)),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset("assets/Group 30.svg")),
              ],
            ),
            Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: SizedBox(
                      width: w(0.75),
                      height: h(0.075),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.orange),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => authPage()),
                          );
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Get Started",
                            style: GoogleFonts.lato(
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 33.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SvgPicture.asset(
                          "assets/Group 24.svg",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 80.0, left: 40),
                      child: SvgPicture.asset("assets/Group 26.svg"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
