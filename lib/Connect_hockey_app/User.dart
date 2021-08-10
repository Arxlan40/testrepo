import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserFirestore {
  final fDb = FirebaseFirestore.instance;

  Future<void> adduser(firstName, lastName, role, email) async {
    try {
      fDb.collection('users').add({
        "birthDate": "",
        "language": "",
        "email": email,
        "coachesGoalieHas": [],
        "countryOfOrigin": "",
        "firstName": firstName,
        "friends": [],
        "games": [],
        "glove": "",
        "goalieNumber": "",
        "goaliesCoachHas": [],
        "lastName": lastName,
        "profilePicture": "",
        "role": role,
        "statistics": {},
        "subscription": "",
        "teamsCoach": "",
        "teamsGoalie": [],
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> edituser(firstName, lastName, birthdate, country, glove,
      goalieNumber, profilePicture, language, teamsGoalie,role, id) async {
    // try {
      fDb.collection('users').doc(id).update({
        "birthDate": birthdate,
        "countryOfOrigin": country,
        "firstName": firstName,
        "glove": glove,
        "role": role,

        "goalieNumber": goalieNumber,
        "lastName": lastName,
        "profilePicture": profilePicture,
        "language": language,
        "teamsGoalie": teamsGoalie,
      });
    // } catch (e) {
    //   print(e);
    // }
  }
}
