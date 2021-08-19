import 'package:flutter/material.dart';
import 'package:iot_aplication/Screens/Authentication/loginScreen.dart';
import 'package:iot_aplication/Screens/dashboard/dashboard_screen.dart';
import 'package:iot_aplication/Screens/lights/ligth_screen.dart';
import 'package:iot_aplication/Screens/map/ggmap_screen.dart';
import 'package:iot_aplication/Screens/sensors/sensor_screen.dart';
import 'package:iot_aplication/Screens/weather/weather_screen.dart';
import '../../helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "HOME";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController(
    initialPage: 0,
  );

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IOT Challenge"),
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.logout,color: Colors.white70,),
            onPressed: ()  async {
                try {
                  showAlertDialog(context);
                  // await FirebaseAuth.instance.signOut();
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (_) => LoginScreen()));
                } catch (e) {
                  print(e.toString());
                }
              },
          ),
        ],
        backgroundColor: Colors.lightBlue[400],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   selectedItemColor: kTextColor,
      //   onTap: (int index) {
      //     setState(() {
      //       _currentIndex = index;
      //       _pageController.animateToPage(index,
      //           duration: Duration(milliseconds: 500), curve: Curves.ease);
      //     });
      //   },
      //   type: BottomNavigationBarType.fixed,
      //   // type: BottomNavigationBarType.fixed,
      //   // showSelectedLabels: false,
      //   // showUnselectedLabels: false,
      //   elevation: 0.0,
      //   items: [
      //     BottomNavigationBarItem(
      //       label: "Home",
      //       icon: Icon(Icons.home),
      //     ),
      //     BottomNavigationBarItem(
      //       label: "Light",
      //       icon: Icon(Icons.wb_incandescent),
      //     ),
      //     BottomNavigationBarItem(
      //         label: "Sensor",
      //         icon: Icon(Icons.whatshot)
      //     ),
      //     BottomNavigationBarItem(
      //       label: "User",
      //       icon: Icon(Icons.supervised_user_circle_rounded),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: SalomonBottomBar(

        currentIndex: _currentIndex,
          selectedItemColor: kTextColor,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
              _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            });
          },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Weather
          SalomonBottomBarItem(
            icon: Icon(Icons.cloud),
            title: Text("Weather"),
            selectedColor: Colors.teal,
          ),

          // /// Lights
          // SalomonBottomBarItem(
          //   icon: Icon(Icons.wb_incandescent),
          //   title: Text("Lights"),
          //   selectedColor: Colors.pink,
          // ),

          /// Sensors
          SalomonBottomBarItem(
            icon: Icon(Icons.whatshot),
            title: Text("Sensors"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.location_on),
            title: Text("DVTracking"),
            selectedColor: Colors.teal,
          ),
        ],
      ),

      // backgroundColor: kDarkGreyColor,
      body: PageView(
        controller: _pageController,
        children: [
          DashboardScreen(),
          WeatherScreen(),
          // LightScreen(),
          SensorsScreen(),
          MapScreen(),
          // MapsReceiver(),
          // HomePagee(),
          // ProfileScreen(),
          // Tracker(),
          // EditProfileScreen(),
        ],
        onPageChanged: (index) => _onPageChanged(index),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed:  () {Navigator.pop(context);},
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed:  () async {
        await FirebaseAuth.instance.signOut();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => LoginScreen()));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Log Out"),
      content: Text("Are you sure, do you want to log out?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}