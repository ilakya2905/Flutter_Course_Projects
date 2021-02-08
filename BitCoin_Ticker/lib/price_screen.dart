import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedValue = 'USD'; //default
  // String btcValue = '19459.04'; //default
  // String etcValue =  '75.58';//default
  // String ltcValue = '75.57';//default
  Map cryptoValue = {};
  bool isWaiting = false;

  Widget androidDropDown() {
    List<DropdownMenuItem<String>> myCurrency = [];
    for (String currency in currenciesList){
      var newItem = DropdownMenuItem(child: Text(currency),value: currency);
      myCurrency.add(newItem);
    }
    return  DropdownButton(
            items: myCurrency,
            onChanged: (value){
              setState(() {
                selectedValue = value;
                print(selectedValue);
                getCurrencyValue();
                // var btc = await getCurrencyValue(selectedValue);
                // print('value************** $btc');
                // btcValue = btc;
                // print('e************** $btcValue');

              });
            },
            value: selectedValue,
        );
  }
  Widget iOSPicker(){
    List<Text> myCurrency = [];
    for (String currency in currenciesList){
      var newItem = Text(currency);
      myCurrency.add(newItem);
    }
    return  CupertinoPicker(
        itemExtent: 32.0,
        onSelectedItemChanged: (selectValue){
          setState(() {
            selectedValue = currenciesList[selectValue];
            print(selectedValue);
            getCurrencyValue();

          });

        },
        children: myCurrency
    );
  }
  void getCurrencyValue() async{
    isWaiting = true;
    CoinData coinData = CoinData();
    try {
      Map valueList = await coinData.getCurrencyData(selectedValue);
      isWaiting = false;

      setState(() {
        // btcValue = valueList['BTC'].toStringAsFixed(2);
        // etcValue = valueList['ETH'].toStringAsFixed(2);
        // ltcValue = valueList['LTC'].toStringAsFixed(2);
        cryptoValue = valueList;
      });
    }
    catch(e){
      print(e);
    }
    // return response['rate'];

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrencyValue();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ValueHolder(codeName: 'BTC', codeValue: isWaiting ? '?' : cryptoValue['BTC'], selectedValue: selectedValue),
              ValueHolder(codeName: 'LTC', codeValue: isWaiting ? '?' : cryptoValue['LTC'], selectedValue: selectedValue),
              ValueHolder(codeName: 'ETC', codeValue: isWaiting ? '?' : cryptoValue['ETH'], selectedValue: selectedValue),
            ],
          ),

          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropDown()
          ),
        ],
      ),
    );
  }
}

class ValueHolder extends StatelessWidget {
  const ValueHolder({
    Key key,
    @required this.codeValue,
    @required this.selectedValue,
    @required this.codeName,

  }) : super(key: key);

  final String codeValue;
  final String selectedValue;
  final String codeName;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $codeName = $codeValue $selectedValue',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
