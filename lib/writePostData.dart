import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';

class writePostData {

  writePostData({this.Postname, this.description,this.uid,this.neededbloodgroup});

  String Postname, description, neededbloodgroup,uid;

  FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('data');


  Future <void> PostRequests() {
    collectionReference.doc(uid).update({
      'Postname': Postname,



      'neededbloodgroup': neededbloodgroup,

    });
  }

  List UserProfileList = [];


  Future getUsersList() async {
    List VolunteersList = [];

    try {
      await collectionReference.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          VolunteersList.add(element.data());
        });
      });
      print('done');
      return VolunteersList;
    } catch (e) {
      print(e.toString());
      print(' cant');
      return null;
    }
  }
}
