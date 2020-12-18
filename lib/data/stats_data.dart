import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:intl/intl.dart';

class StatsData with ChangeNotifier {
  List _allCountries = [];
  String selectedCountry = 'All';
  int totalDeath;
  int totalRecovered;
  int totalConfirmed;
  int activeCases;
  String lastUpdate;

  // working all good
  void fetchAndSetCountries() async {
    final countryUrl = 'https://covid19.mathdro.id/api/countries';
    try {
      final response = await http.get(countryUrl);
      var data = convert.jsonDecode(response.body);
      data['countries'].forEach((val) {
        String temp = val['name'];
        if (temp.length <= 20) _allCountries.add(temp);
      });
      _allCountries.insert(0, 'All');
    } catch (error) {
      throw error;
    }
  }

  List<String> get allCountries {
    return [..._allCountries];
  }

  void setDataByCountry(String selectedCountry) async {
    final url = selectedCountry == 'All'
        ? 'https://covid19.mathdro.id/api'
        : "https://covid19.mathdro.id/api/countries/$selectedCountry";
    try {
      final response = await http.get(url);
      var data = convert.jsonDecode(response.body);
      totalConfirmed = data['confirmed']['value'];
      totalRecovered = data['recovered']['value'];
      totalDeath = data['deaths']['value'];
      lastUpdate = data['lastUpdate'];
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }


  int dailyDeath = 0;
  int dailyActive = 0;
  int dailyRecovered = 0;

// all the data is till date how many cases are there : 
// fuck shit to naming conventions
  void dailyDatabyCountry(String selectedCountry) async {
    dailyDeath = 0;
    dailyActive = 0;
    dailyRecovered = 0;

    final DateTime _currentUpdate = DateTime.now().subtract(Duration(days: 2));
    final String _curruentUpdateDate =
        DateFormat("M-d-y").format(_currentUpdate);
    print(_curruentUpdateDate);
    final url = 'https://covid19.mathdro.id/api/daily/$_curruentUpdateDate';
    try {
      var response = await http.get(url);
      var data = convert.jsonDecode(response.body);
      data.map((data){
        if (data['countryRegion'] == '$selectedCountry' && selectedCountry != 'All' ) {
          // add extra condition for 
          // && data['provinceState'] == 'Rajasthan'
          dailyDeath += int.parse(data['deaths']);
          dailyRecovered += int.parse(data['recovered']);
          dailyActive += int.parse(data['active']);
        }
      }).toList();

      // do all the operations here for daily stats
      print('dailyDeath : $dailyDeath');
      print('dailyRecovered : $dailyRecovered');
      print('dailyActive : $dailyActive');
     
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}