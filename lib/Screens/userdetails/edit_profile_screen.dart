// import 'package:flutter/cupertino.dart';
// import 'package:iot_aplication/Datas/model/user.dart';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:iot_aplication/Screens/userdetails/services/database_service.dart';
// import 'package:iot_aplication/Screens/userdetails/userdetails_screen.dart';
// import 'package:iot_aplication/utilities/constants.dart';
// import 'package:iot_aplication/Screens/userdetails/services/storage_service.dart';
//
// class EditProfileScreen extends StatefulWidget {
//   final Users user;
//
//   const EditProfileScreen({Key key, this.user}) : super(key: key);
//   @override
//   _EditProfileScreenState createState() => _EditProfileScreenState();
// }
//
// class _EditProfileScreenState extends State<EditProfileScreen> {
//   // String _name;
//   // String _bio;
//   // String _displayName;
//   // File _profileImage;
//   // File _coverImage;
//   // String _imagePickedType;
//   // final _formKey = GlobalKey<FormState>();
//   // bool _isLoading = false;
//   // File _image;
//   // final picker = ImagePicker();
//   //
//   // displayCoverImage() {
//   //   if (_coverImage == null) {
//   //     if (widget.user.coverImage.isNotEmpty) {
//   //       return NetworkImage(widget.user.coverImage);
//   //     }
//   //   } else {
//   //     return FileImage(_coverImage);
//   //   }
//   // }
//   //
//   // displayProfileImage() {
//   //   if (_profileImage == null) {
//   //     if (widget.user.photoUrl.isEmpty) {
//   //       return AssetImage('assets/placeholder.png');
//   //     } else {
//   //       return NetworkImage(widget.user.photoUrl);
//   //     }
//   //   } else {
//   //     return FileImage(_profileImage);
//   //   }
//   // }
//   //
//   // saveProfile() async {
//   //   _formKey.currentState.save();
//   //   if (_formKey.currentState.validate() && !_isLoading) {
//   //     setState(() {
//   //       _isLoading = true;
//   //     });
//   //     String profilePictureUrl = '';
//   //     String coverPictureUrl = '';
//   //     if (_profileImage == null) {
//   //       profilePictureUrl = widget.user.photoUrl;
//   //     } else {
//   //       profilePictureUrl = await StorageService.uploadProfilePicture(
//   //           widget.user.photoUrl, _profileImage);
//   //     }
//   //     if (_coverImage == null) {
//   //       coverPictureUrl = widget.user.coverImage;
//   //     } else {
//   //       coverPictureUrl = await StorageService.uploadCoverPicture(
//   //           widget.user.coverImage, _coverImage);
//   //     }
//   //     Users user = Users(
//   //       id: widget.user.id,
//   //       username: _name,
//   //       photoUrl: profilePictureUrl,
//   //       bio: _bio,
//   //       displayName: _displayName,
//   //       coverImage: coverPictureUrl
//   //     );
//   //
//   //     DatabaseServices.updateUserData(user);
//   //     Navigator.pop(context);
//   //   }
//   // }
//   //
//   //
//   // handleImageFromGallery() async {
//   //   try {
//   //     // File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
//   //     final imageFile = await picker.getImage(source: ImageSource.gallery);
//   //     if (imageFile != null) {
//   //       if (_imagePickedType == 'profile') {
//   //         setState(() {
//   //           _profileImage = File(imageFile.path);
//   //         });
//   //       } else if (_imagePickedType == 'cover') {
//   //         setState(() {
//   //           _coverImage = File(imageFile.path);
//   //         });
//   //       }
//   //     }
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }
//   //
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _name = widget.user.username;
//   //   _bio = widget.user.bio;
//   // }
//   //
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     body: ListView(
//   //       physics: const BouncingScrollPhysics(
//   //           parent: AlwaysScrollableScrollPhysics()),
//   //       children: [
//   //         GestureDetector(
//   //           onTap: () {
//   //             _imagePickedType = 'cover';
//   //             handleImageFromGallery();
//   //           },
//   //           child: Stack(
//   //             children: [
//   //               Container(
//   //                 height: 150,
//   //                 decoration: BoxDecoration(
//   //                   color: KTweeterColor,
//   //                   image: _coverImage == null && widget.user.coverImage.isEmpty
//   //                       ? null
//   //                       : DecorationImage(
//   //                     fit: BoxFit.cover,
//   //                     image: displayCoverImage(),
//   //                   ),
//   //                 ),
//   //               ),
//   //               Container(
//   //                 height: 150,
//   //                 color: Colors.black54,
//   //                 child: Column(
//   //                   crossAxisAlignment: CrossAxisAlignment.stretch,
//   //                   mainAxisAlignment: MainAxisAlignment.center,
//   //                   children: [
//   //                     Icon(
//   //                       Icons.camera_alt,
//   //                       size: 70,
//   //                       color: Colors.white,
//   //                     ),
//   //                     Text(
//   //                       'Change Cover Photo',
//   //                       textAlign: TextAlign.center,
//   //                       style: TextStyle(
//   //                         color: Colors.white,
//   //                         fontSize: 20,
//   //                         fontWeight: FontWeight.bold,
//   //                       ),
//   //                     )
//   //                   ],
//   //                 ),
//   //               )
//   //             ],
//   //           ),
//   //         ),
//   //         Container(
//   //           transform: Matrix4.translationValues(0, -40, 0),
//   //           padding: EdgeInsets.symmetric(horizontal: 20),
//   //           child: Column(
//   //             children: [
//   //               Row(
//   //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //                 crossAxisAlignment: CrossAxisAlignment.end,
//   //                 children: [
//   //                   GestureDetector(
//   //                     onTap: () {
//   //                       _imagePickedType = 'profile';
//   //                       handleImageFromGallery();
//   //                     },
//   //                     child: Stack(
//   //                       children: [
//   //                         CircleAvatar(
//   //                           radius: 45,
//   //                           backgroundImage: displayProfileImage(),
//   //                         ),
//   //                         CircleAvatar(
//   //                           radius: 45,
//   //                           backgroundColor: Colors.black54,
//   //                           child: Column(
//   //                             mainAxisAlignment: MainAxisAlignment.center,
//   //                             crossAxisAlignment: CrossAxisAlignment.stretch,
//   //                             children: [
//   //                               Icon(
//   //                                 Icons.camera_alt,
//   //                                 size: 30,
//   //                                 color: Colors.white,
//   //                               ),
//   //                               Text(
//   //                                 'Change Profile Photo',
//   //                                 textAlign: TextAlign.center,
//   //                                 style: TextStyle(
//   //                                   color: Colors.white,
//   //                                   fontSize: 12,
//   //                                   fontWeight: FontWeight.bold,
//   //                                 ),
//   //                               )
//   //                             ],
//   //                           ),
//   //                         )
//   //                       ],
//   //                     ),
//   //                   ),
//   //                   GestureDetector(
//   //                     onTap: saveProfile,
//   //                     child: Container(
//   //                       width: 100,
//   //                       height: 35,
//   //                       padding: EdgeInsets.symmetric(horizontal: 10),
//   //                       decoration: BoxDecoration(
//   //                         borderRadius: BorderRadius.circular(20),
//   //                         color: KTweeterColor,
//   //                       ),
//   //                       child: Center(
//   //                         child: Text(
//   //                           'Save',
//   //                           style: TextStyle(
//   //                             fontSize: 17,
//   //                             color: Colors.white,
//   //                             fontWeight: FontWeight.bold,
//   //                           ),
//   //                         ),
//   //                       ),
//   //                     ),
//   //                   )
//   //                 ],
//   //               ),
//   //               Form(
//   //                   key: _formKey,
//   //                   child: Column(
//   //                     children: [
//   //                       SizedBox(height: 20),
//   //                       TextFormField(
//   //                         initialValue: _name,
//   //                         decoration: InputDecoration(
//   //                           labelText: 'Name',
//   //                           labelStyle: TextStyle(color: KTweeterColor),
//   //                         ),
//   //                         validator: (input) => input.trim().length < 2
//   //                             ? 'please enter valid name'
//   //                             : null,
//   //                         onSaved: (value) {
//   //                           _name = value;
//   //                         },
//   //                       ),
//   //                       SizedBox(height: 20),
//   //                       TextFormField(
//   //                         initialValue: _bio,
//   //                         decoration: InputDecoration(
//   //                           labelText: 'Bio',
//   //                           labelStyle: TextStyle(color: KTweeterColor),
//   //                         ),
//   //                         onSaved: (value) {
//   //                           _bio = value;
//   //                         },
//   //                       ),
//   //                       SizedBox(height: 20),
//   //                       TextFormField(
//   //                         initialValue: _bio,
//   //                         decoration: InputDecoration(
//   //                           labelText: 'Display Name',
//   //                           labelStyle: TextStyle(color: KTweeterColor),
//   //                         ),
//   //                         onSaved: (value) {
//   //                           _displayName = value;
//   //                         },
//   //                       ),
//   //
//   //                       SizedBox(height: 20),
//   //
//   //                       _isLoading
//   //                           ? CircularProgressIndicator(
//   //                         valueColor:
//   //                         AlwaysStoppedAnimation(KTweeterColor),
//   //                       )
//   //                           : SizedBox.shrink()
//   //                     ],
//   //                   )),
//   //             ],
//   //           ),
//   //         )
//   //       ],
//   //     ),
//   //   );
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         elevation: 1,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.green,
//           ),
//         ),
//       ),
//       body: Container(
//         padding: EdgeInsets.only(left: 16, top: 25, right: 16),
//         child: ListView(
//           children: [
//             Text(
//               "Settings",
//               style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Row(
//               children: [
//                 Icon(
//                   Icons.person,
//                   color: Colors.green,
//                 ),
//                 SizedBox(
//                   width: 8,
//                 ),
//                 Text(
//                   "Account",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             Divider(
//               height: 15,
//               thickness: 2,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             buildAccountOptionRow(context, "Change password"),
//             buildAccountOptionRow(context, "Content settings"),
//             buildAccountOptionRow(context, "Social"),
//             buildAccountOptionRow(context, "Language"),
//             buildAccountOptionRow(context, "Privacy and security"),
//             SizedBox(
//               height: 40,
//             ),
//             Row(
//               children: [
//                 Icon(
//                   Icons.volume_up_outlined,
//                   color: Colors.green,
//                 ),
//                 SizedBox(
//                   width: 8,
//                 ),
//                 Text(
//                   "Notifications",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             Divider(
//               height: 15,
//               thickness: 2,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             buildNotificationOptionRow("New for you", true),
//             buildNotificationOptionRow("Account activity", true),
//             buildNotificationOptionRow("Opportunity", false),
//             SizedBox(
//               height: 50,
//             ),
//             Center(
//               child: OutlineButton(
//                 padding: EdgeInsets.symmetric(horizontal: 40),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 onPressed: () {},
//                 child: Text("SIGN OUT",
//                     style: TextStyle(
//                         fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Row buildNotificationOptionRow(String title, bool isActive) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//               color: Colors.grey[600]),
//         ),
//         Transform.scale(
//             scale: 0.7,
//             child: CupertinoSwitch(
//               value: isActive,
//               onChanged: (bool val) {},
//             ))
//       ],
//     );
//   }
//
//   GestureDetector buildAccountOptionRow(BuildContext context, String title) {
//     return GestureDetector(
//       onTap: () {
//         showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text(title),
//                 content: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text("Option 1"),
//                     Text("Option 2"),
//                     Text("Option 3"),
//                   ],
//                 ),
//                 actions: [
//                   FlatButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Text("Close")),
//                 ],
//               );
//             });
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.grey[600],
//               ),
//             ),
//             Icon(
//               Icons.arrow_forward_ios,
//               color: Colors.grey,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }