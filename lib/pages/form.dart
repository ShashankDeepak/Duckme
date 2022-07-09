// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class FormPage extends StatefulWidget {
  FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
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

    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 5,
          child: NestedScrollView(
            headerSliverBuilder: (_, __) {
              return [
                SliverAppBar(
                  // expandedHeight: 200,
                  toolbarHeight: h(0.02),
                  pinned: true,
                  floating: false,
                  backgroundColor: Colors.white,

                  centerTitle: true,
                  bottom: TabBar(isScrollable: true,
                      // ignore: prefer_const_literals_to_create_immutables
                      tabs: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 18.0),
                          child: Text("Personal"),
                        ),
                        // Text("Personal"),
                        // Text("Personal"),
                        // Text("Personal"),
                        // Text("Personal"),
                        Padding(
                          padding: EdgeInsets.only(bottom: 18.0),
                          child: Text("Education"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 18.0),
                          child: Text("Work"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 18.0),
                          child: Text("Personal"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 18.0),
                          child: Text("Personal"),
                        ),
                      ]),
                )
              ];
            },
            body: TabBarView(
              children: [
                Container(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: h(0.025),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: w(0.9),
                                  height: h(0.3),
                                  decoration: BoxDecoration(
                                    color: HexColor("F0F0F0"),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: h(0.26),
                              left: w(0.82),
                            ),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: HexColor("000000").withOpacity(0.25),
                                    blurRadius: 10,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    HexColor("EEEEEE"),
                                    HexColor("FFFFFF")
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: h(0.25),
                              left: w(0.845),
                            ),
                            child: Container(
                              height: h(0.1),
                              width: w(0.1),
                              child: SvgPicture.asset(
                                  "assets/Icons/Plus icon.svg"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: h(0.26),
                              left: w(0.82),
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'bradjonson119@gmail.com',
                          labelText: 'First name',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(),
                Container(),
                Container(),
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
