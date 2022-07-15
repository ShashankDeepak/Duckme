import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class HowToUse extends StatefulWidget {
  HowToUse({Key? key}) : super(key: key);

  @override
  State<HowToUse> createState() => _HowToUseState();
}

class _HowToUseState extends State<HowToUse> {
  @override
  Widget build(BuildContext context) {
    double h(double height) {
      return MediaQuery.of(context).size.height * height;
    }

    double w(double width) {
      return MediaQuery.of(context).size.width * width;
    }

    Widget duckRow(String line) {
      return Padding(
        padding: EdgeInsets.only(
          top: h(0.015),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: w(0.08),
              height: h(0.05),
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.black),
              // ),
              child: SvgPicture.asset(
                "assets/Ducks/Bullet duck.svg",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: w(0.03),
                // right: w(0.04),
              ),
              child: SizedBox(
                width: w(0.8),
                child: Text(
                  line,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.3,
                    height: h(0.0017),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w(0.04),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: h(0.025),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Hey there!",
                        style: GoogleFonts.lato(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Container(
                        width: w(0.1),
                        height: h(0.1),
                        child: SvgPicture.asset("assets/Waving wing.svg"),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Let me guide you through a series of steps to build you the most amazing resume for your dream job ~",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.3,
                    height: h(0.0017),
                  ),
                ),
                duckRow(
                  "Click on the form button on the bottom right corner of your screen.",
                ),
                duckRow(
                  "Enter all your details in the form provided.",
                ),
                duckRow(
                  "Click on the save button to save your entries.",
                ),
                duckRow(
                  "Scroll through the tabs to fill in all the details accordingly.",
                ),
                duckRow(
                  "Don’t forget to save your work each time!",
                ),
                duckRow(
                  "When done, click on the home button.",
                ),
                duckRow(
                  "Choose your perfect resume template.",
                ),
                duckRow(
                  "Voila! you’re done!",
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: h(0.02),
                  ),
                  child: duckRow(
                    "Good luck!",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
