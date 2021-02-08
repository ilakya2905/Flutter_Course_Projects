import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

const apiKey = '4992843E-A0AA-4284-8335-51C3AB8A51E1';
const apiURL = 'https://rest.coinapi.io/v1/exchangerate';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  // final String code;
  // final String countryCode;
  // CoinData({this.code, this. countryCode});

  Future<Map> getCurrencyData(String currencyCode) async{
    Map valueList= {};
    for(String cryptoCurrency in cryptoList){
      var result = await http.get('$apiURL/$cryptoCurrency/$currencyCode?apikey=$apiKey');
      var response = jsonDecode(result.body);
      print(response);
      valueList['$cryptoCurrency'] = response['rate'].toStringAsFixed(2);;
    }
   print(valueList);
    return valueList;
  }
}
