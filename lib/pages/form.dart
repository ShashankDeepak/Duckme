// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures
import 'dart:async';
import 'dart:io';

import 'package:duckme/Class/Firebase.dart';
import 'package:duckme/pages/home.dart';
import 'package:duckme/pages/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

class _FormPageState extends State<FormPage> {
  File? imageFile;
  final imagePicker = ImagePicker();

  UserCred userCred = UserCred();
  FirebaseCRUD fire = FirebaseCRUD();

  var uid = FirebaseAuth.instance.currentUser!.uid;

  String pathOfImage = "assets/personal.png";

  void getImage() async {
    pathOfImage = await fire.setImage(
      image: imageFile!,
      uid: uid,
    );
  }

  Widget displayeImage() {
    if (pathOfImage != "assets/personal.png") {
      return Image.network(
        pathOfImage,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        "assets/personal.png",
        fit: BoxFit.cover,
      );
    }
  }

  void pickImage() async {
    var image = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = File(image!.path);
      getImage();
    });
  }

  @override
  void initState() {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    userCred = fire.getUser(context: context, uid: uid);
    super.initState();
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

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => {setState(() {})},
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
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
                                        onTap: () async {
                                          pickImage();
                                          // print(pathOfImage);
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
                                  userCred.firstname = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: userCred.firstname,
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
                                  userCred.lastname = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: userCred.lastname,
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
                                  hintText: userCred.date,
                                ),
                                readOnly: true,
                                onChanged: ((value) {
                                  if (value == null)
                                    userCred.date = userCred.date;
                                  else
                                    userCred.date =
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
                                  userCred.email = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: userCred.email,
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
                                  userCred.address = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: userCred.address,
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
                                  userCred.phone = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: userCred.phone,
                                  hintStyle: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: h(0.04),
                                left: w(0.66),
                                bottom: h(0.02),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  width: w(0.3),
                                  height: h(0.06),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.orange),
                                    onPressed: () {
                                      // print(userCred.firstname);
                                      fire.setData(
                                          uid: uid,
                                          map: <String, dynamic>{
                                            "first": userCred.firstname,
                                            "last": userCred.lastname,
                                            "date": userCred.date,
                                            "email": userCred.email,
                                            "address": userCred.address,
                                            "phone": userCred.phone,
                                          });
                                      // update(context);
                                      setState(() {});
                                    },
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Save",
                                        style: GoogleFonts.lato(
                                          fontSize: 22,
                                          color: Colors.white,
                                        ),
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
                                  userCred.highschool = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: userCred.highschool,
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
                                          userCred.highSchoolJoined =
                                              int.parse(value);
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText: userCred.highSchoolJoined
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
                                          userCred.highSchoolLeft =
                                              int.parse(value);
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText: userCred.highSchoolLeft
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
                                    userCred.highSchoolmarks =
                                        double.parse(value);
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintText:
                                        userCred.highSchoolmarks.toString(),
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
                                  userCred.university = (value);
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: userCred.university,
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
                                          userCred.universityJoined =
                                              int.parse(value);
                                        },
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText: userCred.universityJoined
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
                                          userCred.universityLeft =
                                              int.parse(value);
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText: userCred.universityLeft
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
                                    userCred.universityCGPA =
                                        double.parse(value);
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintText:
                                        userCred.universityCGPA.toString(),
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
                                  userCred.masters = (value);
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: userCred.masters,
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
                                          userCred.masterJoined =
                                              int.parse(value);
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText:
                                              userCred.masterJoined.toString(),
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
                                          userCred.masterLeft =
                                              int.parse(value);
                                        },
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText:
                                              userCred.masterLeft.toString(),
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
                                    userCred.masterCGPA = double.parse(value);
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintText: userCred.masterCGPA.toString(),
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
                                top: h(0.04),
                                left: w(0.66),
                                bottom: h(0.02),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  width: w(0.3),
                                  height: h(0.06),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.orange),
                                    onPressed: () {
                                      setState(() async {
                                        fire.setData(
                                            uid: uid,
                                            map: <String, dynamic>{
                                              "highschool": userCred.highschool,
                                              "highSchoolJoined":
                                                  userCred.highSchoolJoined,
                                              "highSchoolLeft":
                                                  userCred.highSchoolLeft,
                                              "highSchoolMarks":
                                                  userCred.highSchoolmarks,
                                              "university": userCred.university,
                                              "universityJoined":
                                                  userCred.universityJoined,
                                              "universityLeft":
                                                  userCred.universityLeft,
                                              "universityCGPA":
                                                  userCred.universityCGPA,
                                              "masters": userCred.masters,
                                              "masterJoined":
                                                  userCred.masterJoined,
                                              "masterLeft": userCred.masterLeft,
                                              "masterCGPA": userCred.masterCGPA,
                                            });
                                      });
                                    },
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Save",
                                        style: GoogleFonts.lato(
                                          fontSize: 22,
                                          color: Colors.white,
                                        ),
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
                                  userCred.project1 = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: userCred.project1.toString(),
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
                                    userCred.project1Detail = (value);
                                  },
                                  maxLines: maxLines,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintText: userCred.project1Detail,
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
                                  userCred.project2 = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: userCred.project2,
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
                                    userCred.project2Detail = (value);
                                  },
                                  maxLines: maxLines,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintText: userCred.project2Detail,
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
                                  userCred.project3 = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: userCred.project3,
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
                                    userCred.project3Detail = value;
                                  },
                                  maxLines: maxLines,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintText: userCred.project3Detail,
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
                                top: h(0.04),
                                left: w(0.66),
                                bottom: h(0.02),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  width: w(0.3),
                                  height: h(0.06),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.orange),
                                    onPressed: () {
                                      setState(() async {
                                        fire.setData(
                                            uid: uid,
                                            map: <String, dynamic>{
                                              "project1": userCred.project1,
                                              "project1Detail":
                                                  userCred.project1Detail,
                                              "project2": userCred.project2,
                                              "project2Detail":
                                                  userCred.project2Detail,
                                              "project3": userCred.project3,
                                              "project3Detail":
                                                  userCred.project3Detail,
                                            });
                                      });
                                    },
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Save",
                                        style: GoogleFonts.lato(
                                          fontSize: 22,
                                          color: Colors.white,
                                        ),
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
                                  userCred.internship1 = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: userCred.internship1,
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
                                            userCred.internship1Joined =
                                                int.parse(value);
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            hintText: userCred.internship1Joined
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
                                            userCred.internship1Left =
                                                int.parse(value);
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            hintText: userCred.internship1Left
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
                                    userCred.internship1Detail = value;
                                  },
                                  maxLines: maxLines,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintText: userCred.internship1Detail,
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
                                  userCred.internship2 = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: userCred.internship2,
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
                                            userCred.internship2Joined =
                                                int.parse(value);
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            hintText: userCred.internship2Joined
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
                                            userCred.internship2Left =
                                                int.parse(value);
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            hintText: userCred.internship2Left
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
                                    userCred.internship2Detail = value;
                                  },
                                  maxLines: maxLines,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintText: userCred.internship2Detail,
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
                                  userCred.internship3 = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: userCred.internship3,
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
                                            userCred.internship3Joined =
                                                int.parse(value);
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            hintText: userCred.internship3Joined
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
                                            userCred.internship3Left =
                                                int.parse(value);
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            hintText: userCred.internship3Left
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
                                    userCred.internship3Detail = value;
                                  },
                                  maxLines: maxLines,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintText: userCred.internship3Detail,
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
                                top: h(0.04),
                                left: w(0.66),
                                bottom: h(0.02),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  width: w(0.3),
                                  height: h(0.06),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.orange),
                                    onPressed: () {
                                      setState(() async {
                                        fire.setData(
                                            uid: uid,
                                            map: <String, dynamic>{
                                              "internship1":
                                                  userCred.internship1,
                                              "internship1Detail":
                                                  userCred.internship1Detail,
                                              "internship1Joined":
                                                  userCred.internship1Joined,
                                              "internship1Left":
                                                  userCred.internship1Left,
                                              "internship2":
                                                  userCred.internship2,
                                              "internship2Detail":
                                                  userCred.internship2Detail,
                                              "internship2Joined":
                                                  userCred.internship2Joined,
                                              "internship2Left":
                                                  userCred.internship2Left,
                                              "internship3":
                                                  userCred.internship3,
                                              "internship3Detail":
                                                  userCred.internship3Detail,
                                              "internship3Joined":
                                                  userCred.internship3Joined,
                                              "internship3Left":
                                                  userCred.internship3Left,
                                            });
                                      });
                                    },
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Save",
                                        style: GoogleFonts.lato(
                                          fontSize: 22,
                                          color: Colors.white,
                                        ),
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
                                userCred.currentCompany = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: userCred.currentCompany,
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
                                userCred.currentCompanyJobRole = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: userCred.currentCompanyJobRole,
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
                                    userCred.currentCompanyJoined =
                                        int.parse(value);
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintText: userCred.currentCompanyJoined
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
                                  userCred.currentCompanyDetail = value;
                                },
                                maxLines: maxLines,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: userCred.currentCompanyDetail,
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
                                userCred.previousCompany2 = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: userCred.previousCompany2,
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
                                userCred.previousCompany2JobRole = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: userCred.previousCompany2JobRole,
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
                                          userCred.previousCompany2Joined =
                                              int.parse(value);
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText: userCred
                                              .previousCompany2Joined
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
                                          userCred.previousCompany2Left =
                                              int.parse(value);
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText: userCred
                                              .previousCompany2Left
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
                                  userCred.previousCompany2Detail = value;
                                },
                                maxLines: maxLines,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: userCred.previousCompany2Detail,
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
                                userCred.previousCompany1 = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: userCred.previousCompany1,
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
                                userCred.previousCompany1JobRole = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: userCred.previousCompany1JobRole,
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
                                          userCred.previousCompany1Joined =
                                              int.parse(value);
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText: userCred
                                              .previousCompany1Joined
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
                                          userCred.previousCompany1Left =
                                              int.parse(value);
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText: userCred
                                              .previousCompany1Left
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
                                  userCred.previousCompany1Detail = value;
                                },
                                maxLines: maxLines,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: userCred.previousCompany1Detail,
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
                              top: h(0.04),
                              left: w(0.66),
                              bottom: h(0.02),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                width: w(0.3),
                                height: h(0.06),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.orange),
                                  onPressed: () {
                                    setState(() async {
                                      fire.setData(
                                          uid: uid,
                                          map: <String, dynamic>{
                                            "currentCompany":
                                                userCred.currentCompany,
                                            "currentCompanyDetail":
                                                userCred.currentCompanyDetail,
                                            "currentCompanyJobRole":
                                                userCred.currentCompanyJobRole,
                                            "currentCompanyJoined":
                                                userCred.currentCompanyJoined,
                                            "currentCompanyLeft":
                                                userCred.currentCompanyLeft,
                                            "previousCompany1":
                                                userCred.previousCompany1,
                                            "previousCompany1Detail":
                                                userCred.previousCompany1Detail,
                                            "previousCompany1Joined":
                                                userCred.previousCompany1Joined,
                                            "previousCompany1Left":
                                                userCred.previousCompany1Left,
                                            "previousCompany2":
                                                userCred.previousCompany2,
                                            "previousCompany2Detail":
                                                userCred.previousCompany2Detail,
                                            "previousCompany2Joined":
                                                userCred.previousCompany2Joined,
                                            "previousCompany2Left":
                                                userCred.previousCompany2Left,
                                          });
                                    });
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Save",
                                      style: GoogleFonts.lato(
                                        fontSize: 22,
                                        color: Colors.white,
                                      ),
                                    ),
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
                                          userCred.skill1 = value;
                                        }),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText: userCred.skill1,
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
                                            userCred.ratingSkill1 =
                                                double.parse(value);
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            hintText: userCred.ratingSkill1
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
                                          userCred.skill2 = value;
                                        }),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText: userCred.skill2,
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
                                            userCred.ratingSkill2 =
                                                double.parse(value);
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            hintText: userCred.ratingSkill2
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
                                          userCred.skill3 = value;
                                        }),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText: userCred.skill3,
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
                                            userCred.ratingSkill3 =
                                                double.parse(value);
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            hintText: userCred.ratingSkill3
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
                                          userCred.skill4 = value;
                                        }),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText: userCred.skill4,
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
                                            userCred.ratingSkill4 =
                                                double.parse(value);
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            hintText: userCred.ratingSkill4
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
                                          userCred.skill5 = value;
                                        }),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText: userCred.skill5,
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
                                            userCred.ratingSkill5 =
                                                double.parse(value);
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            hintText: userCred.ratingSkill5
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
                                    userCred.highlight = (value);
                                  }),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintText: userCred.highlight,
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
                                    userCred.leetcode = int.parse(value);
                                  }),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintText: userCred.leetcode.toString(),
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
                                    userCred.codechef = int.parse(value);
                                  }),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintText: userCred.codechef.toString(),
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
                                top: h(0.04),
                                left: w(0.66),
                                bottom: h(0.02),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  width: w(0.3),
                                  height: h(0.06),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.orange),
                                    onPressed: () {
                                      setState(() async {
                                        fire.setData(uid: uid, map: <String,
                                            dynamic>{
                                          "skill1": userCred.skill1,
                                          "ratingSkill1": userCred.ratingSkill1,
                                          "skill2": userCred.skill2,
                                          "ratingSkill2": userCred.ratingSkill2,
                                          "skill3": userCred.skill3,
                                          "ratingSkill3": userCred.ratingSkill3,
                                          "skill4": userCred.skill4,
                                          "ratingSkill4": userCred.ratingSkill4,
                                          "skill5": userCred.skill5,
                                          "ratingSkill5": userCred.ratingSkill5,
                                          "highlight": userCred.highlight,
                                          "leetcode": userCred.leetcode,
                                          "codechef": userCred.codechef,
                                        });
                                      });
                                    },
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Save",
                                        style: GoogleFonts.lato(
                                          fontSize: 22,
                                          color: Colors.white,
                                        ),
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
                                  userCred.certificate1 = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: userCred.certificate1,
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
                                      userCred.certificate1Date = (value);
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      hintText: userCred.certificate1Date,
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
                                  userCred.certificate1 = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: userCred.certificate1,
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
                                      userCred.certificate1Date = (value);
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      hintText: userCred.certificate1Date,
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
                                  userCred.certificate1 = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: userCred.certificate1,
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
                                      userCred.certificate1Date = (value);
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      hintText: userCred.certificate1Date,
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
                                top: h(0.04),
                                left: w(0.66),
                                bottom: h(0.02),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  width: w(0.3),
                                  height: h(0.06),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.orange),
                                    onPressed: () {
                                      setState(() async {
                                        fire.setData(
                                            uid: uid,
                                            map: <String, dynamic>{
                                              "certificate1":
                                                  userCred.certificate1,
                                              'certificate1Date':
                                                  userCred.certificate1Date,
                                              "certificate2":
                                                  userCred.certificate2,
                                              'certificate2Date':
                                                  userCred.certificate2Date,
                                              "certificate3":
                                                  userCred.certificate3,
                                              'certificate3Date':
                                                  userCred.certificate3Date,
                                            });
                                      });
                                    },
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Save",
                                        style: GoogleFonts.lato(
                                          fontSize: 22,
                                          color: Colors.white,
                                        ),
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
                                  userCred.github = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: userCred.github,
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
                                  userCred.linkedin = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: userCred.linkedin,
                                  hintStyle: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: w(0.66),
                                top: h(0.04),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  width: w(0.3),
                                  height: h(0.06),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.orange),
                                    onPressed: () {
                                      setState(() async {
                                        fire.setData(
                                            uid: uid,
                                            map: <String, dynamic>{
                                              "github": userCred.github,
                                              "linkedin": userCred.linkedin,
                                            });
                                      });
                                    },
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Save",
                                        style: GoogleFonts.lato(
                                          fontSize: 22,
                                          color: Colors.white,
                                        ),
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
