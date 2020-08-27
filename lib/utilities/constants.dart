import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 60.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 18.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
const kTBLTextStyle = TextStyle(
  color: Colors.blueAccent,
  fontFamily: 'Roboto',
  letterSpacing: 2.0,
  fontSize: 30.0,
);
const kTBL_LTextStyle = TextStyle(
  color: Color(0xff787373),
  fontFamily: 'Roboto',
  letterSpacing: 1.0,
  fontSize: 20.0,
);
const kTBL_RTextStyle = TextStyle(
  color: Color(0xff787373),
  fontFamily: 'Roboto',
  letterSpacing: 1.0,
  fontSize: 23.0,
);
const kTextFieldInputDecoration = InputDecoration(
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
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
