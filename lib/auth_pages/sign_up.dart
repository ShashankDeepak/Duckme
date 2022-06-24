// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

bool _obscureText = true;

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    double heightOfDevice = MediaQuery.of(context).size.height;
    double widthOfDevice = MediaQuery.of(context).size.width;

    TextEditingController nameController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    String password = "";

    double h(double height) {
      return heightOfDevice * height;
    }

    double w(double width) {
      return widthOfDevice * width;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: w(1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: h(0.06), right: w(0.508)),
                child: Text(
                  "SignUp",
                  style: GoogleFonts.lato(
                    fontSize: 50,
                    color: HexColor("2E2E2E"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: h(0.014),
                  right: w(0.65),
                ),
                child: Text(
                  "Welcome!",
                  style: GoogleFonts.lato(
                    fontSize: 22,
                    color: HexColor("2E2E2E"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: w(0.05),
                  top: h(0.03),
                  left: w(0.05),
                ),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    label: Text("Name"),
                    labelStyle: GoogleFonts.lato(fontSize: 20),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Brad Johnson",
                    hintStyle: GoogleFonts.lato(fontSize: 18),
                    fillColor: HexColor("939393"),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: HexColor("2E2E2E"), width: 1),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: w(0.05),
                  top: h(0.03),
                  left: w(0.05),
                ),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    label: Text("Username"),
                    labelStyle: GoogleFonts.lato(fontSize: 20),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "bradjohnson19",
                    hintStyle: GoogleFonts.lato(fontSize: 18),
                    fillColor: HexColor("939393"),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: HexColor("2E2E2E"), width: 1),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: w(0.05),
                  top: h(0.03),
                  left: w(0.05),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    label: Text("E-mail Address"),
                    labelStyle: GoogleFonts.lato(fontSize: 20),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "bradjohnson19@gmail.com",
                    hintStyle: GoogleFonts.lato(fontSize: 18),
                    fillColor: HexColor("939393"),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: HexColor("2E2E2E"), width: 1),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: w(0.05),
                  top: h(0.03),
                  left: w(0.05),
                ),
                child: TextField(
                  //controller: passwordController,
                  style: TextStyle(fontSize: 16.0),
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: HexColor("2E2E2E"), width: 1),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    label: Text("Password"),
                    labelStyle: GoogleFonts.lato(fontSize: 20),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "********",
                    hintStyle: GoogleFonts.lato(fontSize: 18),
                    fillColor: HexColor("939393"),
                    suffixIcon: IconButton(
                      icon: (_obscureText
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off)),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  onChanged: (value) {
                    password = value;
                    //print(password);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: h(0.02)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: SizedBox(
                    width: w(0.65),
                    height: h(0.075),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.orange),
                      onPressed: () {},
                      child: Text(
                        "SIGNUP",
                        style: GoogleFonts.lato(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: h(0.0155),
                ),
                child: SvgPicture.asset("assets/Bottom people.svg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
