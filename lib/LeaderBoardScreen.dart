import 'package:flutter/material.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({Key key}) : super(key: key);

  @override
  _LeaderBoardScreenState createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(

          leading: Opacity(
              opacity: 1,
              child: Container(
                width: 200,

                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  color: Colors.white38,),
                child: Opacity(
                  opacity: 0.7,
                  child: Icon(
                    Icons.military_tech,
                    size: 60.0,
                  ),
                ),
              )),
          leadingWidth: 150.0,
          
          backgroundColor: Colors.redAccent.shade700,
          title: Text('Top Volunteers'),
        ),
      ),
      /*body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: Card(

              color: Colors.blue.shade50,
              child: ListTile(
                title:Text('John Wick') ,

                leading:Text('1.')

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: Card(

              color: Colors.blue.shade50,
              child: ListTile(
                  title:Text('Divij Chhabra ') ,

                  leading:Text('2.')

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: Card(

              color: Colors.blue.shade50,
              child: ListTile(
                  title:Text('Steve') ,

                  leading:Text('3.')

              ),
            ),
          ),
        ],
      )*/
    );
  }
}
