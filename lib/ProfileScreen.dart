import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import "package:google_maps_webservice/places.dart";
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import  'package:nominatim_location_picker/nominatim_location_picker.dart';

import 'writedata.dart';

class ProfileScreen extends StatefulWidget {

  const ProfileScreen({Key key}) : super(key: key);

  static const String id = 'profile_screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  String name='';
  String bloodGroup = '';
  String phone ='';
  String uid='';
  int gender;
  String radioButtonItem = 'ONE';
  String location= 'Enter Your Location';
  String _dropDownValue;
String age='';
List UserProfileList = [];
int index=0;



writeData data=writeData();
  @override
  initState(){
    super.initState();
    getCurrentUser();
fetchDatabaseList();



  }

  void getCurrentUser()  {

    User user=  _auth.currentUser;
    phone=user.phoneNumber;

    uid=user.uid;

    print(phone);
  }


   fetchDatabaseList() async {
    dynamic resultant = await writeData().getUsersList();

    if (resultant == null) {
      print("Unable to retreive");
    }

    else {
      try {
        setState(() {
          UserProfileList = resultant;



        });
      }
      catch (e) {
        print(e);
        print('not');
      }
    }
  }

  Future getLocationWithNominatim() async {
    Map result = await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return NominatimLocationPicker(
            searchHint: 'Search Location',
            awaitingForLocation: "Loading....",
          );
        });
    if (result != null) {
       Map maplocation=result;

       print(result);

    } else {
      return;
    }
  }


  // Getting Value From Text Field and Store into String Variable


  @override
  Widget build(BuildContext context) {
    fetchDatabaseList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40),

            ),

          ),
          title: Center(
            child: Text(
              'BE A DONOR !',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
                color: Colors.grey.shade200,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(7, 7),
                    blurRadius: 14.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
                fontStyle: FontStyle.italic,
                letterSpacing: 5.0,
                wordSpacing: 3.0,
              ),
            ),
          ),

          backgroundColor: Colors.red.shade700,
        ),
      ),
      body: Container(

        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .height,

        child: Padding(
          padding: const EdgeInsets.only(right:40.0,left: 40.0,top: 15.0),
          child: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [



                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: NetworkImage('https://ui-avatars.com/api/?name=${'Divij'}'),
                ),
                SizedBox(height: 30.0,),
                TextFormField(

                  initialValue: name,
                  style: TextStyle(
                    fontSize: 15.0,
                    height: 1,
                  ),




                  decoration: InputDecoration(


                    prefixIcon: Icon(Icons.person_rounded),
                    labelText: "Name",



                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  ),
                  onChanged: (val){
                    name=val;
                  },

                ),
                TextField(
                  style: TextStyle(
                    fontSize: 15.0,
                  ),

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    hintText: phone,
                    enabled: false,

                    hintStyle: TextStyle(color: Colors.black, fontSize: 15.0),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  ),

                ),
                TextField(
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.add_location),
                    labelText: 'Location',

                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  ),
                   onTap: ()async {
                    await getLocationWithNominatim();

                  },
                ),

                Row(

                  children: [
                    SizedBox(width: 10.0,),
                    Text('Male'),
                    Radio(value: 1, groupValue: gender,onChanged: (value){
                      setState(() {
                        radioButtonItem = 'One';
                        gender=value;
                      });
                    },),
                    Text('Female'),
                    Radio(value: 2, groupValue: gender,onChanged: (value){
                      setState(() {
                        radioButtonItem = 'TWO';
                        gender=value;
                      });


                    },),
                    Text('Other'),
                    Radio(value: 3, groupValue: gender,onChanged: (value){
                      setState(() {
                        radioButtonItem = 'THREE';
                        gender=value;
                      });
                    },),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Container(
                      width: 50.0,
                      child: TextField(

                        decoration: InputDecoration(
                          hintText: 'Age',
                        ),
                        onChanged: (val){
                          age=val;
                        },
                      ),
                    ),
                    Container(
                      width: 120.0,
                      child: DropdownButton<String>(
                        hint: _dropDownValue == null
                            ? Text('BloodGroup')
                            : Text(
                          _dropDownValue,
                          style: TextStyle(color: Colors.blue),
                        ),
                        isExpanded: true,
                        items: <String>['A+', 'B+', 'O+', 'AB+','A-', 'B-', 'O-', 'AB-',].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(
                                  () {
                                _dropDownValue = val;
                                bloodGroup=_dropDownValue;
                              },
                          );
                        },
                      )
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Material(
                    color: Colors.red.shade700,
                    elevation: 30,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(

                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white,fontSize: 14.0,fontWeight: FontWeight.bold),

                      ),
                      onPressed: () {

                        setState(() {
                          writeData(uid: uid,age: age,bloodgroup: bloodGroup,phone: phone,name: name).writeDonorData();
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              actions: [
                                FlatButton(

                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'OK'
                                    ),
                                ),
                              ],
                              title: Text(
                                  'You\'ve been registered as a Donor !'
                              ),
                            ),
                          );
                        });



                        print(phone);



                      },
                    ),
                  ),
                ),





              ],
            ),
          ),
        ),
      ),
    );
  }
}
