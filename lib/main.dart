import 'package:blood_pump/SignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:blood_pump/HomeScreen.dart';
import 'ProfileScreen.dart';
import 'BottomNavigationController.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData.light(),
      home:SigninScreen(),


    );
  }
}
