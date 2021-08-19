import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String id;
  String username;
  String email;
  String photoUrl;
  String displayName="";
  String phoneNumber;
  String gender;

  Users({
    this.id,
    this.username,
    this.email,
    this.photoUrl,
    this.displayName="",
    this.phoneNumber,
    this.gender
  });

  factory Users.fromDocument(DocumentSnapshot doc) {
    return Users(
      id: doc.id,
      email: doc['email'],
      username: doc['username'],
      photoUrl: doc['photoUrl'],
      displayName: doc['displayName'],
        phoneNumber: doc['phoneNumber'],
        gender: doc['gender']
    );
  }
  Users.fromData(Map<String, dynamic> data)
      : id = data['id'],
        email = data['email'],
        username = data['username'],
        photoUrl = data['photoUrl'],
        displayName = data['displayName'],
        phoneNumber = data['phoneNumber'],
        gender = data['gender'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'photoUrl': photoUrl,
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      'gender': gender
    };
  }
}
class UserModel {
  final String id;
  final String bannerImageUrl;
  final String profileImageUrl;
  final String name;
  final String email;

  UserModel(
      {this.id,
        this.bannerImageUrl,
        this.profileImageUrl,
        this.name,
        this.email});
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'profileImageUrl': profileImageUrl,
      'bannerImageUrl': bannerImageUrl,
    };
  }
}