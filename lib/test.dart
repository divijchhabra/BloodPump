import 'package:blood_pump/HomeScreen.dart';
import 'package:flutter/material.dart';



class ListContainers extends StatefulWidget {

   ListContainers({Key key,this.bloodgroup}) : super(key: key);

  final String bloodgroup;
  String selectedBloodgroup;




  @override
  _ListContainersState createState() => _ListContainersState();
}

class _ListContainersState extends State<ListContainers> {


String selectedBloodGroup='';
  Color colour =Colors.blueGrey.shade700;




  @override
  Widget build(BuildContext context) {

    return InkWell(

      onTap: (){
        setState(() {

         colour=colour==Colors.redAccent.shade700?Colors.blueGrey.shade700:Colors.redAccent.shade700;

         if(colour==Colors.redAccent.shade700){
           HomeScreen().selectedBloodGroup=widget.bloodgroup;
         }else{
           HomeScreen().selectedBloodGroup='N/A';
         }


        });

      },
      child: Padding(
        padding: const EdgeInsets.all(5.7),
        child: Container(

          color: colour,
          child: Text(widget.bloodgroup,textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,

              fontSize: 22.0,
            ),
          ),
          padding: EdgeInsets.only(left: 7.0, right: 5.0, top: 10.0, bottom: 5.0),
          width: 50.0,
          height: 45.0,
        ),
      ),
    );
  }
}
