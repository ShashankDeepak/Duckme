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
      child: Scaffold(
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
                  icon: Icons.edit,
                  text: 'Form',
                ),
                GButton(
                    icon: MdiIcons.fileDocumentEditOutline,
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
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    }),
              ],
              selectedIndex: 0,
            ),
          ),
        ),
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
                                    onTap: () {
                                      pickImage();
                                    },
                                    child: Card(
                                      elevation: 5,
                                      child: displayeImage(),
                                      // Image.asset(
                                      //   "assets/personal.png",
                                      //   fit: BoxFit.cover,
                                      // ),
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
                                hintText: user.date),
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
                              fontWeight: FontWeight.w300,
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
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'St. Teresa School',
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
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      hintText: '2011',
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
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      hintText: '2013',
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
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: '92% / 9.8',
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
                              fontWeight: FontWeight.w300,
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
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'Kalinga Institute of Technology',
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
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      hintText: '2013',
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
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      hintText: '2017',
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
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: '92% / 9.8',
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
                              fontWeight: FontWeight.w300,
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
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'St. Teresa School',
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
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      hintText: '2017',
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
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      hintText: '2019',
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
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: '92% / 9.8',
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
                              fontWeight: FontWeight.w300,
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
                              user.firstname = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'Resume Maker',
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
                              maxLines: maxLines,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText:
                                    'Write a few lines about your project',
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
                            left: w(0.04),
                          ),
                          child: Text(
                            "Internships",
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              color: HexColor("2E2E2E"),
                              fontWeight: FontWeight.w300,
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
                              user.firstname = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'Resume Maker',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
