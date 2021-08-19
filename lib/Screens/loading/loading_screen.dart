import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot_aplication/Screens/HomeScreen/home_screen.dart';

import 'package:splashscreen/splashscreen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key key}) : super(key: key);
  static const String id = "LOADING";
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new HomeScreen(),
        // title: new Text('GeeksForGeeks',textScaleFactor: 2,),
        image: new Image.network('https://quickfever.com/wp-content/uploads/2019/01/bird-gif.gif'),
        // https://i.pinimg.com/originals/f8/1f/f9/f81ff97a450f55f9937c1c04f3fb86b6.gif
        loadingText: Text("Loading"),
        photoSize: 200.0,
        loaderColor: Colors.blue,

                  // Container(
                  //   height: 200,
                  //   // width: 400,
                  //   child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(25),
                  //       child: Image.network('https://quickfever.com/wp-content/uploads/2019/01/bird-gif.gif')
                  //   ),
                  // ),

            // SizedBox(height: 100,),
            // Expanded(child: CircularProgressIndicator(
            //   backgroundColor: Colors.cyanAccent,
            //   valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
            // ))


    );
  }
}
