// import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
// import 'package:intl/intl.dart';

class StatsData with ChangeNotifier {
  List _allCountries = [];
  String selectedCountry = 'Global';
  int newConfirmed = 0;
  int totalConfirmed = 0;
  int newDeaths = 0;
  int totalDeaths = 0;
  int newRecovered = 0;
  int totalRecovered = 0;
  String lastUpdate = '';

  void fetchAndSetCountries() async {
    final countryUrl = 'https://api.covid19api.com/countries';
    try {
      final response = await http.get(countryUrl);
      var data = convert.jsonDecode(response.body);
      data.forEach((val) {
        String temp = val['Country'];
        temp.length >= 20
            ? _allCountries.add(temp.substring(0, 15) + "...")
            : _allCountries.add(temp);
      });
      _allCountries.insert(0, 'Global');
    } catch (error) {
      throw error;
    }
  }

  List<String> get allCountries {
    _allCountries.sort();
    return [..._allCountries];
  }

  void setDataByCountry(String selectedCountry) async {
    final url = "https://api.covid19api.com/summary";
    try {
      final response = await http.get(url);
      var data = convert.jsonDecode(response.body);

      if (selectedCountry != 'Global') {
        data['Countries'].map((element) {
          String _compareCountry = element['Country'].length >= 20
              ? element['Country'].substring(0, 15) + "..."
              : element['Country'];

          if (_compareCountry == selectedCountry) {
            newConfirmed = element['NewConfirmed'];
            totalConfirmed = element['TotalConfirmed'];
            newDeaths = element['NewDeaths'];
            totalDeaths = element['TotalDeaths'];
            newRecovered = element['NewRecovered'];
            totalRecovered = element['TotalRecovered'];
          }
        }).toList();
      } else {
        newConfirmed = data['Global']['NewConfirmed'];
        totalConfirmed = data['Global']['TotalConfirmed'];
        newDeaths = data['Global']['NewDeaths'];
        totalDeaths = data['Global']['TotalDeaths'];
        newRecovered = data['Global']['NewRecovered'];
        totalRecovered = data['Global']['TotalRecovered'];
      }
      lastUpdate = data['Date'];
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }


  // news api 
//   http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5dfea315673045298bd2b28322c28803
// 5dfea315673045298bd2b28322c28803



  
}
