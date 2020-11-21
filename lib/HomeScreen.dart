import 'package:blood_pump/PostScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main.dart';
import 'test.dart';
import 'writedata.dart';
import 'VolunteersList.dart';





class HomeScreen extends StatefulWidget {
   HomeScreen({Key key}) : super(key: key);
  static const String id='home_screen';
  String selectedBloodGroup;



  @override
  _HomeScreenState createState() => _HomeScreenState();
}
writeData data=writeData();
class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{

  FirebaseAuth _auth = FirebaseAuth.instance;
  String name='';
   String bloodGroup = '';
   String phone ='';
   String uid='';
  int gender;
  String radioButtonItem = 'ONE';
  TabController tabController;



  @override
  initState(){
    super.initState();
    getCurrentUser();

    tabController = TabController(vsync: this, length: 2)
      ..addListener(() {
        setState(() {


        });


      });


  }


  void getCurrentUser() async {
    User user= await _auth.currentUser;
    uid=user.uid;
    phone=user.phoneNumber;
  }


    




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
          title: Center(
            child: Text(
              'Blood Pump',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                letterSpacing: 2.0,
              ),
            ),
          ),
          backgroundColor: Colors.red.shade700,
          bottom: TabBar(
            tabs: [
              Tab(child: Text("Volunteers",)),
              Tab(child: Text("Requests",)),
            ], indicatorColor: Colors.white,
            controller: tabController,
          ),

        ),
      ),



      body: TabBarView(
        controller: tabController,
        children: [
          Container(child: VolunteersList()),
          Text("Call Screen"),
        ],
      ),
      floatingActionButton :FloatingActionButton.extended(


        backgroundColor: Colors.red.shade700,
        hoverColor: Colors.black,
        elevation: 10,
        onPressed: () {
          showModalBottomSheet<void>(

            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            isDismissible: false,
            builder: (BuildContext context) {
              return PostScreen();
            },


          );
        },
        label: Text('Blood Request',style: TextStyle(

        ),),
        icon: Icon(Icons.add,), ),
    );
  }
}


