import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

const apiKey = 'f7a531c48a0d532cda136dfc251304b8';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/onecall';
double lon, lat;

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    print(weatherData);
//    lon = weatherData['coord']['lon'];
//    lat = weatherData['coord']['lat'];
//    print(lon);
//    print(lat);
//    getOnecall(weatherData['coord']['lon'], weatherData['coord']['lat']);
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    print(weatherData);

//    getOnecall(weatherData['coord']['lon'], weatherData['coord']['lat']);
    return weatherData;
  }

  Future<dynamic> getOnecall(double lon, double lat) async {
    NetworkHelper latLon = NetworkHelper(
        '$openWeatherMapURL?lat=$lat&lon=$lon&appid=$apiKey&units=metric');
    return latLon;
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
