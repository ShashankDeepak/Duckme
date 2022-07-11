// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures
import 'package:duckme/pages/home.dart';
import 'package:duckme/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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

User user = User();

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    double h(double height) {
      return MediaQuery.of(context).size.height * height;
    }

    double w(double width) {
      return MediaQuery.of(context).size.width * width;
    }

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
                                    onTap: () {},
                                    child: Card(
                                      elevation: 5,
                                      color: HexColor("F0F0F0"),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset("assets/User.svg"),
                                          Text(
                                            "Add your \n photo here",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w300,
                                              color: HexColor("757575"),
                                            ),
                                          ),
                                        ],
                                      ),
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
                                onTap: () {},
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
                Container(),
                Container(),
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
