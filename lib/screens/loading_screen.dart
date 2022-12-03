// ignore_for_file: deprecated_member_use

import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentPosition();
    print("Lat: ${location.latitude}");
    print("Long: ${location.longitude}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
