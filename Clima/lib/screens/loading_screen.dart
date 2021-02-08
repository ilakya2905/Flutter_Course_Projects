 import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
 import 'package:clima/screens/location_screen.dart';
 import 'package:flutter_spinkit/flutter_spinkit.dart';






class LoadingScreen extends StatefulWidget {


  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    print('initState cazlled');
    getLocation();


  }
  @override
  void deactivate() {
    print('deactivate called');
    super.deactivate();
  }
  void getLocation() async{

    WeatherModel weatherModel = WeatherModel();
    var data = await weatherModel.getWeather();
    Navigator.push(context,MaterialPageRoute(builder: (context){
    return LocationScreen(
      weatherData: data,
    );
    }));
    int id=data['weather'][0]['id'];
    double temperature = data['main']['temp'];
    String city = data['name'];
    print('id: $id, temperature: $temperature, city: $city');
  }

  @override
  Widget build(BuildContext context) {
    print('build caleed');
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
