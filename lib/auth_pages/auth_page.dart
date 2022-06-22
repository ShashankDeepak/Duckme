import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class authPage extends StatelessWidget {
  const authPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SvgPicture.asset("assets/Duck logo.svg"),
            
            Text("Duckmé",
            style: GoogleFonts.lilyScriptOne(fontSize: 40),
              ),
            ], 
            ),
            Text("Bag your dream jobs \n with these amazing \n resumes!",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(fontSize: 25), 
            ),
          ],
        ),
      );
  }
}
