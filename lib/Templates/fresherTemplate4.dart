// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../Class/Firebase.dart';
import '../Class/user.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:screenshot/screenshot.dart';
import 'dart:io';
import 'dart:math';

class fresherTemplate4 extends StatefulWidget {
  fresherTemplate4({Key? key}) : super(key: key);

  @override
  State<fresherTemplate4> createState() => _fresherTemplate4State();
}

class _fresherTemplate4State extends State<fresherTemplate4> {
  UserCred userCred = UserCred();
  FirebaseCRUD fire = FirebaseCRUD();
  var uid = FirebaseAuth.instance.currentUser!.uid;

  bool isLoading = true;

  Widget displayImage(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : Container(
            padding: EdgeInsets.only(bottom: 30),
            child: Image.network(
              userCred.image,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width * (1),
            ),
          );
  }

  Widget displayRawImage(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: MediaQuery.of(context).size.height * (0.32),
      child: Image.asset(
        "assets/rawimage.jpg",
        fit: BoxFit.fill,
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * (1),
      ),
    );
  }

  Future<void> getUserImage() async {
    userCred.image = await fire.getImage(uid);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    userCred = fire.getUser(uid: uid);
    getUserImage();
    super.initState();
  }

  ScreenshotController screenshotController = ScreenshotController();

  String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(
        List.generate(len, (index) => r.nextInt(33) + 89));
  }

  Uint8List? _imageFile;
  Future<void> getPdf(BuildContext context) async {
    await screenshotController.capture().then(
      (image) {
        _imageFile = image!;
      },
    );

    try {
      final pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a3,
          margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) {
            return pw.Image(
              pw.MemoryImage(_imageFile!),
              fit: pw.BoxFit.fill,
            );
          },
        ),
      );
      Directory dir = Directory('/storage/emulated/0/Download');
      var nameOfFile = generateRandomString(5);
      final file = File("${dir.path}/$nameOfFile.pdf");
      await file.writeAsBytes(await pdf.save());
      pdfDownloaded(context, nameOfFile);
    } catch (e) {
      pdfError(context);
    }
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> pdfError(contex) {
    const snackBar = SnackBar(
      content: Text('There was some error please restart the app'),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> pdfDownloaded(
      BuildContext context, String name) {
    String n = "$name.pdf downloaded, check your downloads folder";
    var snackBar = SnackBar(
      content: Text(n),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    double h(double height) {
      return MediaQuery.of(context).size.height * height;
    }

    double w(double width) {
      return MediaQuery.of(context).size.width * width;
    }

    int index = 0;

    String name = "Shashank";

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => {setState(() {})},
    );

    return SafeArea(
      child: Scaffold(
        floatingActionButton: Container(
          height: 70,
          width: 70,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here!
                getPdf(context);
              },

              // backgroundColor: Colors.green,
              child: const Icon(
                Icons.download,
              ),
            ),
          ),
        ),
        body: Screenshot(
          controller: screenshotController,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: h(1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      userCred.image == ""
                          ? displayRawImage(context)
                          : displayImage(context),
                      Text(
                        "Contacts",
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Email: " + userCred.email,
                        style: GoogleFonts.lato(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "Phone: " + userCred.phone,
                        style: GoogleFonts.lato(
                          fontSize: 12,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: h(0.03),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Certificates",
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                userCred.certificate1,
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Text(
                              userCred.certificate1Date,
                              style: GoogleFonts.lato(
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 18.0),
                              child: Text(
                                userCred.certificate2,
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Text(
                              userCred.certificate2Date,
                              style: GoogleFonts.lato(
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 18.0),
                              child: Text(
                                userCred.certificate3,
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Text(
                              userCred.certificate3Date,
                              style: GoogleFonts.lato(
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: h(0.03),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Education",
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "${userCred.universityJoined} - ${userCred.universityLeft}",
                                      style: GoogleFonts.lato(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    userCred.university,
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    userCred.universityCGPA.toString(),
                                    style: GoogleFonts.lato(
                                      fontSize: 10,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: Text(
                                      "${userCred.highSchoolJoined} - ${userCred.highSchoolLeft}",
                                      style: GoogleFonts.lato(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    userCred.highschool,
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    userCred.highSchoolmarks.toString(),
                                    style: GoogleFonts.lato(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: h(1),
                  color: Color.fromARGB(255, 137, 147, 221),
                  child: InkWell(
                    onTap: () => {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: h(0.04),
                          ),
                          child: Text(
                            userCred.firstname,
                            style: GoogleFonts.josefinSlab(
                              fontSize: 45,
                            ),
                          ),
                        ),
                        Text(
                          userCred.lastname,
                          style: GoogleFonts.josefinSlab(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // AutoSizeText(Text(userCred.highlight)),
                        Padding(
                          padding: const EdgeInsets.only(top: 14.0),
                          child: AutoSizeText(
                            userCred.highlight,
                            maxLines: 1,
                            style: TextStyle(
                                color: Color.fromARGB(255, 9, 32, 51)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: h(0.05),
                            left: w(0.02),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Skills",
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "• ${userCred.skill1}",
                                style: GoogleFonts.lato(
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                "• ${userCred.skill2}",
                                style: GoogleFonts.lato(
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                "• ${userCred.skill3}",
                                style: GoogleFonts.lato(
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                "• ${userCred.skill4}",
                                style: GoogleFonts.lato(
                                  fontSize: 12,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: h(0.03)),
                                child: Text(
                                  "Projects",
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: h(0.02)),
                                child: Text(
                                  userCred.project1,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: AutoSizeText(
                                  // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing",
                                  userCred.project1Detail,
                                  maxLines: 4,
                                  style: GoogleFonts.lato(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: h(0.015)),
                                child: Text(
                                  userCred.project2,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: AutoSizeText(
                                  // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing",
                                  userCred.project2Detail,
                                  maxLines: 4,
                                  style: GoogleFonts.lato(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: h(0.02),
                                ),
                                child: Text(
                                  userCred.project3,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: AutoSizeText(
                                  // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing",
                                  userCred.project3Detail,
                                  style: GoogleFonts.lato(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: h(0.03)),
                                child: Text(
                                  "Socials",
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: h(0.02),
                                ),
                                child: Text(
                                  "GitHub",
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Text(
                                  userCred.github,
                                  style: GoogleFonts.lato(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: h(0.02),
                                ),
                                child: Text(
                                  "LinkDin",
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Text(
                                  userCred.linkedin,
                                  style: GoogleFonts.lato(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
