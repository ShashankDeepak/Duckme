// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_build_context_synchronously

import 'dart:ui';
import 'package:duckme/pages/home.dart';
import 'package:duckme/pages/form.dart';
import 'package:duckme/pages/title_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:ui' as ui;

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.black,
            tabs: [
              GButton(
                  icon: MdiIcons.fileDocumentEditOutline,
                  text: 'Form',
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => FormPage()),
                    );
                  }),
              GButton(
                  icon: MdiIcons.home,
                  text: 'Home',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  }),
              GButton(icon: Icons.person, text: 'Profile', onPressed: () {}),
            ],
            selectedIndex: 2,
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              CustomPaint(
                size: Size(
                  w(1),
                  (w(1) * 0.6102564102564103).toDouble(),
                ),
                painter: RPSCustomPainter(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: h(0.06),
                    ),
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaY: 50, sigmaX: 50),
                      child: SvgPicture.asset("assets/Blur ellipse.svg"),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: h(0.225),
                    ),
                    child: CustomPaint(
                      size: Size(
                        w(0.3),
                        (w(0.3)).toDouble(),
                      ),
                      painter: TopCircleShape(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: h(0.21),
                    ),
                    child: Container(
                      width: w(0.165),
                      height: h(0.165),
                      child:
                          SvgPicture.asset("assets/Ducks/Surprised duck.svg"),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: h(0.12),
                    ),
                    child: Text(
                      "Duckmé",
                      style: GoogleFonts.lilyScriptOne(
                        fontSize: 40,
                        color: HexColor("FFFFFF"),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: h(0.4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Brad Johnson",
                      style: GoogleFonts.lato(
                        fontSize: 21,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: h(0.46),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "bradj@gmail.com",
                      style: GoogleFonts.lato(
                        fontSize: 21,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.only(
                left: w(0.25),
                top: h(0.05),
              ),
              child: Row(
                children: [
                  SvgPicture.asset("assets/Icons/Group.svg"),
                  Padding(
                    padding: EdgeInsets.only(
                      left: w(0.1),
                    ),
                    child: Text(
                      "Credits",
                      style: GoogleFonts.lato(
                        fontSize: 21,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
            height: h(0.02),
            indent: w(0.1),
            endIndent: w(0.1),
          ),
          TextButton(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.only(
                left: w(0.25),
              ),
              child: Row(
                children: [
                  SvgPicture.asset("assets/Icons/Info.svg"),
                  Padding(
                    padding: EdgeInsets.only(
                      left: w(0.1),
                    ),
                    child: Text(
                      "How to use?",
                      style: GoogleFonts.lato(
                        fontSize: 21,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
            height: h(0.02),
            indent: w(0.1),
            endIndent: w(0.1),
          ),
          TextButton(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.only(
                left: w(0.25),
              ),
              child: Row(
                children: [
                  SvgPicture.asset("assets/Icons/Donate.svg"),
                  Padding(
                    padding: EdgeInsets.only(
                      left: w(0.1),
                    ),
                    child: Text(
                      "Donate Us",
                      style: GoogleFonts.lato(
                        fontSize: 21,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
            height: h(0.02),
            indent: w(0.1),
            endIndent: w(0.1),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => titlePage(),
                ),
              );

              // print(uid);
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: w(0.25),
              ),
              child: Row(
                children: [
                  SvgPicture.asset("assets/Icons/Logout.svg"),
                  Padding(
                    padding: EdgeInsets.only(
                      left: w(0.1),
                    ),
                    child: Text(
                      "Logout",
                      style: GoogleFonts.lato(
                        fontSize: 21,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.7345504);
    path_0.cubicTo(
        size.width * 0.1398731,
        size.height * 0.9015000,
        size.width * 0.3121231,
        size.height,
        size.width * 0.4984128,
        size.height);
    path_0.cubicTo(
        size.width * 0.6859795,
        size.height,
        size.width * 0.8593103,
        size.height * 0.9001471,
        size.width * 0.9996949,
        size.height * 0.7311092);
    path_0.lineTo(size.width * 0.9996949, 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height * 0.7345504);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * -0.2868923, size.height * 0.6428571),
        Offset(size.width * 2.538156, size.height * 0.6197479), [
      Color(0xffFF8A00).withOpacity(1),
      Color(0xffFFC684).withOpacity(0.536458),
      Color(0xffFFB967).withOpacity(0)
    ], [
      0,
      0.463542,
      1
    ]);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TopCircleShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.2022059, size.height * 0.2058824),
        Offset(size.width * 0.8345588, size.height * 0.8786765),
        [Color(0xffE0DFDF).withOpacity(1), Colors.white.withOpacity(1)],
        [0, 1]);
    canvas.drawCircle(Offset(size.width * 0.5000000, size.height * 0.5000000),
        size.width * 0.5000000, paint_0_fill);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.5000000, size.height * 0.5000000),
        size.width * 0.5000000, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
