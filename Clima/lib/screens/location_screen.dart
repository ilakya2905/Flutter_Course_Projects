import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

class LocationScreen extends StatefulWidget {
  final weatherData;
  LocationScreen({this.weatherData});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  String city;
  String weatherIcon;
  String weatherMessage;
  WeatherModel weather = WeatherModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateWeather(widget.weatherData);
  }

  void updateWeather(dynamic data){
    setState(() {
      if(data == null){
        temperature =0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather';
        city = 'sorry';
        return;
      }
      double temp = data['main']['temp'];
      temperature = temp.toInt();
      int id = data['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(id);
      weatherMessage = weather.getMessage(temperature);
      city = data['name'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      print('pressed');
                      var data= await weather.getWeather();
                      print('dfbhbff $data');
                      updateWeather(data);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async{
                      var typedName = await Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return CityScreen();
                        },
                      ));
                      if(typedName!=null){
                        print('typed name $typedName');
                        var data = await weather.getWeatherByCity(typedName);
                        print('data $data');
                        updateWeather(data);
                      }


                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage in $city",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
