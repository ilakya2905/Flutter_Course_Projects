import '../services/location.dart';
import 'package:clima/services/networking.dart';
const String apiKey = '7a69cfb7388387e5b5f1546d1e45af6b';
const String apiURL = 'http://api.openweathermap.org/data/2.5/weather';


class WeatherModel {
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
  Future<dynamic> getWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    var url = '$apiURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getWeather();
    return data;
  }
  Future<dynamic> getWeatherByCity(String cityName) async{
    var url = '$apiURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getWeather();
    return data;
  }
}
