import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

var db = FirebaseFirestore.instance;

class User {
  int duckumber = 0;
  String uname = "brando";
  String firstname = "Brad";
  String lastname = "Jhonson";
  String date = "02/12/2004";
  String email = "brandjhonson19@gmail.com";
  String address = "141, East Of Kailash, Bangalore, India";
  String phone = "0123456789";

  String highschool = "";
  int highSchoolJoined = 0;
  int highSchoolLeft = 0;
  double highSchoolmarks = 0;
  String university = "";
  int universityJoined = 0;
  int universityLeft = 0;
  double universityCGPA = 0;
  String masters = "";
  int masterJoined = 0;
  int masterLeft = 0;
  double masterCGPA = 0;

  String certificate1 = "";
  String certificate1Date = "";
  String certificate2 = "";
  String certificate2Date = "";
  String certificate3 = "";
  String certificate3Date = "";

  String project1 = "";
  String project1Detail = "";
  String project2 = "";
  String project2Detail = "";
  String project3 = "";
  String project3Detail = "";

  String internship1 = "";
  String internship1Detail = "";
  int internship1Joined = 0;
  int internship1Left = 0;
  String internship2 = "";
  String internship2Detail = "";
  int internship2Joined = 0;
  int internship2Left = 0;
  String internship3 = "";
  String internship3Detail = "";
  int internship3Joined = 0;
  int internship3Left = 0;

  String currentCompany = "";
  String currentCompanyDetail = "";
  String currentCompanyJobRole = "";
  int currentCompanyJoined = 0;
  int currentCompanyLeft = 0;
  String previousCompany1 = "";
  String previousCompany1Detail = "";
  String previousCompany1JobRole = "";
  int previousCompany1Joined = 0;
  int previousCompany1Left = 0;
  String previousCompany2 = "";
  String previousCompany2Detail = "";
  String previousCompany2JobRole = "";
  int previousCompany2Joined = 0;
  int previousCompany2Left = 0;

  String skill1 = "";
  int ratingSkill1 = 0;
  String skill2 = "";
  int ratingSkill2 = 0;
  String skill3 = "";
  int ratingSkill3 = 0;
  String skill4 = "";
  int ratingSkill4 = 0;
  String skill5 = "";
  int ratingSkill5 = 0;
  String highlight = "";
  int leetcode = 0;
  int codechef = 0;

  String github = "";
  String linkdin = "";
}

int random(min, max) {
  return min + Random().nextInt(max - min);
}

void addData(User user, String uid) {
  user.duckumber = random(0, 4);

  final userCred = <String, dynamic>{
    "duck": user.duckumber,
    "username": user.uname,
    "first": user.firstname,
    "last": user.lastname,
    "date": user.date,
    "email": user.email,
    "address": user.address,
    "phone": user.phone,
    "highschool": user.highschool,
    "highSchoolJoined": user.highSchoolJoined,
    "highSchoolLeft": user.highSchoolLeft,
    "highSchoolMarks": user.highSchoolmarks,
    "university": user.university,
    "universityJoined": user.universityJoined,
    "universityLeft": user.universityLeft,
    "universityCGPA": user.universityCGPA,
    "masters": user.masters,
    "masterJoined": user.masterJoined,
    "masterLeft": user.masterLeft,
    "masterCGPA": user.masterCGPA,
    "certificate1": user.certificate1,
    'certificate1Date': user.certificate1Date,
    "certificate2": user.certificate2,
    'certificate2Date': user.certificate2Date,
    "certificate3": user.certificate3,
    'certificate3Date': user.certificate3Date,
    "project1": user.project1,
    "project1Detail": user.project1Detail,
    "project2": user.project2,
    "project2Detail": user.project2Detail,
    "project3": user.project3,
    "project3Detail": user.project3Detail,
    "internship1": user.internship1,
    "internship1Detail": user.internship1Detail,
    "internship1Joined": user.internship1Joined,
    "internship1Left": user.internship1Left,
    "internship2": user.internship2,
    "internship2Detail": user.internship2Detail,
    "internship2Joined": user.internship2Joined,
    "internship2Left": user.internship2Left,
    "internship3": user.internship3,
    "internship3Detail": user.internship3Detail,
    "internship3Joined": user.internship3Joined,
    "internship3Left": user.internship3Left,
    "currentCompany": user.currentCompany,
    "currentCompanyDetail": user.currentCompanyDetail,
    "currentCompanyJobRole": user.currentCompanyJobRole,
    "currentCompanyJoined": user.currentCompanyJoined,
    "currentCompanyLeft": user.currentCompanyLeft,
    "previousCompany1": user.previousCompany1,
    "previousCompany1Detail": user.previousCompany1Detail,
    "previousCompany1Joined": user.previousCompany1Joined,
    "previousCompany1Left": user.previousCompany1Left,
    "previousCompany2": user.previousCompany2,
    "previousCompany2Detail": user.previousCompany2Detail,
    "previousCompany2Joined": user.previousCompany2Joined,
    "previousCompany2Left": user.previousCompany2Left,
    "skill1": user.skill1,
    "ratingSkill1": user.ratingSkill1,
    "skill2": user.skill2,
    "ratingSkill2": user.ratingSkill2,
    "skill3": user.skill3,
    "ratingSkill3": user.ratingSkill3,
    "skill4": user.skill4,
    "ratingSkill4": user.ratingSkill4,
    "skill5": user.skill5,
    "ratingSkill5": user.ratingSkill5,
    "highlight": user.highlight,
    "leetcode": user.leetcode,
    "codechef": user.codechef,
    "github": user.github,
    "linkdin": user.linkdin,
  };

  db.collection("user").doc(uid).set(userCred);
}
