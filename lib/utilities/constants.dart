import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
  color: Color.fromARGB(255, 15, 227, 19),
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40,
  color: Color.fromARGB(255, 14, 212, 107),
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

var kTextFieldInpuDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
  filled: true,
  fillColor: Color.fromARGB(255, 240, 231, 231),
  hintText: "Enter City Name",
  hintStyle: TextStyle(
    color: Colors.black,
  ),
);
