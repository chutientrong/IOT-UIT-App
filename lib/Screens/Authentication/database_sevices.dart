import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iot_aplication/Datas/model/user.dart';

class DatabaseService {
  Users user;
  DatabaseService({this.user});

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Users Collection reference
  final CollectionReference userCollection = _firestore.collection('users');

  //map user snapshot to user data
  Users userDataFromSnapshot(DocumentSnapshot snapshot){
    return Users(
      id: snapshot.data()['uid'],
      username: snapshot.data()['name'],
      email: snapshot.data()['email'],
      displayName: snapshot.data()['displayName'],
      gender: snapshot.data()['gender'],
      photoUrl: snapshot.data()['photoUrl'],

    );
  }

  //get user data stream from firebase
  Stream<Users> get userData {
    return _firestore.collection('users').doc(user.id).snapshots()
        .map(userDataFromSnapshot);
  }

  Future setUserData() async {
    return await userCollection.doc(user.id).set({
      'id': user.id,
      'email': user.email,
      'username': user.username,
      'photoUrl': user.photoUrl,
      'displayName': user.displayName,
      'gender': user.gender,
    });
  }

  Future updateUserData(String username, String gender) async {
    if(username == null)
      username = user.username;
    return await userCollection.doc(user.id).set({
      'username': username,
      'gender': gender,
    }, SetOptions(merge: true));
  }

}