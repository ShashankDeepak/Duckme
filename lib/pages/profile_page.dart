import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:ui' as ui;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
            onPressed: () {},
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
