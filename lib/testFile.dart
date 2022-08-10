import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duckme/Class/Firebase.dart';
import 'package:duckme/Class/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TestFile extends StatefulWidget {
  TestFile({Key? key}) : super(key: key);

  @override
  State<TestFile> createState() => _TestFileState();
}

class _TestFileState extends State<TestFile> {
  // final FirebaseAuth auth =;
  // final uid = FirebaseAuth.instance.currentUser!.uid;

  final uid = "utpqn2gxzBQSgkzRrQjQaOm6e7f2";

  var db = FirebaseFirestore.instance;

  var isLoading = true;

  FirebaseCRUD fire = new FirebaseCRUD();
  UserCred userCred = UserCred();

  Future<void> getUserImage() async {
    userCred.image = await fire.getImage(uid);
    setState(() {
      isLoading = false;
    });
  }

  // CollectionReference user = FirebaseFirestore.instance.collection('user');
  @override
  void initState() {
    userCred = fire.getUser(uid: uid);
    getUserImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
              height: 100,
              child: isLoading
                  ? CircularProgressIndicator()
                  : Image.network(userCred.image)),
        ),
      ),
    );
  }
}
