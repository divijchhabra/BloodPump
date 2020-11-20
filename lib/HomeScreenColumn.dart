import 'package:flutter/material.dart';

class HomeScreenColumn extends StatefulWidget {


  @override
  _HomeScreenColumnState createState() => _HomeScreenColumnState();
}

class _HomeScreenColumnState extends State<HomeScreenColumn> with TickerProviderStateMixin{

  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 4)
      ..addListener(() {
        setState(() {

        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 120.0,
          color: Colors.red.shade700,
          alignment: Alignment.topLeft,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Blood Pump',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2.0,

                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Card(

                      color: Colors.redAccent,

                      child: Center(child: Text('Volunteers',style: TextStyle(color: Colors.white,fontSize: 22.0),)),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    width: 2,
                    height: 20,
                  ),
                  Expanded(
                    child: Card(
                      color: Colors.redAccent,
                      child: Center(child: Text('Posts',style: TextStyle(color: Colors.white,fontSize: 22.0),)),
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(),


              ],
            ),
          ),
        ),
      ],
    );
  }
}
