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
  final uid = FirebaseAuth.instance.currentUser!.uid;

  var db = FirebaseFirestore.instance;

  final docRef = FirebaseFirestore.instance
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.uid);
  FirebaseCRUD fire = new FirebaseCRUD();

  @override
  // CollectionReference user = FirebaseFirestore.instance.collection('user');

  Widget build(BuildContext context) {
    UserCred userCred = fire.getUser(context: context, uid: uid);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: 30,
            child: InkWell(
              onTap: () {
                docRef.get().then(
                  (DocumentSnapshot doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    userCred.duckumber = data["duck"];
                  },
                  onError: (e) => print("Error getting document: $e"),
                );
                setState(() {
                  userCred.duckumber = 5;
                });
              },
              child: Text(userCred.duckumber.toString()),
            ),
          ),
        ),
      ),
    );
  }
}
