import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

class FormPage extends StatefulWidget {
  FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
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

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: w(1),
            height: h(1),
            child: ContainedTabBarView(
              tabs: [
                Text('Personal'),
                Text('Education'),
              ],
              views: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: h(0.025),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: w(0.9),
                                height: h(0.3),
                                decoration: BoxDecoration(
                                  color: HexColor("F0F0F0"),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: h(0.26),
                            left: w(0.82),
                          ),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: HexColor("000000").withOpacity(0.25),
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
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: h(0.25),
                            left: w(0.845),
                          ),
                          child: Container(
                            height: h(0.1),
                            width: w(0.1),
                            child:
                                SvgPicture.asset("assets/Icons/Plus icon.svg"),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: h(0.26),
                            left: w(0.82),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'bradjonson119@gmail.com',
                        labelText: 'First name',
                      ),
                    ),
                  ],
                ),
                Container(color: Colors.green),
              ],
              onChange: (index) => print(index),
            ),
          ),
        ),
      ),
    );
  }
}
