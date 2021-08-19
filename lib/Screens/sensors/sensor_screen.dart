
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:iot_aplication/Screens/dashboard/widgets/cliper_widgets.dart';
import 'package:iot_aplication/Screens/sensors/sensor_loading.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class SensorsScreen extends StatefulWidget {
  const SensorsScreen({Key key}) : super(key: key);

  @override
  _SensorsScreenState createState() => _SensorsScreenState();
}

class _SensorsScreenState extends State<SensorsScreen> {
  bool isLoading = false;

  final dbRef = FirebaseDatabase.instance.reference();
  double _volumeValue = 50;

  void onVolumeChanged(double value) {
    setState(() {
      _volumeValue = value;
    });
  }
  int count =0;
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown
    // ]);
    DateTime dateTime = DateTime.now();
    String _dateTime = DateFormat('yyyy-MM-dd').format(dateTime);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: StreamBuilder(
        stream: dbRef.child("Sensor").onValue,
        builder: (context, snapshot) {
           if(snapshot.hasData && !snapshot.hasError && snapshot.data.snapshot.value != null) {
             return Stack(
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
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                   child: Column(
                     children: [
                       SizedBox(height: size.height * 0.02),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                             'Humidity and Temperature',
                             style: TextStyle(
                               color: Colors.black87,
                               fontWeight: FontWeight.bold,
                               fontSize: 20,
                             ),
                           ),

                         ],
                       ),
                       SizedBox(height: size.height * 0.03),
                       Row(
                         children: [
                           Container(
                             height: 120,
                             width: 120,
                             child: ClipRRect(
                               borderRadius: BorderRadius.circular(20),
                               child: Image.network(
                                 "https://image.flaticon.com/icons/png/512/1185/1185915.png",
                                 // fit: BoxFit.cover,
                               ),
                             ),
                           ),
                           SizedBox(width: size.width * 0.05),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(
                                 '$_dateTime',
                                 style: TextStyle(
                                   fontSize: 20,
                                   color: Colors.red,
                                   fontWeight: FontWeight.w800,
                                 ),
                               ),
                               Text(
                                 'Hi,\nMichael',
                                 style: TextStyle(
                                   color: Colors.black87,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 30,
                                 ),
                               ),
                             ],
                           ),
                         ],
                       ),
                       // SizedBox(height: size.height * 0.05),
                       Row(
                         children: [
                           Expanded(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [

                                 //     Text(
                                 //        snapshot.data.snapshot.value["Temperature:"].toString() + "\u00B0C",
                                 //       style: TextStyle(
                                 //         fontSize: 16,
                                 //         fontWeight: FontWeight.w600,
                                 //         color: Colors.black,
                                 //       ),
                                 //     ),
                                 // //   ],
                                 // // ),
                                 // Text(
                                 //   'TEMPERATURE',
                                 //   style: TextStyle(fontSize: 16, color: Colors.black),
                                 // ),
                                 SfRadialGauge(
                                     axes: <RadialAxis>[
                                       RadialAxis(minimum: 0,
                                           maximum: 100,
                                           showLabels: false,
                                           showTicks: false,
                                           radiusFactor: 0.8,
                                           axisLineStyle: AxisLineStyle(
                                               cornerStyle: CornerStyle.bothCurve,
                                               color: Colors.black12,
                                               thickness: 15),
                                           pointers: <GaugePointer>[
                                             RangePointer(
                                                 value: snapshot.data.snapshot.value["Temperature"].toDouble(),
                                                 cornerStyle: CornerStyle.bothCurve,
                                                 width: 15,
                                                 sizeUnit: GaugeSizeUnit.logicalPixel,
                                                 gradient: const SweepGradient(
                                                     colors: <Color>[
                                                       Colors.lightBlue,
                                                       Colors.red
                                                     ],
                                                     stops: <double>[0.25, 0.75]
                                                 )),
                                             NeedlePointer(
                                                 value: snapshot.data.snapshot.value["Temperature"].toDouble(),
                                                 enableDragging: true,
                                                 onValueChanged: onVolumeChanged,
                                                 needleColor: Colors.redAccent,
                                                 needleStartWidth: 5,
                                                 needleEndWidth: 1,
                                                 needleLength: 10,
                                                 // knobStyle: KnobStyle(
                                                 //     color: Colors.white,
                                                 //     borderColor: Colors.greenAccent,
                                                 //     borderWidth: 2,
                                                 //     knobRadius: 30,
                                                 //     sizeUnit: GaugeSizeUnit.logicalPixel)
                                             ),
                                             MarkerPointer(
                                                 value: snapshot.data.snapshot.value["Temperature"].toDouble(),
                                                 enableDragging: true,
                                                 onValueChanged: onVolumeChanged,
                                                 markerHeight: 20,
                                                 markerWidth: 20,
                                                 markerType: MarkerType.circle,
                                                 color: Color(0xFF753A88),
                                                 borderWidth: 2,
                                                 borderColor: Colors.white54)
                                           ],
                                           annotations: <GaugeAnnotation>[
                                             GaugeAnnotation(
                                                 angle: 90,
                                                 axisValue: 5,
                                                 positionFactor: 1.2,
                                                 widget: Text(snapshot.data.snapshot.value["Temperature"].ceil()
                                                     .toString() + '\u00B0C',
                                                     style: TextStyle(
                                                         fontSize: 30,
                                                         fontWeight: FontWeight
                                                             .bold,
                                                         color: Color(0xFFCC2B5E)))
                                             ),
                                             GaugeAnnotation(
                                                 angle: 90,
                                                 axisValue: 5,
                                                 positionFactor: 2,
                                                 widget: Text('Temperature',
                                                     style: TextStyle(
                                                         fontSize: 25,
                                                         fontWeight: FontWeight
                                                             .bold,
                                                         color: Color(0xFFCC2B5E)))
                                             )
                                           ]
                                       )
                                     ]
                                 ),
                               ],
                             ),
                           ),
                           Expanded(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 //     Text(
                                 //       snapshot.data.snapshot.value["Humidity:"].toString()+" %",
                                 //       style: TextStyle(
                                 //         fontSize: 16,
                                 //         fontWeight: FontWeight.w600,
                                 //         color: Colors.black,
                                 //       ),
                                 //     ),
                                 //
                                 // Text(
                                 //   'HUMIDITY',
                                 //   style: TextStyle(fontSize: 16, color: Colors.black),
                                 // ),
                                 // SizedBox(height: 10,),
                                 SfRadialGauge(
                                     axes: <RadialAxis>[
                                       RadialAxis(minimum: 0,
                                           maximum: 100,
                                           showLabels: false,
                                           showTicks: true,
                                           radiusFactor: 0.8,
                                           axisLineStyle: AxisLineStyle(
                                               cornerStyle: CornerStyle.bothCurve,
                                               color: Colors.black12,
                                               thickness: 15),
                                           pointers: <GaugePointer>[
                                             RangePointer(
                                                 value: snapshot.data.snapshot.value["Humidity"].toDouble(),
                                                 cornerStyle: CornerStyle.bothCurve,
                                                 width: 15,
                                                 sizeUnit: GaugeSizeUnit.logicalPixel,
                                                 gradient: const SweepGradient(
                                                     colors: <Color>[
                                                       Colors.lightBlueAccent,
                                                       Colors.blueAccent
                                                     ],
                                                     stops: <double>[0.25, 0.75]
                                                 )),
                                             NeedlePointer(
                                               value: snapshot.data.snapshot.value["Humidity"].toDouble(),
                                               enableDragging: true,
                                               onValueChanged: onVolumeChanged,
                                               needleColor: Colors.redAccent,
                                               needleStartWidth: 5,
                                               needleEndWidth: 1,
                                               needleLength: 10,
                                               // knobStyle: KnobStyle(
                                               //     color: Colors.white,
                                               //     borderColor: Colors.greenAccent,
                                               //     borderWidth: 2,
                                               //     knobRadius: 30,
                                               //     sizeUnit: GaugeSizeUnit.logicalPixel)
                                             ),
                                             MarkerPointer(
                                                 value: snapshot.data.snapshot.value["Humidity"].toDouble(),
                                                 enableDragging: true,
                                                 onValueChanged: onVolumeChanged,
                                                 markerHeight: 20,
                                                 markerWidth: 20,
                                                 markerType: MarkerType.circle,
                                                 color: Color(0xFF753A88),
                                                 borderWidth: 2,
                                                 borderColor: Colors.white54)
                                           ],
                                           annotations: <GaugeAnnotation>[
                                             GaugeAnnotation(
                                                 angle: 90,
                                                 axisValue: 5,
                                                 positionFactor: 1.2,
                                                 widget: Text(snapshot.data.snapshot.value["Humidity"].ceil()
                                                     .toString() + '%',
                                                     style: TextStyle(
                                                         fontSize: 30,
                                                         fontWeight: FontWeight
                                                             .bold,
                                                         color: Color(0xFFCC2B5E)
                                                     )
                                                 ),

                                             ),
                                             GaugeAnnotation(
                                                 angle: 90,
                                                 axisValue: 5,
                                                 positionFactor: 2,
                                                 widget: Text('Humidity',
                                                     style: TextStyle(
                                                         fontSize: 25,
                                                         fontWeight: FontWeight
                                                             .bold,
                                                         color: Color(0xFFCC2B5E)))
                                             )
                                           ]
                                       )
                                     ]
                                 )
                               ],
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
               ]
             );

