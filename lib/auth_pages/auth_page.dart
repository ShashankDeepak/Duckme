import 'package:duckme/auth_pages/login_page.dart';
import 'package:duckme/auth_pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class authPage extends StatelessWidget {
  const authPage({Key? key}) : super(key: key);

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
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: h(0.13),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/Duck logo.svg"),
                  Text(
                    "Duckmé",
                    style: GoogleFonts.lilyScriptOne(
                      fontSize: 40,
                      color: HexColor("FF9900"),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: h(0.05),
                ),
              ),
              Text(
                "Bag your dream jobs",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 24,
                  color: HexColor("595959"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: h(0.01),
                ),
              ),
              Text(
                "with these amazing",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 24,
                  color: HexColor("595959"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: h(0.01),
                ),
              ),
              Text(
                "resumes!",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 24,
                  color: HexColor("595959"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: h(0.07),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: SizedBox(
                  width: w(0.65),
                  height: h(0.065),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: HexColor("FF5D02").withOpacity(0.8),
                    ),
                    child: Text(
                      "SIGNUP",
                      style: GoogleFonts.lato(
                        fontSize: 22,
                        color: HexColor('FFFFFF'),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: h(0.02),
                ),
              ),
              SizedBox(
                width: w(0.65),
                height: h(0.065),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    side: BorderSide(
                      color: HexColor("FF5D02").withOpacity(0.8),
                    ),
                  ),
                  child: Text(
                    "LOGIN",
                    style: (GoogleFonts.lato(
                      fontSize: 22,
                      color: HexColor("FF5D02").withOpacity(0.8),
                    )),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => loginPage()),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: h(0.05),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/Bottom people.svg"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
