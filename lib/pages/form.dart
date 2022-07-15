// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures
import 'dart:io';

import 'package:duckme/pages/home.dart';
import 'package:duckme/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../Class/user.dart';

class FormPage extends StatefulWidget {
  FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

UserCred user = UserCred();

class _FormPageState extends State<FormPage> {
  File? imageFile;
  final imagePicker = ImagePicker();

  Widget displayeImage() {
    if (imageFile == null) {
      return Image.asset(
        "assets/personal.png",
        fit: BoxFit.cover,
      );
    } else {
      return Image.file(
        imageFile!,
        fit: BoxFit.cover,
      );
    }
  }

  void pickImage() async {
    var image = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageFile = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    double h(double height) {
      return MediaQuery.of(context).size.height * height;
    }

    double w(double width) {
      return MediaQuery.of(context).size.width * width;
    }

    final maxLines = 5;

    DateTime dateTime;
    TextEditingController date = TextEditingController();
    final format = DateFormat("dd/MM/yyyy");

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
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
                  ),
                  GButton(
                      icon: MdiIcons.home,
                      text: 'Home',
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      }),
                  GButton(
                      icon: Icons.person,
                      text: 'Profile',
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()),
                        );
                      }),
                ],
                selectedIndex: 0,
              ),
            ),
          ),
          body: DefaultTabController(
            length: 8,
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
                            child: Text("Projects"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 18.0),
                            child: Text("Internships"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 18.0),
                            child: Text("Jobs"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 18.0),
                            child: Text("Skills"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 18.0),
                            child: Text("Certificates"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 18.0),
                            child: Text("Socials"),
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
                                      onTap: () {
                                        pickImage();
                                      },
                                      child: Card(
                                        elevation: 5,
                                        child: displayeImage(),
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
                                  onTap: () {
                                    pickImage();
                                  },
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
                                hintText: user.firstname,
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
                                hintText: user.lastname,
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
                            child: DateTimeField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: user.date,
                              ),
                              readOnly: true,
                              onChanged: ((value) {
                                if (value == null)
                                  user.date = user.date;
                                else
                                  user.date =
                                      DateFormat('dd/MM/yyyy').format(value);
                              }),
                              format: format,
                              onShowPicker: (context, currentValue) async {
                                return await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: w(0.66),
                              bottom: h(0.005),
                              top: h(0.01),
                            ),
                            child: Text(
                              "Email Address",
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
                                user.email = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: user.email,
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
                              "Address",
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
                                user.address = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: user.address,
                                hintStyle: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: w(0.785),
                              bottom: h(0.005),
                              top: h(0.01),
                            ),
                            child: Text(
                              "Phone",
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
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                user.phone = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: user.phone,
                                hintStyle: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: h(0.025),
                              left: w(0.04),
                            ),
                            child: Text(
                              "High School",
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Name of your school",
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: HexColor("2E2E2E"),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                user.highschool = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: user.highschool,
                                hintStyle: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: w(0.04),
                                  bottom: h(0.005),
                                  top: h(0.01),
                                ),
                                child: Text(
                                  "Year joined",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: HexColor("2E2E2E"),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: w(0.306),
                                  bottom: h(0.005),
                                  top: h(0.01),
                                ),
                                child: Text(
                                  "Year left",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: HexColor("2E2E2E"),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: w(0.04),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      right: w(0.001),
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        user.highSchoolJoined =
                                            int.parse(value);
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        hintText:
                                            user.highSchoolJoined.toString(),
                                        hintStyle: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: w(0.04),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      right: w(0.001),
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        user.highSchoolLeft = int.parse(value);
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        hintText:
                                            user.highSchoolLeft.toString(),
                                        hintStyle: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: w(0.04),
                              bottom: h(0.005),
                              top: h(0.01),
                            ),
                            child: Text(
                              "Percentage/CGPA",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(
                                right: w(0.6),
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  user.highSchoolmarks = double.parse(value);
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: user.highSchoolmarks.toString(),
                                  hintStyle: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: h(0.025),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Bachelors",
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Name of your university",
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: HexColor("2E2E2E"),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                user.university = (value);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: user.university,
                                hintStyle: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: w(0.04),
                                  bottom: h(0.005),
                                  top: h(0.01),
                                ),
                                child: Text(
                                  "Year joined",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: HexColor("2E2E2E"),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: w(0.306),
                                  bottom: h(0.005),
                                  top: h(0.01),
                                ),
                                child: Text(
                                  "Year left",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: HexColor("2E2E2E"),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: w(0.04),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      right: w(0.001),
                                    ),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        user.universityJoined =
                                            int.parse(value);
                                      },
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        hintText:
                                            user.universityJoined.toString(),
                                        hintStyle: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: w(0.04),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      right: w(0.001),
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        user.universityLeft = int.parse(value);
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        hintText:
                                            user.universityLeft.toString(),
                                        hintStyle: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: w(0.04),
                              bottom: h(0.005),
                              top: h(0.01),
                            ),
                            child: Text(
                              "Percentage/CGPA",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(
                                right: w(0.6),
                              ),
                              child: TextFormField(
                                onChanged: (value) {
                                  user.universityCGPA = double.parse(value);
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: user.universityCGPA.toString(),
                                  hintStyle: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: h(0.025),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Masters",
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Name of your university",
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: HexColor("2E2E2E"),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                user.masters = (value);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: user.masters,
                                hintStyle: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: w(0.04),
                                  bottom: h(0.005),
                                  top: h(0.01),
                                ),
                                child: Text(
                                  "Year joined",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: HexColor("2E2E2E"),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: w(0.306),
                                  bottom: h(0.005),
                                  top: h(0.01),
                                ),
                                child: Text(
                                  "Year left",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: HexColor("2E2E2E"),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: w(0.04),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      right: w(0.001),
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        user.masterJoined = int.parse(value);
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        hintText: user.masterJoined.toString(),
                                        hintStyle: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: w(0.04),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      right: w(0.001),
                                    ),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        user.masterLeft = int.parse(value);
                                      },
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        hintText: user.masterLeft.toString(),
                                        hintStyle: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: w(0.04),
                              bottom: h(0.005),
                              top: h(0.01),
                            ),
                            child: Text(
                              "Percentage/CGPA",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: w(0.04),
                              left: w(0.04),
                              bottom: h(0.01),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(
                                right: w(0.6),
                              ),
                              child: TextFormField(
                                onChanged: (value) {
                                  user.masterCGPA = double.parse(value);
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: user.masterCGPA.toString(),
                                  hintStyle: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: h(0.025),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Projects",
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Project 1",
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Heading",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                user.project1 = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: user.project1.toString(),
                                hintStyle: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Description",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: w(0.04),
                              left: w(0.04),
                              bottom: h(0.01),
                            ),
                            child: Container(
                              height: maxLines * 30,
                              child: TextFormField(
                                onChanged: (value) {
                                  user.project1Detail = (value);
                                },
                                maxLines: maxLines,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: user.project1Detail,
                                  hintStyle: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Project 2",
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Heading",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                user.project2 = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: user.project2,
                                hintStyle: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Description",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: w(0.04),
                              left: w(0.04),
                              bottom: h(0.01),
                            ),
                            child: Container(
                              height: maxLines * 30,
                              child: TextFormField(
                                onChanged: (value) {
                                  user.project2Detail = (value);
                                },
                                maxLines: maxLines,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: user.project2Detail,
                                  hintStyle: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Project 3",
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Heading",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                user.project3 = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: user.project3,
                                hintStyle: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Description",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: w(0.04),
                              left: w(0.04),
                              bottom: h(0.01),
                            ),
                            child: Container(
                              height: maxLines * 30,
                              child: TextFormField(
                                onChanged: (value) {
                                  user.project3Detail = value;
                                },
                                maxLines: maxLines,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: user.project3Detail,
                                  hintStyle: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: w(0.04),
                              top: h(0.025),
                            ),
                            child: Text(
                              "Internships",
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Internship 1",
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Heading",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                user.internship1 = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: user.internship1,
                                hintStyle: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: w(0.04),
                                  bottom: h(0.005),
                                  top: h(0.01),
                                ),
                                child: Text(
                                  "Year joined",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: HexColor("2E2E2E"),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: w(0.306),
                                  bottom: h(0.005),
                                  top: h(0.01),
                                ),
                                child: Text(
                                  "Year left",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: HexColor("2E2E2E"),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: w(0.02),
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        right: w(0.001),
                                      ),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          user.internship1Joined =
                                              int.parse(value);
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText:
                                              user.internship1Joined.toString(),
                                          hintStyle: GoogleFonts.lato(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: w(0.02),
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        right: w(0.001),
                                      ),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          user.internship1Left =
                                              int.parse(value);
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText:
                                              user.internship1Left.toString(),
                                          hintStyle: GoogleFonts.lato(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Description",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: w(0.04),
                              left: w(0.04),
                              bottom: h(0.01),
                            ),
                            child: Container(
                              height: maxLines * 30,
                              child: TextFormField(
                                onChanged: (value) {
                                  user.internship1Detail = value;
                                },
                                maxLines: maxLines,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: user.internship1Detail,
                                  hintStyle: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Internship 2",
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Heading",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                user.internship2 = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: user.internship2,
                                hintStyle: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: w(0.04),
                                  bottom: h(0.005),
                                  top: h(0.01),
                                ),
                                child: Text(
                                  "Year joined",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: HexColor("2E2E2E"),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: w(0.306),
                                  bottom: h(0.005),
                                  top: h(0.01),
                                ),
                                child: Text(
                                  "Year left",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: HexColor("2E2E2E"),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: w(0.02),
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        right: w(0.001),
                                      ),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          user.internship2Joined =
                                              int.parse(value);
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText:
                                              user.internship2Joined.toString(),
                                          hintStyle: GoogleFonts.lato(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: w(0.02),
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        right: w(0.001),
                                      ),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          user.internship2Left =
                                              int.parse(value);
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText:
                                              user.internship2Left.toString(),
                                          hintStyle: GoogleFonts.lato(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Description",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: w(0.04),
                              left: w(0.04),
                              bottom: h(0.01),
                            ),
                            child: Container(
                              height: maxLines * 30,
                              child: TextFormField(
                                onChanged: (value) {
                                  user.internship2Detail = value;
                                },
                                maxLines: maxLines,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: user.internship2Detail,
                                  hintStyle: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Internship 3",
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Heading",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                user.internship3 = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: user.internship3,
                                hintStyle: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: w(0.04),
                                  bottom: h(0.005),
                                  top: h(0.01),
                                ),
                                child: Text(
                                  "Year joined",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: HexColor("2E2E2E"),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: w(0.306),
                                  bottom: h(0.005),
                                  top: h(0.01),
                                ),
                                child: Text(
                                  "Year left",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: HexColor("2E2E2E"),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: w(0.02),
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        right: w(0.001),
                                      ),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          user.internship3Joined =
                                              int.parse(value);
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText:
                                              user.internship3Joined.toString(),
                                          hintStyle: GoogleFonts.lato(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: w(0.02),
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        right: w(0.001),
                                      ),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          user.internship3Left =
                                              int.parse(value);
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText:
                                              user.internship3Left.toString(),
                                          hintStyle: GoogleFonts.lato(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Description",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: w(0.04),
                              left: w(0.04),
                              bottom: h(0.01),
                            ),
                            child: Container(
                              height: maxLines * 30,
                              child: TextFormField(
                                onChanged: (value) {
                                  user.internship3Detail = value;
                                },
                                maxLines: maxLines,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: user.internship3Detail,
                                  hintStyle: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: w(0.04),
                            top: h(0.025),
                          ),
                          child: Text(
                            "Jobs",
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              color: HexColor("2E2E2E"),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: h(0.005),
                            top: h(0.01),
                            left: w(0.04),
                          ),
                          child: Text(
                            "Current company",
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              color: HexColor("2E2E2E"),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: h(0.005),
                            top: h(0.01),
                            left: w(0.04),
                          ),
                          child: Text(
                            "Company name",
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: HexColor("2E2E2E"),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w(0.04),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              user.currentCompany = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: user.currentCompany,
                              hintStyle: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: h(0.005),
                            top: h(0.01),
                            left: w(0.04),
                          ),
                          child: Text(
                            "Job role",
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: HexColor("2E2E2E"),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w(0.04),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              user.currentCompanyJobRole = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: user.currentCompanyJobRole,
                              hintStyle: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: w(0.04),
                            bottom: h(0.005),
                            top: h(0.01),
                          ),
                          child: Text(
                            "Year joined",
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: HexColor("2E2E2E"),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: w(0.04),
                            right: w(0.52),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: w(0.02),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(
                                right: w(0.001),
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  user.currentCompanyJoined = int.parse(value);
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText:
                                      user.currentCompanyJoined.toString(),
                                  hintStyle: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: h(0.005),
                            top: h(0.01),
                            left: w(0.04),
                          ),
                          child: Text(
                            "Description",
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: HexColor("2E2E2E"),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: w(0.04),
                            left: w(0.04),
                            bottom: h(0.01),
                          ),
                          child: Container(
                            height: maxLines * 30,
                            child: TextFormField(
                              onChanged: (value) {
                                user.currentCompanyDetail = value;
                              },
                              maxLines: maxLines,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: user.currentCompanyDetail,
                                hintStyle: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: h(0.005),
                            top: h(0.01),
                            left: w(0.04),
                          ),
                          child: Text(
                            "Second company",
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              color: HexColor("2E2E2E"),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: h(0.005),
                            top: h(0.01),
                            left: w(0.04),
                          ),
                          child: Text(
                            "Company name",
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: HexColor("2E2E2E"),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w(0.04),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              user.previousCompany2 = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: user.previousCompany2,
                              hintStyle: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: h(0.005),
                            top: h(0.01),
                            left: w(0.04),
                          ),
                          child: Text(
                            "Job role",
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: HexColor("2E2E2E"),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w(0.04),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              user.previousCompany2JobRole = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: user.previousCompany2JobRole,
                              hintStyle: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: w(0.04),
                                bottom: h(0.005),
                                top: h(0.01),
                              ),
                              child: Text(
                                "Year joined",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: HexColor("2E2E2E"),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: w(0.306),
                                bottom: h(0.005),
                                top: h(0.01),
                              ),
                              child: Text(
                                "Year left",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: HexColor("2E2E2E"),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w(0.04),
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: w(0.02),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      right: w(0.001),
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        user.previousCompany2Joined =
                                            int.parse(value);
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        hintText: user.previousCompany2Joined
                                            .toString(),
                                        hintStyle: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: w(0.02),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      right: w(0.001),
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        user.previousCompany2Left =
                                            int.parse(value);
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        hintText: user.previousCompany2Left
                                            .toString(),
                                        hintStyle: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: h(0.005),
                            top: h(0.01),
                            left: w(0.04),
                          ),
                          child: Text(
                            "Description",
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: HexColor("2E2E2E"),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: w(0.04),
                            left: w(0.04),
                            bottom: h(0.01),
                          ),
                          child: Container(
                            height: maxLines * 30,
                            child: TextFormField(
                              onChanged: (value) {
                                user.previousCompany2Detail = value;
                              },
                              maxLines: maxLines,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: user.previousCompany2Detail,
                                hintStyle: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: h(0.005),
                            top: h(0.01),
                            left: w(0.04),
                          ),
                          child: Text(
                            "First company",
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              color: HexColor("2E2E2E"),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: h(0.005),
                            top: h(0.01),
                            left: w(0.04),
                          ),
                          child: Text(
                            "Company name",
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: HexColor("2E2E2E"),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w(0.04),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              user.previousCompany1 = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: user.previousCompany1,
                              hintStyle: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: h(0.005),
                            top: h(0.01),
                            left: w(0.04),
                          ),
                          child: Text(
                            "Job role",
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: HexColor("2E2E2E"),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w(0.04),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              user.previousCompany1JobRole = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: user.previousCompany1JobRole,
                              hintStyle: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: w(0.04),
                                bottom: h(0.005),
                                top: h(0.01),
                              ),
                              child: Text(
                                "Year joined",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: HexColor("2E2E2E"),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: w(0.306),
                                bottom: h(0.005),
                                top: h(0.01),
                              ),
                              child: Text(
                                "Year left",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: HexColor("2E2E2E"),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w(0.04),
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: w(0.02),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      right: w(0.001),
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        user.previousCompany1Joined =
                                            int.parse(value);
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        hintText: user.previousCompany1Joined
                                            .toString(),
                                        hintStyle: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: w(0.02),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      right: w(0.001),
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        user.previousCompany1Left =
                                            int.parse(value);
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        hintText: user.previousCompany1Left
                                            .toString(),
                                        hintStyle: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: h(0.005),
                            top: h(0.01),
                            left: w(0.04),
                          ),
                          child: Text(
                            "Description",
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: HexColor("2E2E2E"),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: w(0.04),
                            left: w(0.04),
                            bottom: h(0.01),
                          ),
                          child: Container(
                            height: maxLines * 30,
                            child: TextFormField(
                              onChanged: (value) {
                                user.previousCompany1Detail = value;
                              },
                              maxLines: maxLines,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: user.previousCompany1Detail,
                                hintStyle: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                  ),
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: h(0.025),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Skills",
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: h(0.005),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: w(0.04),
                                    bottom: h(0.005),
                                    top: h(0.01),
                                  ),
                                  child: Text(
                                    "Skill 1",
                                    style: GoogleFonts.lato(
                                      fontSize: 16,
                                      color: HexColor("2E2E2E"),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: w(0.4),
                                    bottom: h(0.005),
                                    top: h(0.01),
                                  ),
                                  child: Text(
                                    "Rating",
                                    style: GoogleFonts.lato(
                                      fontSize: 16,
                                      color: HexColor("2E2E2E"),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Container(
                                    child: TextFormField(
                                      onChanged: ((value) {
                                        user.skill1 = value;
                                      }),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        hintText: user.skill1,
                                        hintStyle: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: w(0.04),
                                    ),
                                    child: Container(
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          user.ratingSkill1 =
                                              double.parse(value);
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText:
                                              user.ratingSkill1.toString(),
                                          hintStyle: GoogleFonts.lato(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: w(0.04),
                                  bottom: h(0.005),
                                  top: h(0.01),
                                ),
                                child: Text(
                                  "Skill 2",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: HexColor("2E2E2E"),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: w(0.4),
                                  bottom: h(0.005),
                                  top: h(0.01),
                                ),
                                child: Text(
                                  "Rating",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: HexColor("2E2E2E"),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Container(
                                    child: TextFormField(
                                      onChanged: ((value) {
                                        user.skill2 = value;
                                      }),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        hintText: user.skill2,
                                        hintStyle: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: w(0.04),
                                    ),
                                    child: Container(
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          user.ratingSkill2 =
                                              double.parse(value);
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText:
                                              user.ratingSkill2.toString(),
                                          hintStyle: GoogleFonts.lato(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: w(0.04),
                                  bottom: h(0.005),
                                  top: h(0.01),
                                ),
                                child: Text(
                                  "Skill 3",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: HexColor("2E2E2E"),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: w(0.4),
                                  bottom: h(0.005),
                                  top: h(0.01),
                                ),
                                child: Text(
                                  "Rating",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: HexColor("2E2E2E"),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Container(
                                    child: TextFormField(
                                      onChanged: ((value) {
                                        user.skill3 = value;
                                      }),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        hintText: user.skill3,
                                        hintStyle: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: w(0.04),
                                    ),
                                    child: Container(
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          user.ratingSkill3 =
                                              double.parse(value);
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText:
                                              user.ratingSkill3.toString(),
                                          hintStyle: GoogleFonts.lato(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: w(0.04),
                                  bottom: h(0.005),
                                  top: h(0.01),
                                ),
                                child: Text(
                                  "Skill 4",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: HexColor("2E2E2E"),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: w(0.4),
                                  bottom: h(0.005),
                                  top: h(0.01),
                                ),
                                child: Text(
                                  "Rating",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: HexColor("2E2E2E"),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Container(
                                    child: TextFormField(
                                      onChanged: ((value) {
                                        user.skill4 = value;
                                      }),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        hintText: user.skill4,
                                        hintStyle: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: w(0.04),
                                    ),
                                    child: Container(
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          user.ratingSkill4 =
                                              double.parse(value);
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText:
                                              user.ratingSkill4.toString(),
                                          hintStyle: GoogleFonts.lato(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: w(0.04),
                                  bottom: h(0.005),
                                  top: h(0.01),
                                ),
                                child: Text(
                                  "Skill 5",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: HexColor("2E2E2E"),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: w(0.4),
                                  bottom: h(0.005),
                                  top: h(0.01),
                                ),
                                child: Text(
                                  "Rating",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: HexColor("2E2E2E"),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Container(
                                    child: TextFormField(
                                      onChanged: ((value) {
                                        user.skill5 = value;
                                      }),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        hintText: user.skill5,
                                        hintStyle: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: w(0.04),
                                    ),
                                    child: Container(
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          user.ratingSkill5 =
                                              double.parse(value);
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText:
                                              user.ratingSkill5.toString(),
                                          hintStyle: GoogleFonts.lato(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: h(0.025),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Highlights",
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: w(0.04),
                              right: w(0.04),
                              top: h(0.01),
                            ),
                            child: Container(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                onChanged: ((value) {
                                  user.highlight = (value);
                                }),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: user.highlight,
                                  hintStyle: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: h(0.005),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: w(0.04),
                                bottom: h(0.005),
                                top: h(0.01),
                              ),
                              child: Text(
                                "Leetcode rating",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: HexColor("2E2E2E"),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: Container(
                              width: w(0.4),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                onChanged: ((value) {
                                  user.leetcode = int.parse(value);
                                }),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: user.leetcode.toString(),
                                  hintStyle: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: h(0.005),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: w(0.04),
                                bottom: h(0.005),
                                top: h(0.01),
                              ),
                              child: Text(
                                "Codechef rating",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: HexColor("2E2E2E"),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: Container(
                              width: w(0.4),
                              child: TextFormField(
                                onChanged: ((value) {
                                  user.codechef = int.parse(value);
                                }),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: user.codechef.toString(),
                                  hintStyle: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: h(0.025),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Certificates",
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Certificate 1",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                user.certificate1 = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: user.certificate1,
                                hintStyle: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: w(0.04),
                              bottom: h(0.005),
                              top: h(0.01),
                            ),
                            child: Text(
                              "Year received",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: w(0.04),
                              right: w(0.52),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: w(0.02),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: w(0.001),
                                ),
                                child: TextFormField(
                                  onChanged: (value) {
                                    user.certificate1Date = (value);
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintText: user.certificate1Date,
                                    hintStyle: GoogleFonts.lato(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Certificate 1",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                user.certificate1 = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: user.certificate1,
                                hintStyle: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: w(0.04),
                              bottom: h(0.005),
                              top: h(0.01),
                            ),
                            child: Text(
                              "Year received",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: w(0.04),
                              right: w(0.52),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: w(0.02),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: w(0.001),
                                ),
                                child: TextFormField(
                                  onChanged: (value) {
                                    user.certificate1Date = (value);
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintText: user.certificate1Date,
                                    hintStyle: GoogleFonts.lato(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Certificate 1",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                user.certificate1 = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: user.certificate1,
                                hintStyle: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: w(0.04),
                              bottom: h(0.005),
                              top: h(0.01),
                            ),
                            child: Text(
                              "Year received",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: w(0.04),
                              right: w(0.52),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: w(0.02),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: w(0.001),
                                ),
                                child: TextFormField(
                                  onChanged: (value) {
                                    user.certificate1Date = (value);
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintText: user.certificate1Date,
                                    hintStyle: GoogleFonts.lato(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: h(0.025),
                              left: w(0.04),
                            ),
                            child: Text(
                              "Socials",
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                color: HexColor("2E2E2E"),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "GitHub",
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: HexColor("2E2E2E"),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                user.github = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: user.github,
                                hintStyle: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: h(0.005),
                              top: h(0.01),
                              left: w(0.04),
                            ),
                            child: Text(
                              "LinkedIn",
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: HexColor("2E2E2E"),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w(0.04),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                user.linkedin = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: user.linkedin,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
