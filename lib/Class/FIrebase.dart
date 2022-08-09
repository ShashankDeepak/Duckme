// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duckme/Class/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseCRUD {
  UserCred temp = UserCred();

  int random(min, max) {
    return min + Random().nextInt(max - min);
  }

  var db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  final storageRef = FirebaseStorage.instance.ref();

  void addData(UserCred userCred, String uid) {
    userCred.duckumber = random(0, 4);

    final userCredCred = <String, dynamic>{
      "duck": userCred.duckumber,
      "userCredname": userCred.uname,
      "first": userCred.firstname,
      "last": userCred.lastname,
      "date": userCred.date,
      "email": userCred.email,
      "address": userCred.address,
      "phone": userCred.phone,
      "highschool": userCred.highschool,
      "highSchoolJoined": userCred.highSchoolJoined,
      "highSchoolLeft": userCred.highSchoolLeft,
      "highSchoolMarks": userCred.highSchoolmarks,
      "university": userCred.university,
      "universityJoined": userCred.universityJoined,
      "universityLeft": userCred.universityLeft,
      "universityCGPA": userCred.universityCGPA,
      "masters": userCred.masters,
      "masterJoined": userCred.masterJoined,
      "masterLeft": userCred.masterLeft,
      "masterCGPA": userCred.masterCGPA,
      "certificate1": userCred.certificate1,
      'certificate1Date': userCred.certificate1Date,
      "certificate2": userCred.certificate2,
      'certificate2Date': userCred.certificate2Date,
      "certificate3": userCred.certificate3,
      'certificate3Date': userCred.certificate3Date,
      "project1": userCred.project1,
      "project1Detail": userCred.project1Detail,
      "project2": userCred.project2,
      "project2Detail": userCred.project2Detail,
      "project3": userCred.project3,
      "project3Detail": userCred.project3Detail,
      "internship1": userCred.internship1,
      "internship1Detail": userCred.internship1Detail,
      "internship1Joined": userCred.internship1Joined,
      "internship1Left": userCred.internship1Left,
      "internship2": userCred.internship2,
      "internship2Detail": userCred.internship2Detail,
      "internship2Joined": userCred.internship2Joined,
      "internship2Left": userCred.internship2Left,
      "internship3": userCred.internship3,
      "internship3Detail": userCred.internship3Detail,
      "internship3Joined": userCred.internship3Joined,
      "internship3Left": userCred.internship3Left,
      "currentCompany": userCred.currentCompany,
      "currentCompanyDetail": userCred.currentCompanyDetail,
      "currentCompanyJobRole": userCred.currentCompanyJobRole,
      "currentCompanyJoined": userCred.currentCompanyJoined,
      "currentCompanyLeft": userCred.currentCompanyLeft,
      "previousCompany1": userCred.previousCompany1,
      "previousCompany1Detail": userCred.previousCompany1Detail,
      "previousCompany1Joined": userCred.previousCompany1Joined,
      "previousCompany1Left": userCred.previousCompany1Left,
      "previousCompany2": userCred.previousCompany2,
      "previousCompany2Detail": userCred.previousCompany2Detail,
      "previousCompany2Joined": userCred.previousCompany2Joined,
      "previousCompany2Left": userCred.previousCompany2Left,
      "skill1": userCred.skill1,
      "ratingSkill1": userCred.ratingSkill1,
      "skill2": userCred.skill2,
      "ratingSkill2": userCred.ratingSkill2,
      "skill3": userCred.skill3,
      "ratingSkill3": userCred.ratingSkill3,
      "skill4": userCred.skill4,
      "ratingSkill4": userCred.ratingSkill4,
      "skill5": userCred.skill5,
      "ratingSkill5": userCred.ratingSkill5,
      "highlight": userCred.highlight,
      "leetcode": userCred.leetcode,
      "codechef": userCred.codechef,
      "github": userCred.github,
      "linkedin": userCred.linkedin,
    };

    db.collection("user").doc(uid).set(userCredCred);
  }

  void setData({required String uid, required Map<String, dynamic> map}) {
    db.collection("user").doc(uid).update(map);
  }

  Future<String> setImage({required File image, required String uid}) async {
    var snapshot = await storageRef.child(uid).putFile(image);

    var downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<dynamic> getData({required String uid, required String d}) async {
    final docRef = FirebaseFirestore.instance.collection("user").doc(uid);

    docRef.get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      var udata = data[d];
      return udata;
    });
  }

  UserCred getUser({required BuildContext context, required String uid}) {
    UserCred userCred = UserCred();
    final docRef = FirebaseFirestore.instance.collection("user").doc(uid);

    docRef.get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      userCred.duckumber = data["duck"];
      userCred.uname = data["userCredname"];
      userCred.firstname = data["first"];
      userCred.lastname = data["last"];
      userCred.date = data["date"];
      userCred.address = data["address"];
      userCred.email = data["email"];
      userCred.phone = data["phone"];
      userCred.highschool = data["highschool"];
      userCred.highSchoolJoined = data["highSchoolJoined"];
      userCred.highSchoolLeft = data["highSchoolLeft"];
      userCred.highSchoolmarks = data["highSchoolMarks"];
      userCred.university = data["university"];
      userCred.universityJoined = data["universityJoined"];
      userCred.universityLeft = data["universityLeft"];
      userCred.universityCGPA = data["universityCGPA"];
      userCred.masters = data["masters"];
      userCred.masterLeft = data["masterLeft"];
      userCred.masterJoined = data["masterJoined"];
      userCred.masterCGPA = data["masterCGPA"];

      userCred.certificate1 = data["certificate1"];
      userCred.certificate1Date = data["certificate1Date"];
      userCred.certificate2 = data["certificate2"];
      userCred.certificate2Date = data["certificate2Date"];
      userCred.certificate3 = data["certificate3"];
      userCred.certificate3Date = data["certificate3Date"];

      userCred.project1 = data["project1"];
      userCred.project1Detail = data["project1Detail"];
      userCred.project2 = data["project2"];
      userCred.project2Detail = data["project2Detail"];
      userCred.project3 = data["project3"];
      userCred.project3Detail = data["project3Detail"];
      userCred.internship1 = data["internship1"];
      userCred.internship1Detail = data["internship1Detail"];
      userCred.internship1Joined = data["internship1Joined"];
      userCred.internship1Left = data["internship1Left"];
      userCred.internship2 = data["internship2"];
      userCred.internship2Detail = data["internship2Detail"];

      userCred.internship2Joined = data["internship2Joined"];
      userCred.internship2Left = data["internship2Left"];
      userCred.internship3 = data["internship3"];
      userCred.internship3Detail = data["internship3Detail"];
      userCred.internship3Left = data["internship3Left"];
      userCred.currentCompany = data["currentCompany"];
      userCred.currentCompanyDetail = data["currentCompanyDetail"];
      userCred.currentCompanyJobRole = data["currentCompanyJobRole"];
      userCred.currentCompanyJoined = data["currentCompanyJoined"];
      userCred.currentCompanyLeft = data["currentCompanyLeft"];
      userCred.previousCompany1 = data["previousCompany1"];
      userCred.previousCompany1Detail = data["previousCompany1Detail"];

      userCred.previousCompany1Joined = data["previousCompany1Joined"];
      userCred.previousCompany1Left = data["previousCompany1Left"];
      userCred.previousCompany2 = data["previousCompany2"];
      userCred.previousCompany2Detail = data["previousCompany2Detail"];
      userCred.previousCompany2Joined = data["previousCompany2Joined"];
      userCred.previousCompany2Left = data["previousCompany2Left"];
      userCred.skill1 = data["skill1"];
      userCred.ratingSkill1 = data["ratingSkill1"];
      userCred.skill2 = data["skill2"];
      userCred.ratingSkill2 = data["ratingSkill2"];
      userCred.skill3 = data["skill3"];
      userCred.ratingSkill3 = data["ratingSkill3"];
      userCred.skill4 = data["skill4"];
      userCred.ratingSkill4 = data["ratingSkill4"];
      userCred.skill5 = data["skill5"];
      userCred.ratingSkill5 = data["ratingSkill5"];
      userCred.highlight = data["highlight"];
      userCred.leetcode = data["leetcode"];
      userCred.codechef = data["codechef"];
      userCred.github = data["github"];
      userCred.linkedin = data["linkedin"];
    }, onError: (e) {
      final snackBar = SnackBar(
        content: Text('Something is wrong, please check your internet'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print("Error getting document: $e");
    });

    return userCred;
  }
}
