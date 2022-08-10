// ignore_for_file: prefer_const_constructors

import 'package:duckme/Templates/fresherTemplate2.dart';
import 'package:duckme/pages/form.dart';
import 'package:duckme/pages/home.dart';
import 'package:duckme/pages/title_page.dart';
import 'package:duckme/persistenNavBar.dart';
import 'package:duckme/testFile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Templates/FresherTemplate1.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: (FirebaseAuth.instance.currentUser == null
          ? titlePage()
          : PersistentNavBar()),
      // home: fresherTemplate2(),
    );
  }
}
