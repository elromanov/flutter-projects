import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:geocoding/geocoding.dart';

const String apiKey = "Place your own openweather API key here";
const openWeatherMapURL = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

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

  Future<dynamic> getLocationWeather() async {
    appLocation location = appLocation();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(url: '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var networkHelper2 = await networkHelper.getData();
    var weatherData = networkHelper2;

    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(url: '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    var networkHelper2 = await networkHelper.getData();
    var weatherData = networkHelper2;

    return weatherData;
  }

  Future<dynamic> getLocationAirQuality() async{
    appLocation location = appLocation();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(url: 'http://api.openweathermap.org/data/2.5/air_pollution?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey');
    var airQualityData = await networkHelper.getData();
    return airQualityData;
  }

  Future<dynamic> getAirQualityByCityName(String cityName) async {
    List<Location> locations = await locationFromAddress(cityName);
    NetworkHelper networkHelper = NetworkHelper(url: 'http://api.openweathermap.org/data/2.5/air_pollution?lat=${locations[0]}&lon=${locations[1]}&appid=$apiKey');
    var airQualityData = await networkHelper.getData();
    return airQualityData;
  }

  Future<dynamic> getLocationDailyForecast4Days() async {
    appLocation location = appLocation();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(url: 'https://api.openweathermap.org/data/2.5/onecall?lat=${location.latitude}&lon=-${location.longitude}&exclude=hourly,current,minutely,alerts&units=metric&appid=$apiKey');
    var weatherForecast = await networkHelper.getData();
    return weatherForecast;
  }

  Future<dynamic> getDailyForecast4DaysByCityName(String cityName) async {
    List<Location> locations = await locationFromAddress(cityName);
    NetworkHelper networkHelper = NetworkHelper(url: 'https://api.openweathermap.org/data/2.5/onecall?lat=${locations[0]}&lon=-${locations[1]}&exclude=hourly,current,minutely,alerts&units=metric&appid=$apiKey');
    var weatherForecast = await networkHelper.getData();
  }

}


