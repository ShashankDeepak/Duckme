// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_divider/text_divider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:hexcolor/hexcolor.dart';

class fresherTemplate2 extends StatefulWidget {
  fresherTemplate2({Key? key}) : super(key: key);

  @override
  State<fresherTemplate2> createState() => _fresherTemplate2State();
}

class _fresherTemplate2State extends State<fresherTemplate2> {
  @override
  Widget build(BuildContext context) {
    double h(double height) {
      return MediaQuery.of(context).size.height * height;
    }

    double w(double width) {
      return MediaQuery.of(context).size.width * width;
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: h(0.3),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: h(0.04),
                          ),
                          child: Text(
                            "Rene Maury",
                            style: GoogleFonts.lato(
                              fontSize: 40,
                              color: Color.fromARGB(255, 1, 32, 58),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(221, 1, 33, 59),
                          ),
                          child: IntrinsicWidth(
                            stepWidth: 100,
                            child: Center(
                              child: Text(
                                "Software Developer",
                                // maxLines: 1,
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 35),
                          child: TextDivider.horizontal(
                            thickness: 0.5,
                            text: Text(
                              'Profile',
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                color: Color.fromARGB(255, 1, 32, 58),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Flexible(
                            child: AutoSizeText(
                              textAlign: TextAlign.center,
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                              style: TextStyle(fontSize: 5),
                              maxLines: 4,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: h(1),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.phone_android_outlined,
                                  ),
                                  AutoSizeText(
                                    ": +91 0123456789",
                                    style: GoogleFonts.openSans(
                                      fontSize: 11,
                                      color: HexColor("575757"),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: w(1),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                ),
                                child: IntrinsicWidth(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.email_outlined,
                                      ),
                                      Flexible(
                                        child: Text(
                                          maxLines: 1,
                                          ": examplemail@example.com",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: HexColor("575757"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: h(1),
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
