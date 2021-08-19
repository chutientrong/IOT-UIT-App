//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:iot_aplication/utilities/constants.dart';
// import 'package:iot_aplication/Datas/model/user.dart';
//
//
// class DatabaseServices {
//
//   static void updateUserData(Users user) {
//     usersRef.doc(user.id).update({
//       'name': user.username,
//       'gender': user.gender,
//       'photoUrl': user.photoUrl,
//       'displayName': user.displayName,
//       'phoneNumber': user.phoneNumber,
//     });
//   }
//
//   static Future<QuerySnapshot> searchUsers(String name) async {
//     Future<QuerySnapshot> users = usersRef
//         .where('name', isGreaterThanOrEqualTo: name)
//         .where('name', isLessThan: name + 'z')
//         .get();
//
//     return users;
//   }
//
//
// }