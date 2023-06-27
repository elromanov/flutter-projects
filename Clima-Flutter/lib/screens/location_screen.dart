import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/Widgets/NavigationBar.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationScreen extends StatefulWidget {

  LocationScreen({this.locationWeather, this.forecastData});

  final locationWeather;
  final forecastData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  WeatherModel weather = WeatherModel();
  var airQuality;
  String weatherIcon;
  String weatherMessage;

  int temperature;
  String cityName;
  String countryName;

  var fourDaysForecast;

  @override
  void initState() {
    super.initState();

    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherData){
    setState(() {

      if(weatherData == null){
        temperature = 0;
        weatherIcon = "Error";
        weatherMessage = "Unable to get weather data";
        cityName = "";
        countryName = "";
        return;
      }

      double temp = weatherData["main"]["temp"];
      temperature = temp.toInt();
      cityName = weatherData["name"];
      countryName = weatherData["sys"]["country"];

      //fourDaysForecast =

      //var condition = weatherData["weather"][0]["id"];
      var condition = weatherData["weather"][0]["icon"];
      //weatherIcon = weather.getWeatherIcon(condition);
      weatherIcon = "http://openweathermap.org/img/wn/${condition}@2x.png";
      weatherMessage = weather.getMessage(temperature);
      print(weatherIcon);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavBar(),
      backgroundColor: kBackgroundColour,
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 35, top: 30, bottom: 5),
                child: Text("Now"),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: kCardColour,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${temperature}°C",
                                style: GoogleFonts.ubuntu(
                                  fontSize: 50,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "${cityName} - ${countryName}",
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 20,
                                  ),

                                ),
                              )
                            ],
                          ),
                          //Text(weatherIcon, style: TextStyle(fontSize: 50),),
                          Image.network(weatherIcon),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        color: kCardColour,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                  ),
                  Container(width: MediaQuery.of(context).size.width * 0.05,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        color: kCardColour,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                  ),
                ],
              ),
              Container(height: MediaQuery.of(context).size.width * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        color: kCardColour,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                  ),
                  Container(width: MediaQuery.of(context).size.width * 0.05,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        color: kCardColour,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*

*/