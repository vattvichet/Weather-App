// ignore_for_file: deprecated_member_use

import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

const apiKey = '7ae297a5dc7a26ff69224af01a4bb840';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude;
  double latitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentPosition();
    longitude = location.longitude;
    latitude = location.latitude;
    print("Lat: ${location.latitude}");
    print("Long: ${location.longitude}");
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();

    double temperature = weatherData['main']['temp'];
    //double temperature = decodeData['main']['temp';
    // int condition = decodeData['weather'][0]['id'];
    // String cityName = decodeData['name'];
    print("Temp Fetched: $temperature");

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitRipple(
        color: Colors.white,
        size: 50,
      )),
    );
  }
}
