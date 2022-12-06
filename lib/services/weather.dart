import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '7ae297a5dc7a26ff69224af01a4bb840';
const webURL = 'https://api.openweathermap.org/data/2.5/weather?';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) {
    NetworkHelper networkHelper =
        NetworkHelper('${webURL}q=$cityName&appid=$apiKey&units=metric');
    var weatherData = networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentPosition();
    NetworkHelper networkHelper = NetworkHelper(
        '${webURL}lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
