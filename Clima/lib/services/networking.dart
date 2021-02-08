import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getWeather() async{
    var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {

      var data = jsonDecode(response.body);
      return data;

    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}