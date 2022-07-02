// ignore_for_file: prefer_const_constructors

import 'package:duckme/auth_pages/auth_page.dart';
import 'package:duckme/auth_pages/sign_up.dart';
import 'package:duckme/pages/home.dart';
import 'package:duckme/pages/profile_page.dart';
import 'package:duckme/pages/title_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth_pages/login_page.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: ProfilePage(),
      //(FirebaseAuth.instance.currentUser == null ? titlePage() : Home()),
    );
  }
}
