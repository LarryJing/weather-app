import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '1ba5c9f9476fe320abefebbc539e593e';
const weatherMapURL = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String city) async {
    Network weatherNet =
        Network('$weatherMapURL?q=$city&appid=$apiKey&units=imperial');
    var weatherData = await weatherNet.getData();
    return weatherData;
  }

  Future<dynamic> getCoordsWeather() async {
    Location loc = Location();
    await loc.getLocation();
    double lat = loc.getLat();
    double long = loc.getLong();

    Network weatherNet = Network(
        '$weatherMapURL?lat=$lat&lon=$long&appid=$apiKey&units=imperial');
    var weatherData = await weatherNet.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 85) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 75) {
      return 'Time for shorts and ๐';
    } else if (temp < 50) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
