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
                Container(),
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
