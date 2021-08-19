// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:flutter/material.dart';
// import 'package:iot_aplication/Datas/model/user.dart';
// import 'package:iot_aplication/Screens/Authentication/authFirebase.dart';
// import 'package:iot_aplication/Screens/userdetails/edit_profile_screen.dart';
// import 'package:iot_aplication/Screens/userdetails/services/user_service.dart';
// import 'package:iot_aplication/Screens/userdetails/widgets/list_widgets.dart';
// import 'package:iot_aplication/Screens/userdetails/widgets/provider_widgets.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({Key key}) : super(key: key);
//
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   // PostService _postService = PostService();
//   UserService _userService = UserService();
//
//   @override
//   Widget build(BuildContext context) {
//     final String uid = ModalRoute.of(context).settings.arguments;
//     return MultiProvider(
//         providers: [
//           // StreamProvider.value(
//           //   value: _userService.isFollowing(
//           //       FirebaseAuth.instance.currentUser.uid, uid),
//           // ),
//           // StreamProvider.value(
//           //   value: _postService.getPostsByUser(uid),
//           // ),
//           StreamProvider.value(
//             value: _userService.getUserInfo(uid),
//           )
//         ],
//         child: Scaffold(
//             body: DefaultTabController(
//               length: 2,
//               child: NestedScrollView(
//                   headerSliverBuilder: (context, _) {
//                     return [
//                       // SliverAppBar(
//                       //   floating: false,
//                       //   pinned: true,
//                       //   expandedHeight: 130,
//                       //   flexibleSpace: FlexibleSpaceBar(
//                       //       background: Image.network(
//                       //         Provider.of<UserModel>(context).bannerImageUrl ?? null,
//                       //         fit: BoxFit.cover,
//                       //       )
//                       //   ),
//                       // ),
//                       SliverList(
//                           delegate: SliverChildListDelegate([
//                             Container(
//                               padding:
//                               EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Provider.of<UserModel>(context)
//                                             .email == null
//                                             ? CircleAvatar(
//                                           radius: 30,
//                                           // backgroundImage: NetworkImage(
//                                           //     Provider.of<UserModel>(context)
//                                           //         .profileImageUrl),
//                                         )
//                                             : Icon(Icons.person, size: 50),
//                                         // Icon(Icons.person, size: 50),
//                                         if (FirebaseAuth.instance.currentUser.uid ==
//                                             uid)
//                                           TextButton(
//                                               onPressed: () {
//                                                 Navigator.pushNamed(context, '/edit');
//                                               },
//                                               child: Text("Edit Profile"))
//                                         else if (FirebaseAuth
//                                             .instance.currentUser.uid !=
//                                             uid &&
//                                             !Provider.of<bool>(context))
//                                           TextButton(
//                                               onPressed: () {
//                                                 _userService.followUser(uid);
//                                               },
//                                               child: Text("Follow"))
//                                         else if (FirebaseAuth
//                                               .instance.currentUser.uid !=
//                                               uid &&
//                                               Provider.of<bool>(context))
//                                             TextButton(
//                                                 onPressed: () {
//                                                   _userService.unfollowUser(uid);
//                                                 },
//                                                 child: Text("Unfollow")),
//                                       ]),
//                                   Align(
//                                     alignment: Alignment.centerLeft,
//                                     child: Container(
//                                       padding: EdgeInsets.symmetric(vertical: 10),
//                                       child: Text(
//                                         Provider.of<UserModel>(context).name ?? '',
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 20,
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             )
//                           ]))
//                     ];
//                   },
//                   body: ListUsers()
//               ),
//             )
//         )
//     );
//   }
// }