             // return Column(
             //    children: [
             //      Padding(padding: EdgeInsets.all(18),
             //        child: Row(
             //          mainAxisAlignment: MainAxisAlignment.spaceBetween,
             //          children: [
             //            // Icon(Icons.clear_all),
             //            Text(
             //              "My Sensors",
             //              style: TextStyle(
             //                  fontSize: 20,
             //                  fontWeight: FontWeight.bold
             //              ),
             //            ),
             //            // Icon(Icons.settings)
             //          ],
             //        ),
             //      ),
             //      SizedBox(height: 20,),
             //      Row(
             //        mainAxisAlignment: MainAxisAlignment.center,
             //        children: [
             //          Column(
             //            children: [
             //              Padding(
             //                padding: const EdgeInsets.all(8.0),
             //                child: Text(
             //                  "Temperature",
             //                  style: TextStyle(
             //                      fontSize: 20,
             //                      fontWeight: FontWeight.bold
             //                  ),
             //                ),
             //              ),
             //              Padding(
             //                padding: const EdgeInsets.all(8.0),
             //                child: Text(
             //                  snapshot.data.snapshot.value["Temperature:"].toString(),
             //                  style: TextStyle(
             //                      fontSize: 20,
             //                      fontWeight: FontWeight.bold
             //                  ),
             //                ),
             //              ),
             //            ],
             //          ),
             //        ],
             //      ),
             //      SizedBox(height: 20,),
             //      Column(
             //        children: [
             //          Padding(
             //            padding: const EdgeInsets.all(8.0),
             //            child: Text(
             //              "Humidity",
             //              style: TextStyle(
             //                  fontSize: 20,
             //                  fontWeight: FontWeight.bold
             //              ),
             //            ),
             //          ),
             //          Padding(
             //            padding: const EdgeInsets.all(8.0),
             //            child: Text(
             //              snapshot.data.snapshot.value["Humidity:"].toString(),
             //              style: TextStyle(
             //                  fontSize: 20,
             //                  fontWeight: FontWeight.bold
             //              ),
             //            ),
             //          ),
             //
             //        ],
             //      ),
             //      SizedBox(height: 20,),
             //    ],
             //  );
          } else

            return SensorLoading();
            // return Container(
            //   child: Column(
            //
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Text(
            //           'No data, press Refresh to continue!',
            //           style: TextStyle(
            //               fontSize: 20,
            //               fontWeight: FontWeight.bold,
            //               color: Colors.red
            //           ),
            //         ),
            //       ),
            //       SizedBox(height: 20,),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           FloatingActionButton.extended(
            //             onPressed: () {
            //               // onUpdate();
            //               writeData();
            //             },
            //             label: Text("Refresh"),
            //             elevation: 20,
            //             backgroundColor: Colors.limeAccent,
            //             icon: Icon(Icons.refresh),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // );
        // ignore: missing_return
        }
      ),
    );
  }
  Future<void> writeData(){
    dbRef.child("Sensor").set({
      "Humidity:": 0,
      "Temperature:": 0,
    });

  }
}
