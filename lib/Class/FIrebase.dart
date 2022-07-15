import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duckme/Class/user.dart';

class FirebaseCRUD {
  UserCred temp = UserCred();

  int random(min, max) {
    return min + Random().nextInt(max - min);
  }

  var db = FirebaseFirestore.instance;

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
    db.collection("user").doc(uid).set(map);
  }

  void getUser({required String uid}) {
    UserCred user = UserCred();

    // user.firstname =
  }
}
