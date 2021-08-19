import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iot_aplication/Datas/model/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:iot_aplication/Screens/Authentication/database_sevices.dart';

class AuthFirebase {

  final Reference storageRef = FirebaseStorage.instance.ref();
  final usersRef = FirebaseFirestore.instance.collection('users');
// final postsRef = Firestore.instance.collection('posts');
  final DateTime timestamp = DateTime.now();
  // Users currentUser;

  AuthFirebase._privateConstructor();

  static final AuthFirebase _instance = AuthFirebase._privateConstructor();

  static AuthFirebase get instance => _instance;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final _fireStore = FirebaseFirestore.instance;
  static final _auth = FirebaseAuth.instance;
  GoogleSignInAccount googleAccount;
  DatabaseService _db = DatabaseService(user: null);
  GoogleSignIn _googleSignIn = new GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  bool isNew;


  Users _userFromFirebaseUsers(User user) {
    return user != null ? Users(id: user.uid) : null;
  }
  // UserModel _userFromFirebaseUser(User user) {
  //   return user != null ? UserModel(id: user.uid) : null;
  // }
  //
  // Stream<UserModel> get user {
  //   return _firebaseAuth.authStateChanges().map(_userFromFirebaseUser);
  // }
// // GET UID
//   Future<String> getCurrentUID() async {
//     return (await _firebaseAuth.currentUser).uid;
//   }
//
//   // GET CURRENT USER
//   Future getCurrentUser() async {
//     return await _firebaseAuth.currentUser;
//   }
  // auth change user stream
  Stream<Users> get userStream {
    return _firebaseAuth.authStateChanges().map(_userFromFirebaseUsers);
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  Future<User> signIn(String email, String passWord, Function onSuccess,
      Function(String) onErrorMessage) async {
    var userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: passWord);
    if (userCredential != null) {
      var user = userCredential.user;
      var idToken = await user.getIdToken();
      print("Token: " + idToken);
      return user;
    }
    return null;
  }

  Future signOut() async {
    // await _googleSignIn.signOut();
    // await facebookSignIn.logOut();

    await _firebaseAuth.signOut();
  }

  Future<User> signUp(String email, String passWord, Function onSuccess,
      Function(String) onErrorMessage) async {
    var user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: passWord);

    try {
      // UserCredential authResult = await _firebaseAuth.createUserWithEmailAndPassword(
      //     email: email, password: passWord);
      // User signedInUser = authResult.user;

      // if (user != null) {
      //   _fireStore.collection('users').doc(user.user.uid).set({
      //     'id': user.user.uid,
      //     'email': email,
      //     'username': '',
      //     'photoUrl': '',
      //     'coverImage': '',
      //     'displayName': '',
      //     'bio': ''
      //
      //   });
      // }
      _createUser(user.user.uid, email, '', '', '', '','+84xxxxxxxxxx', () async {
        onSuccess();
        //await user.user.sendEmailVerification();
      }, onErrorMessage);
    } catch (e) {
      print("An error occured while trying to send email verification");
      print(e.toString());
      return null;
    }
    return user.user;
  }
  //create user object based on firebase user
  Users _userFromFirebase (User user) {
    return (user != null)
        ? Users(
      id: user.uid,
      displayName: user.displayName,
      email: user.email,
      phoneNumber: user.phoneNumber,
      gender: null,
    )
        : null;
  }
  //sign in with google
  Future signInWithGoogle() async {
    try {
      googleAccount = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleAccount.authentication;

      final AuthCredential _credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      final UserCredential result = await _auth.signInWithCredential(_credential);
      final User firebaseUser = result.user;
      Users user = _userFromFirebase(firebaseUser);
      _db.user = Users(
          id: firebaseUser.uid,
          email: firebaseUser.email,
          displayName: firebaseUser.displayName,
          phoneNumber: "+84xxxxxxxxxx"
      );

      if(user != null){
        isNew = result.additionalUserInfo.isNewUser;
        if(isNew)
          _db.setUserData();
      } else
        return user;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Future<bool> loginWithGoogle() async {
  //   try {
  //     GoogleSignIn googleSignIn = GoogleSignIn();
  //     GoogleSignInAccount account = await googleSignIn.signIn();
  //     if(account == null )
  //       return false;
  //     UserCredential res = await _auth.signInWithCredential(GoogleAuthProvider.credential(
  //       idToken: (await account.authentication).idToken,
  //       accessToken: (await account.authentication).accessToken,
  //     ));
  //     if(res.user == null)
  //       return false;
  //     return true;
  //   } catch (e) {
  //     print(e.message);
  //     print("Error logging with google");
  //     return false;
  //   }
  // }
  Future _createUser(String userId, String email, String username, String displayName, String gender, String photoUrl, String phoneNumber, Function onSuccess,
      Function(String) onErrorMessage) async {
    var user = {"email": email, "id": userId, 'username': username, 'photoUrl': photoUrl, 'displayName': displayName, 'phoneNumber': phoneNumber, 'gender': gender};
    var userRef = FirebaseFirestore.instance.collection('users').doc(userId);

    userRef.set(user).catchError((error) async {
      await onErrorMessage("Sign up fail, Please try again.");
    });
  }

  Future sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

}
