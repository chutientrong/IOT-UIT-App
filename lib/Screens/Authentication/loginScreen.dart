import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:iot_aplication/Screens/Authentication/authFirebase.dart';
import 'package:iot_aplication/Screens/loading/loading_screen.dart';
import 'package:iot_aplication/helper.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "LOGIN";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final inputBorder = BorderRadius.vertical(
    bottom: Radius.circular(10.0),
    top: Radius.circular(10.0),
  );

  bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
            emailValidator: (email) {
              if (!Helper.instance.isEmailValid(email)) return "Email is invalid!";
              return null;
            },
            passwordValidator: (password) {
              if (password.length < 6) return "Password validation is at least 6 character.";
              return null;
            },
            onLogin: (data) async {
              try {
                await AuthFirebase.instance
                    .signIn(data.name, data.password, () async {}, (msg) {
                  print(msg);
                  // MessageDialog.showCustomDialog(context, "Login failed", msg,
                  //     icon: Icons.error);
                });
              } catch (e) {
                return e.message.toString();
                //return 'Incorrect username or password.';
              }
              return null;
            },
            onSignup: (data) async {
              try {
                await AuthFirebase.instance
                    .signUp(data.name, data.password, () {}, (msg) => print(msg));
              } catch (e) {
                return e.message.toString();
              }
              return null;
            },
            onRecoverPassword: (username) async {
              try {
                await AuthFirebase.instance.sendPasswordResetEmail(username);
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) => WillPopScope(
                    onWillPop: () async => false,
                    child: Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 1.0,
                      backgroundColor: Colors.white,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "Success",
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.blue[300],
                              radius: 20,
                              child: Center(
                                child: Icon(
                                  Icons.check,
                                  size: 40,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              "Please check your email to get a new password.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.blue[300],
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                              child: Text("Accept"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
                return null;
              } catch (e) {
                return e.message.toString();
              }
            },
            onSubmitAnimationCompleted: () {
              Navigator.of(context).pushReplacementNamed(LoadingScreen.id);
            },
            title: "GF Team",
            logo: "images/internet_of_things_icon.png",
            //titleTag: "",
            // logoTag: "ABC",
            // messages: LoginMessages(
            //   usernameHint: "",
            //   passwordHint: "",
            //   confirmPasswordHint: "",
            //   forgotPasswordButton: "",
            //   loginButton: "",
            //   signupButton: "",
            //   recoverPasswordButton: "",
            //   goBackButton: "",
            //   recoverPasswordIntro: "",
            //   recoverPasswordDescription: "",
            //   recoverPasswordSuccess: "",
            //   confirmPasswordError: "",
            // ),
            // theme: LoginTheme(
            //   primaryColor: AppTheme.gradientEnd,
            //   titleStyle: TextStyle(
            //     fontSize: 45.0,
            //     fontWeight: FontWeight.w400,
            //     color: Colors.white,
            //   ),
            //   accentColor: AppTheme.gradientEnd,
            //   pageColorDark: HexColor("#2E5090"),
            //   pageColorLight: AppTheme.gradientEnd,
            //   // titleStyle: TextStyle(
            //   //   color: Colors.greenAccent,
            //   //   fontFamily: 'Quicksand',
            //   //   letterSpacing: 4,
            //   // ),
            //   bodyStyle: TextStyle(
            //     fontStyle: FontStyle.italic,
            //     decoration: TextDecoration.underline,
            //   ),
            //   textFieldStyle: TextStyle(
            //     color: Colors.black,
            //     shadows: [Shadow(color: Colors.black, blurRadius: 1)],
            //   ),
            //   buttonStyle: TextStyle(
            //     fontWeight: FontWeight.w800,
            //     color: Colors.white,
            //   ),
            //   cardTheme: CardTheme(
            //     color: Colors.white,
            //     elevation: 5,
            //     margin: EdgeInsets.only(top: 15),
            //     shape: ContinuousRectangleBorder(
            //         borderRadius: BorderRadius.circular(35.0)),
            //   ),
            //   inputTheme: InputDecorationTheme(
            //     // inputTheme: InputDecorationTheme(
            //     //   filled: true,
            //     //   fillColor: Colors.purple.withOpacity(.1),
            //     //   contentPadding: EdgeInsets.zero,
            //     //   errorStyle: TextStyle(
            //     //     backgroundColor: Colors.orange,
            //     //     color: Colors.white,
            //     //   ),
            //     //   labelStyle: TextStyle(fontSize: 12),
            //     enabledBorder: OutlineInputBorder(
            //       borderRadius: inputBorder,
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: AppTheme.gradientEnd, width: 2),
            //       borderRadius: inputBorder,
            //     ),
            //     errorBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.red.shade700, width: 2),
            //       borderRadius: inputBorder,
            //     ),
            //     focusedErrorBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.red.shade400, width: 2),
            //       borderRadius: inputBorder,
            //     ),
            //     disabledBorder: OutlineInputBorder(
            //       borderRadius: inputBorder,
            //     ),
            //   ),
            // ),

          // isLoading ? SpinKitRing(color: Colors.green)
          // //     : MaterialButton(
          // //
          // //         onPressed: () {
          // //           setState(() => isLoading = true);
          // //           AuthFirebase.instance.signInWithGoogle().whenComplete(() {
          // //             setState(() => isLoading = false);
          // //           });
          // //         },
          // //         padding: EdgeInsets.symmetric(vertical: 10),
          // //         shape: RoundedRectangleBorder(
          // //           borderRadius: BorderRadius.circular(20),
          // //         ),
          // //         color: Colors.white,
          // //         child: Row(
          // //           mainAxisAlignment: MainAxisAlignment.center,
          // //           children: <Widget>[
          // //             Image.asset('assets/google_icon.png'),
          // //             // SizedBox(width: 10,),
          // //             Text(
          // //               'GOOGLE',
          // //               style: TextStyle(
          // //                 color: Colors.black,
          // //                 fontSize: 14,
          // //               ),
          // //             ),
          // //           ],
          // //         ),
          // // ),
          // : GestureDetector(
          //   onTap: () {
          //     setState(() => isLoading = true);
          //         AuthFirebase.instance.signInWithGoogle().whenComplete(() {
          //           setState(() => isLoading = false);
          //         });
          //   },
          //   child: Container(
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(30)),
          //     alignment: Alignment.center,
          //     width: MediaQuery.of(context).size.width,
          //     padding: EdgeInsets.symmetric(vertical: 20),
          //     child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Container(
          //               height:
          //               MediaQuery.of(context).size.width * 0.055,
          //               width:
          //               MediaQuery.of(context).size.width * 0.055,
          //               child: Image.asset('assets/google_icon.png')),
          //           SizedBox(
          //             width: 3,
          //           ),
          //           Text("Sign In With Google")
          //         ]),
          //   ),
          // ),

    );
  }
}


// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 56.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 decoration: InputDecoration(labelText: "Username"),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 decoration: InputDecoration(labelText: "Password"),
//                 obscureText: true,
//               ),
//               SizedBox(height: 20),
//               RaisedButton(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(18.0),
//                 ),
//                 color: Theme.of(context).primaryColor,
//                 child: Text(
//                   "Login",
//                   style: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.w400),
//                 ),
//                 onPressed: () {
//                   Navigator.pushReplacementNamed(context, HomeScreen.id);
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
