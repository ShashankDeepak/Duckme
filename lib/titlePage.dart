// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class titlePage extends StatelessWidget {
  const titlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Align(
          alignment: Alignment(0, 0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffffaf51), Color(0xffffedd9)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
