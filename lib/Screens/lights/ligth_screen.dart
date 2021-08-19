
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot_aplication/Screens/dashboard/widgets/cliper_widgets.dart';
class LightScreen extends StatefulWidget {
  const LightScreen({Key key}) : super(key: key);

  @override
  _LightScreenState createState() => _LightScreenState();
}

class _LightScreenState extends State<LightScreen> {


  bool value = false;
  final dbRef = FirebaseDatabase.instance.reference();
  @override
  onUpdate(){
    setState((){
      value = !value;
    });
  }

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Stack(
        children: [
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
          Column(
            children: [

              Padding(padding: EdgeInsets.all(18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(Icons.clear_all),
                    Text(
                      "My Light",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    // Icon(Icons.settings)
                  ],
                ),
              ),
              SizedBox(height: 50,),
              value? Icon(
                Icons.lightbulb_outline,
                size: 300,
                color: Colors.black,
              ):Icon(
                Icons.lightbulb,
                size: 300,
                color: Colors.yellow,
                ),
              SizedBox(height: 20,),
              FloatingActionButton.extended(
                  onPressed: () {
                    onUpdate();
                    onWrite();
                  },
                  label: value? Text("ON"):Text("OFF"),
                elevation: 20,
                backgroundColor: Colors.red,
                icon: value? Icon(Icons.visibility):Icon(Icons.visibility_off),
              ),
            ],
          ),
        ]
      ),
    );
  }
  Future<void>onWrite(){
  dbRef.child("LightState").set({
    "switch": !value
  });
  }
}
