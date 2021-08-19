import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iot_aplication/Screens/covid19/covid_screen.dart';
import 'package:iot_aplication/Screens/dashboard/widgets/cliper_widgets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final dbRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    String _dateTime = DateFormat('yyyy-MM-dd').format(dateTime);
    Size size = MediaQuery.of(context).size;
    // return Container();

    // final  db = FirebaseFirestore.instance.collection('largecollection').get().then(snapshot => {
    // final int documents = qSnap.docs.length;
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],

      body: StreamBuilder(
          stream: dbRef.child("Sensor").onValue,
          builder: (context, snapshot) {
            if(snapshot.hasData && !snapshot.hasError && snapshot.data.snapshot.value != null) {
              if(snapshot.data.snapshot.value["Temperature"] != null){
                var temp = snapshot.data.snapshot.value["Temperature"].toDouble();
                var humi = snapshot.data.snapshot.value["Humidity"].toDouble();
              // print("adsdsad : $count");
              }
              return SafeArea(

                child: Stack(
                    children:[

                      ClipPath(
                      clipper: MyClipper(),
                  // child: Container(
                  //   color: Colors.white,
                  // )
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [
                                  0.1,
                                  0.4,
                                  0.6,
                                  0.9,
                                ],

                                colors: [
                                  Colors.lightBlueAccent,
                                  Colors.lightBlue,
                                  Colors.indigoAccent,
                                  Colors.tealAccent,
                                ],
                              )
                          ),
                        ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: Column(
                        children: [
                          SizedBox(height: size.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Dashboard',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '$_dateTime',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16
                                ),
                              ),
                              // Text(
                              //   'Good Morning,\nMichael',
                              //   style: TextStyle(
                              //     color: Colors.black87,
                              //     fontWeight: FontWeight.bold,
                              //     fontSize: 30,
                              //   ),
                              // ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.03),
                          Column(
                            children: [
                              Container(
                                height: 200,
                                // width: 400,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.network('https://thumbs.gfycat.com/AdoredRegularGoshawk-max-1mb.gif')
                                  //   child: Image.network('https://compliance4all14.files.wordpress.com/2018/06/iot-cover-image.gif?w=957')

                                  // child: Image.asset(
                                  //   "assets/iot-1.gif",
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.05),
                              Container(
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  color: Theme.of(context).primaryColor,
                                  child: Text(
                                    "Covid19 Tracking",
                                    style: TextStyle(
                                      fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  onPressed: () {
                                      Navigator.push(context,
                                      MaterialPageRoute(builder: (BuildContext context) {
                                      return Tracker();}));
                                  },
                                )
                              )

                            ],
                          ),
                          SizedBox(height: size.height * 0.05),
                          // Expanded(
                          //     child: Text(
                          //       countDocuments().toString(),
                          //       style: TextStyle(
                          //         fontSize: 20
                          //       ),
                          // ),
                          // )


                        ],
                      ),
                    ),
                    ]
                ),
              );
            } else return Container();
          }
        ),

    );
  }

}
// countDocuments() async {
//   QuerySnapshot _myDoc = await FirebaseFirestore.instance.collection('users').get();
//   List<DocumentSnapshot> _myDocCount = _myDoc.docs;
//   var count = _myDocCount.length;
//   print(_myDocCount.length); // Count of Documents in Collection
//   return count;
// }