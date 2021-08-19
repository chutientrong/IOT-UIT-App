import 'package:flutter/material.dart';

const Color kBgColor = Color(0xFFecf5fb);
const Color kOrangeColor = Color(0xFFF07662);
const Color kDarkGreyColor = Color(0xFF727C9B);

final Color kTextColor = Color(0xFF1B1D68);
final Color kGrayColor = Color(0xFFA5A6C4);
final Color kBackgroundColor = Color(0xFFF8F8F8);
final String phoneServiceId = "ZzEQNeNUOua8xCcmNYZQ";
final String foodServiceId = "jHeQLouOKTVVsuh5WfxF";
final String laundryServiceId = "lSneLjnXBfqWcnnJkbhY";

class Constants {
  static final Color kTextColor = Color(0xFF1B1D68);
  static final Color kGrayColor = Color(0xFFA5A6C4);
  static final Color kBackgroundColor = Color(0xFFF8F8F8);
}
class CONSTANTS{
  static const SHARED_PREF_KEY_THEME = "theme_code";
  static const SHARED_PREF_KEY_TEMPERATURE_UNIT = "temp_unit";
}
class Helper {
  Helper._privateConstructor();

  static final Helper _instance = Helper._privateConstructor();

  static Helper get instance => _instance;

  final mailValidator = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  bool isEmailValid(String email) => mailValidator.hasMatch(email);

}

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
  color: Colors.white,
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFiledInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular((10.0)),
      ),
      borderSide: BorderSide.none),
);