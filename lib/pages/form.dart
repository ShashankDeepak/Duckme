// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Class/user.dart';

class FormPage extends StatefulWidget {
  FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

User user = User();

class _FormPageState extends State<FormPage> {
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
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: h(0.025),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: w(0.04),
                                ),
                                child: Container(
                                  width: w(1),
                                  height: h(0.3),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Card(
                                      elevation: 5,
                                      color: HexColor("F0F0F0"),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset("assets/User.svg"),
                                          Text(
                                            "Add your \n photo here",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w300,
                                              color: HexColor("757575"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: h(0.26),
                                left: w(0.82),
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: HexColor("000000")
                                            .withOpacity(0.25),
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
                                  // child: IconButton(
                                  //   alignment: Alignment.center,
                                  //   iconSize: 50,
                                  //   icon:
                                  //       Icon(Icons.add, color: Colors.orange),
                                  //   onPressed: () {},
                                  // )
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: SvgPicture.asset(
                                      "assets/Icons/Plus icon.svg",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: h(0.25),
                                left: w(0.845),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: w(0.735),
                            bottom: h(0.005),
                          ),
                          child: Text(
                            "First name",
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: HexColor("2E2E2E"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w(0.04),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              user.firstname = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'Brad',
                              hintStyle: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: w(0.735),
                            bottom: h(0.005),
                            top: h(0.01),
                          ),
                          child: Text(
                            "Last name",
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: HexColor("2E2E2E"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w(0.04),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              user.lastname = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'Johnson',
                              hintStyle: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: w(0.69),
                            bottom: h(0.005),
                            top: h(0.01),
                          ),
                          child: Text(
                            "Date of birth",
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: HexColor("2E2E2E"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w(0.04),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.calendar_month_outlined),
                                color: Colors.orange,
                                onPressed: () {},
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: '24/02/2003',
                              hintStyle: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: w(0.735),
                            bottom: h(0.005),
                            top: h(0.01),
                          ),
                          child: Text(
                            "Last name",
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: HexColor("2E2E2E"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w(0.04),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'Johnson',
                              hintStyle: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: w(0.735),
                            bottom: h(0.005),
                            top: h(0.01),
                          ),
                          child: Text(
                            "Last name",
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: HexColor("2E2E2E"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w(0.04),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'Johnson',
                              hintStyle: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: w(0.735),
                            bottom: h(0.005),
                            top: h(0.01),
                          ),
                          child: Text(
                            "Last name",
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: HexColor("2E2E2E"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w(0.04),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'Johnson',
                              hintStyle: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
