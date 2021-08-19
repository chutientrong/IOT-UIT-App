// import 'dart:io';
//
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class ProfImgPage extends StatefulWidget {
//   ProfImgPage({this.uid});
//   final String uid;
//   @override
//   _ProfImgPageState createState() => _ProfImgPageState();
// }
//
// class _ProfImgPageState extends State<ProfImgPage> {
//   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   DatabaseReference dbRef =
//   FirebaseDatabase.instance.reference().child("Users");
//   var storage = FirebaseStorage.instance;
//   List<AssetImage> listOfImage;
//   bool clicked = false;
//   List<String> listOfStr = List();
//   String images;
//   bool isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     getImages();
//   }
//
//   void getImages() {
//     listOfImage = List();
//     for (int i = 0; i < 6; i++) {
//       listOfImage.add(
//           AssetImage('assets/images/profimage' + i.toString() + '.png'));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Set Profile Image'),
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             GridView.builder(
//               shrinkWrap: true,
//               padding: const EdgeInsets.all(0),
//               itemCount: listOfImage.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   mainAxisSpacing: 3.0,
//                   crossAxisSpacing: 3.0),
//               itemBuilder: (BuildContext context, int index) {
//                 return GridTile(
//                   child: Material(
//                     child: GestureDetector(
//                       child: Stack(children: <Widget>[
//                         this.images == listOfImage[index].assetName ||
//                             listOfStr.contains(listOfImage[index].assetName)
//                             ? Positioned.fill(
//                             child: Opacity(
//                               opacity: 0.7,
//                               child: Image.asset(
//                                 listOfImage[index].assetName,
//                                 fit: BoxFit.fill,
//                               ),
//                             ))
//                             : Positioned.fill(
//                             child: Opacity(
//                               opacity: 1.0,
//                               child: Image.asset(
//                                 listOfImage[index].assetName,
//                                 fit: BoxFit.fill,
//                               ),
//                             )),
//                         this.images == listOfImage[index].assetName ||
//                             listOfStr.contains(listOfImage[index].assetName)
//                             ? Positioned(
//                             left: 0,
//                             bottom: 0,
//                             child: Icon(
//                               Icons.check_circle,
//                               color: Colors.green,
//                             ))
//                             : Visibility(
//                           visible: false,
//                           child: Icon(
//                             Icons.check_circle_outline,
//                             color: Colors.black,
//                           ),
//                         )
//                       ]),
//                       onTap: () {
//                         setState(() {
//                           if (listOfStr
//                               .contains(listOfImage[index].assetName)) {
//                             this.clicked = false;
//                             listOfStr.remove(listOfImage[index].assetName);
//                             this.images = null;
//                           } else {
//                             this.images = listOfImage[index].assetName;
//                             listOfStr.add(this.images);
//                             this.clicked = true;
//                           }
//                         });
//                       },
//                     ),
//                   ),
//                 );
//               },
//             ),
//             Builder(builder: (context) {
//               return RaisedButton(
//                   child: Text("Set Image"),
//                   onPressed: () {
//                     setState(() {
//                       this.isLoading = true;
//                     });
//                     listOfStr.forEach((img) async {
//                       String imageName = img
//                           .substring(img.lastIndexOf("/"), img.lastIndexOf("."))
//                           .replaceAll("/", "");
//
//                       final Directory systemTempDir = Directory.systemTemp;
//                       final byteData = await rootBundle.load(img);
//
//                       final file =
//                       File('${systemTempDir.path}/$imageName.png');
//                       await file.writeAsBytes(byteData.buffer.asUint8List(
//                           byteData.offsetInBytes, byteData.lengthInBytes));
//                       TaskSnapshot snapshot = await storage
//                           .ref()
//                           .child("images/$imageName")
//                           .putFile(file);
//                           // .onComplete;
//                       if (snapshot.state != TaskState.success) {
//                         var firebaseUser = FirebaseAuth.instance.currentUser;
//                         final String downloadUrl =
//                         await snapshot.ref.getDownloadURL();
//                         await dbRef.child(firebaseUser.uid).update({
//                           "url": downloadUrl,});
//                         setState(() {
//                           isLoading = false;
//                         });
//                         final snackBar =
//                         SnackBar(content: Text('Done'));
//                         Scaffold.of(context).showSnackBar(snackBar);
//                       } else {
//                         print(
//                             'Error from image repo ');
//                         throw ('This file is not an image');
//                       }
//                     });
//                   });
//             }),
//             isLoading
//                 ? CircularProgressIndicator()
//                 : Visibility(visible: false, child: Text("test")),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ProfImgShow extends StatefulWidget {
//   ProfImgShow({this.uid});
//   final String uid;
//
//   @override
//   _ProfImgShowState createState() => _ProfImgShowState();
// }
//
// class _ProfImgShowState extends State<ProfImgShow> {
//
//   bool isLoading = false;
//   bool isRetrieved = false;
//   DataSnapshot cachedResult;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//           appBar: AppBar(
//             title: Text('Profile Image'),
//             centerTitle: true,
//           ),
//           body: Container(
//             padding: EdgeInsets.all(10.0),
//             child: Column(children: <Widget>[
//               !isRetrieved
//                   ? FutureBuilder(
//                 future: FirebaseDatabase.instance
//                     .reference()
//                     .child("Users")
//                     .child(widget.uid)
//                     .once(),
//                 builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done) {
//                     print("correct");
//                     isRetrieved = true;
//                     cachedResult = snapshot.data;
//                     return ListTile(
//                       contentPadding: EdgeInsets.all(8.0),
//                       leading: Image.network(
//                           snapshot.data.value['url'],
//                           fit: BoxFit.fill),
//                     );
//                   } else if (snapshot.connectionState ==
//                       ConnectionState.none) {
//                     return Text("No data");
//                   }
//                   return CircularProgressIndicator();
//                 },
//               )
//                   : displayCachedList(),
//             ]
//             ),
//           ),
//         )
//     );
//
//   }
//
//   ListTile displayCachedList() {
//     return ListTile(
//       contentPadding: EdgeInsets.all(8.0),
//       leading: Image.network(cachedResult.value['url'],
//           fit: BoxFit.fill),
//     );
//
//   }
// }
