import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot_aplication/Screens/map/MapsReceiver.dart';


class MapScreen extends StatefulWidget {
  // const MapScreen({Key key}) : super(key: key);
  // final String deviceid;
  // MapScreen({Key key, @required this.deviceid}) : super(key: key);
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static final databaseReference = FirebaseDatabase.instance.reference();

  static double currentLatitude = 0.0;
  static double currentLongitude = 0.0;

  StreamSubscription subscription;

  Map<String, double> currentLocation = new Map();
  StreamSubscription<Map<String, double>> locationSubcription;
  String error;

  String deviceid = 'Unknown';

  List<String> list = [];

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  void initState(){
    getMarkerData();
    super.initState();

  }
  getMarkerData() async{
    databaseReference.child("Location").once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key,values) {
        setState(() {
          list.add(key);
        });
      });
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: const Text('Choose device to track')),
        backgroundColor: Colors.lightBlue[100],
        body: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapsReceiver(deviceid: list[index])),
                  );
                },
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    height: 50,
                    width: 240,
                    child: Text('Device ID : '+list[index]),
                  ),
                ),
              );
            },
            itemCount: list.length)
    );
  }
  // // GoogleMapController myController;
  // // Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  // // void initMarker( specify, specifyId){
  // //   var markerIdVal = specifyId;
  // //   final MarkerId markerId = MarkerId(markerIdVal);
  // //   final Marker marker = Marker(
  // //     markerId: markerId,
  // //     position: LatLng(specify['Latitude'],specify['Longtitude']),
  // //
  // //   );
  // //   setState(() {
  // //     markers[markerId]=marker;
  // //   });
  // // }
  // //
  // // getMarkerData() async{
  // //   FirebaseDatabase.instance.reference().child("Location").once().then((DataSnapshot snapshot){
  // //     Map<dynamic, dynamic> values = snapshot.value;
  // //     values.forEach((key,values) {
  // //       print(values);
  // //       initMarker(values, key);
  // //     });
  // //
  // //   });
  // // }
  // //
  // // @override
  // // void initState() {
  // //   getMarkerData();
  // //   // TODO: implement initState
  // //   super.initState();
  // // }
  //
  // static final databaseReference = FirebaseDatabase.instance.reference();
  //
  // static double currentLatitude = 0.0;
  // static double currentLongitude = 0.0;
  //
  // static GoogleMapController mapController;
  //
  // StreamSubscription subscription;
  //
  // Map<String, double> currentLocation = new Map();
  // StreamSubscription<Map<String, double>> locationSubcription;
  //
  // Location location = new Location();
  // String error;
  //
  // @override
  // void dispose() {
  //   subscription.cancel();
  //   super.dispose();
  // }
  //
  // @override
  // void initState(){
  //   super.initState();
  //
  //   subscription = FirebaseDatabase.instance
  //       .reference()
  //       .child(widget.deviceid)
  //       .onValue
  //       .listen((event) {
  //     setState(() {
  //       currentLatitude = event.snapshot.value['Latitude'];
  //       currentLongitude = event.snapshot.value['Longitude'];
  //     });
  //     mapController.animateCamera(
  //       CameraUpdate.newCameraPosition(
  //         CameraPosition(
  //             target: LatLng(event.snapshot.value['Latitude'], event.snapshot.value['longitude']), zoom: 17),
  //       ),
  //     );
  //     mapController.addMarker(
  //       MarkerOptions(
  //         position: LatLng(event.snapshot.value['Latitude'], event.snapshot.value['longitude']),
  //       ),
  //     );
  //   });
  // }
  //
  // void _onMapCreated(GoogleMapController controller) {
  //   setState(() {
  //     mapController = controller;
  //   });
  // }
  //
  //
  //
  //
  //
  // @override
  // Widget build(BuildContext context) {
  //
  //   Set<Marker> getMarker(){
  //     return <Marker>[
  //       Marker(
  //         markerId: MarkerId(""),
  //         position: LatLng(10.8137, 106.5677),
  //         icon: BitmapDescriptor.defaultMarker,
  //
  //       )
  //     ].toSet();
  //   }
  //
  //   return Scaffold(
  //     body: GoogleMap(
  //       // markers: Set<Marker>.of(markers.values),
  //       // onMapCreated: (GoogleMapController controller){
  //       //   myController = controller;
  //       // },
  //       mapType: MapType.normal,
  //       initialCameraPosition: CameraPosition(
  //         target: LatLng(10.8137, 106.5677),
  //         zoom: 14.0,
  //       ),
  //     )
  //   );
  // }
  // // void onMapCreated(controller){
  // //   setState(() {
  // //     myController = controller;
  // //   });
  // // }
}
