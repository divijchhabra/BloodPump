
Future<void> _showMyDialog() async {


  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        elevation: 20.0,



        title: Text(
          'Register as a Donor!',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            letterSpacing: 1.5,

          ),
          textAlign: TextAlign.center,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(''),

              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_box_outlined),
                  hintText: 'Your name',
                ),
                onChanged: (val){
                  name=val;
                },
              ),
              TextField(

                autofocus: true,
                enabled: false,

                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.call),

                  hintText: phone,
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),



                ),
                onChanged: (val){
                  phone=val;

                },
              ),

              Row(

                children: [
                  SizedBox(width: 10.0,),
                  Text('Male'),
                  Radio(value: 1, groupValue: gender,onChanged: (value){
                    setState(() {
                      radioButtonItem = 'ONE';
                      gender=value;
                    });
                  },),
                  Text('Female'),
                  Radio(value: 2, groupValue: gender,onChanged: (value){
                    setState(() {
                      radioButtonItem = 'ONE';
                      gender=value;
                    });


                  },),

                ],
              ),

              Container(
                color: Colors.grey.shade300,
                child: SizedBox(
                  height: 60.0,
                  child: ListView.builder(


                    itemBuilder: (context, index) {
                      //first row is horizontal scroll
                      var singleChildScrollView = SingleChildScrollView(
                          child: Row(
                            children: <Widget>[
                              ListContainers(bloodgroup: 'B+',),
                              ListContainers(bloodgroup: 'O+',),
                              ListContainers(bloodgroup: 'A+',),
                              ListContainers(bloodgroup: 'AB+'),
                              ListContainers(bloodgroup: 'A-'),
                              ListContainers(bloodgroup: 'B-',),
                              ListContainers(bloodgroup: 'O-'),
                              ListContainers(bloodgroup: 'AB-'),
                            ],
                          ),
                          scrollDirection: Axis.horizontal);
                      return singleChildScrollView;


                    },

                    // 9 rows of AllGenresAndMoods + 1 row of PopularGenresAndMoods
                  ),
                ),

              ),
              SizedBox(height: 10.0,)




            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Register'),
            onPressed: () {
              if(name!='' ) {
                Navigator.of(context).pop();
                print(widget.selectedBloodGroup);


                writeData data = writeData(
                    name: name, phone: phone, uid: uid);
                data.writeDonorData();
              }

            },
          ),
        ],
      );
    },
  );
}
