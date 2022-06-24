// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: h(0.06), left: 30.0),
                child: Text(
                  "SignUp",
                  style: GoogleFonts.lato(fontSize: 60),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: h(0.014), left: 30.0),
                child: Text(
                  "Welcome!",
                  style: GoogleFonts.lato(fontSize: 20),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 30.0, top: 30, left: 30.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    label: Text("Name"),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "BradPit",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 30.0, top: 30, left: 30.0),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    label: Text("Username"),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "BradPit119",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 30.0, top: 30, left: 30.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    label: Text("E-mail Address"),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "bradpit19@gmail.com",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 30.0, top: 30, left: 30.0),
                child: TextField(
                  //controller: passwordController,
                  style: TextStyle(fontSize: 16.0),
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text("Password"),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "********",
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
                padding: EdgeInsets.only(top: 20, left: 50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: SizedBox(
                    width: w(0.75),
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
              SvgPicture.asset("assets/Bottom people.svg"),
            ],
          ),
        ),
      ),
    );
  }
}
