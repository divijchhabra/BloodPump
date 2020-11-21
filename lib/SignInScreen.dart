import 'package:blood_pump/BottomNavigationController.dart';
import 'package:blood_pump/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'main.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:math';



class SigninScreen extends StatefulWidget {

  static const String id = 'welcome_screen';

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {

bool showSpinner =false;
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();
  String phone;

  Future<bool> loginUser(String phone,BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();
          UserCredential result = await _auth.signInWithCredential(credential);
          User user = result.user;
          if (user != null) {

          }
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception);
        },
        codeSent: (String verificationid, [int forceresendingtoken]) {

          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {

              return Container(
                height: MediaQuery.of(context).size.height * 0.60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:  BorderRadius.only(
                    topLeft: const Radius.circular(30.0),
                    topRight: const Radius.circular(30.0),
                  ),
                ),



                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(

                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ENTER OTP',style:TextStyle(fontSize: 20.0, color:Colors.grey,fontWeight: FontWeight.bold,textBaseline: TextBaseline.alphabetic ),textAlign: TextAlign.left,),
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        PinInputTextField(
                          autoFocus: true,
                          controller: _codeController,
                          keyboardType: TextInputType.number,

                          decoration: BoxLooseDecoration(



                          strokeColorBuilder: PinListenColorBuilder(Colors.redAccent,Colors.redAccent),
                            strokeWidth: 1.5,
                          ),

                          ),

                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Material(
                            color: Colors.redAccent,
                            elevation: 30,
                            borderRadius: BorderRadius.circular(30.0),
                            child: MaterialButton(
                              minWidth: 200.0,
                              height: 42.0,

                              child: Text(
                                'Continue',
                                style: TextStyle(color: Colors.white,fontSize: 16.0,fontWeight: FontWeight.bold),

                              ),
                              onPressed: () async {


                                final code= _codeController.text.trim();
                                AuthCredential credential =PhoneAuthProvider.credential(verificationId: verificationid, smsCode: code);
                                UserCredential result =await  _auth.signInWithCredential(credential);
                                User user=result.user;
                                if(user!=null) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationBarController()),);
                                }else{
                                  print("error");
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        codeAutoRetrievalTimeout: (String verificationId){}
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.red.shade700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    color: Colors.grey,
                    child: TextLiquidFill(

                      text: 'Blood Pump',
                      textAlign: TextAlign.center,

                      waveColor: Colors.white,
                      boxBackgroundColor: Colors.red.shade700,
                      textStyle: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                      waveDuration: Duration(seconds:4),
                      // boxHeight: 300,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Center(
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      child: Text(
                        'Sign in',

                      ),
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (BuildContext context) {

                            return Container(
                              height: MediaQuery.of(context).size.height * 0.60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:  BorderRadius.only(
                                  topLeft: const Radius.circular(30.0),
                                  topRight: const Radius.circular(30.0),
                                ),
                              ),



                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(

                                  child: Column(
                                    children: <Widget>[
                                    TextField(
                                      autofocus: true,
                                      keyboardType: TextInputType.number,




                                      style: TextStyle(

                                        height: 2.5,
                                      ),
                                      onChanged: (val) {
                                        phone = val;
                                      },
                                      decoration: InputDecoration(
                                        prefixText: '+91 ',
                                        prefixStyle: TextStyle(
                                          color: Colors.black,
                                        ),

                                        labelText: 'Enter phone number',

                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                          decorationColor: Colors.black,
                                          backgroundColor: Colors.white10,


                                        ),


                                        hintStyle: TextStyle(color: Colors.grey,fontSize: 20.0),
                                        contentPadding:
                                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.redAccent, width: 1.0),
                                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.redAccent, width: 2.0),
                                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                        ),


                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Material(
                                          color: Colors.redAccent,
                                        elevation: 30,
                                        borderRadius: BorderRadius.circular(30.0),
                                        child: MaterialButton(
                                          minWidth: 200.0,
                                          height: 42.0,

                                          child: Text(
                                            'Get OTP',
                                            style: TextStyle(color: Colors.white,fontSize: 16.0,fontWeight: FontWeight.bold),

                                          ),
                                          onPressed: () {
                                            setState(() {
                                              showSpinner=true;
                                            });

                                            print(phone);

                                            loginUser('+91$phone',context);

                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
