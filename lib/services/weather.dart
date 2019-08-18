import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '106b35731a474f3b426dfe4ec36c9993';
const apiURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getDataByCityName(String city) async {
    String url = '$apiURL?q=$city&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var data = await networkHelper.getData();
    return data;
  }

  Future<dynamic> getData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$apiURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var data = await networkHelper.getData();
    return data;
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
