import 'package:iot_aplication/Screens/Authentication/loginScreen.dart';
import 'package:iot_aplication/Screens/homeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:iot_aplication/Screens/loading/loading_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'IOT Challenge',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen(),
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          LoadingScreen.id: (context)=> LoadingScreen(),
        },
    );
  }
}
  // Widget build(BuildContext context) {
  //   final _init = Firebase.initializeApp();
  // return FutureBuilder(
  //   future: _init,
  //   builder: (context, snapshot){
  //     if(snapshot.hasError) {
  //       return ErrorWidget();
  //     } else if(snapshot.hasData){
  //       return MultiProvider(
  //         providers: [
  //           ChangeNotifierProvider<AuthServices>.value(
  //               value: AuthServices()),
  //           StreamProvider<User>.value(
  //               value: AuthServices().user,
  //             initialData: null,)
  //         ],
  //         child: MaterialApp(
  //           theme: ThemeData(
  //             primarySwatch: Colors.red,
  //           ),
  //           debugShowCheckedModeBanner: false,
  //           home: LoginScreen(),
  //         ),
  //       );
  //     } else {
  //       return Loading();
  //     }
  //   },
  // );
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: _children,
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Hotel Management',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: LoginScreen(),
//         routes: {
//           LoginScreen.id: (context) => LoginScreen(),
//           HomeScreen.id: (context) => HomeScreen(),
//           // BookingScreen.id: (context) => BookingScreen(),
//         },
//       ),
//     );
//   }
// }
//
//
// class ErrorWidget extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Icon(Icons.error),
//             Text("Some thing went wrong!")
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Loading extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }