import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  bool _isObscure = true;

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: h(0.16),
                right: w(0.619),
              ),
              child: Text(
                "Login",
                style: GoogleFonts.lato(
                  fontSize: 50,
                  color: HexColor('2E2E2E'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: h(0.02),
                right: w(0.33),
              ),
              child: Text(
                "Please login to continue",
                style: GoogleFonts.lato(
                  fontSize: 22,
                  color: HexColor('2E2E2E'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: h(0.05),
                right: w(0.05),
                left: w(0.05),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Username',
                  labelStyle: GoogleFonts.lato(fontSize: 20),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: HexColor("2E2E2E"), width: 1),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  hintText: 'Brad Johnson',
                  hintStyle: GoogleFonts.lato(fontSize: 18),
                  fillColor: HexColor("939393"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: h(0.03),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: w(0.05),
                left: w(0.05),
              ),
              child: TextFormField(
                obscureText: _isObscure,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Password',
                    labelStyle: GoogleFonts.lato(fontSize: 20),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: HexColor("2E2E2E"), width: 1),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    hintText: '********',
                    hintStyle: GoogleFonts.lato(fontSize: 18),
                    fillColor: HexColor("939393"),
                    suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        })),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: h(0.02),
                left: w(0.625),
              ),
              child: InkWell(
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    color: HexColor('2E2E2E'),
                  ),
                ),
                onTap: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: h(0.06),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: SizedBox(
                width: w(0.65),
                height: h(0.075),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: HexColor("FF5D02").withOpacity(0.8),
                  ),
                  child: Text(
                    "LOGIN",
                    style: GoogleFonts.lato(
                      fontSize: 22,
                      color: HexColor('FFFFFF'),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: h(0.077),
              ),
            ),
            SvgPicture.asset("assets/Bottom people.svg"),
          ],
        ),
      ),
    );
  }
}
