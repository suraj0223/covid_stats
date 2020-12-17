import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:intl/intl.dart';
class StatsData with ChangeNotifier {
  
  List _allCountries = [];
  String selectedCountry;
  int totalDeath;
  int totalRecovered;
  int totalConfirmed;
  String lastUpdate;


  // working all good
  void  fetchAndSetCountries() async {
    final countryUrl = 'https://covid19.mathdro.id/api/countries';
    try {
      final response = await http.get(countryUrl);
      var data = convert.jsonDecode(response.body);  
     data['countries'].forEach((val) {
       String temp = val['name'];
       if(temp.length <= 20)
        _allCountries.add(temp);
     } );
     _allCountries.insert(0, 'All');
    } catch (error) {
      throw error;
    }
  }

  List<String> get allCountries{
    return [..._allCountries];
  }


  void setDataByCountry(String selectedCountry) async {
    final url = "https://covid19.mathdro.id/api/countries/$selectedCountry";
    try {
      final response = await http.get(url);
      var data = convert.jsonDecode(response.body);
      totalConfirmed = data['confirmed']['value'];
      totalRecovered = data['recovered']['value'];
      totalDeath = data['deaths']['value'];
      lastUpdate = data['lastUpdate'];

      // print(data['lastUpdate']);
      // print(data);
      notifyListeners();
    } catch (error) {
      throw(error);
    }
  }




}


 // var apilink = 'https://covid19.mathdro.id/api.json';
  // var stats;

  // void getData() async {
  //   var apiData = await http.get(apilink);
  //   var decodeData = convert.jsonDecode(apiData.body);
  //   stats = covidStatsFromJson(decodeData.toString());
  //   return stats;
  // }

  // StatsData() {
  //  getData();
  // }

  // final stats = covidStatsFromJson(
  //     '{"confirmed":{"value":73211434,"detail":"https://covid19.mathdro.id/api/confirmed"},"recovered":{"value":41469223,"detail":"https://covid19.mathdro.id/api/recovered"},"deaths":{"value":1629792,"detail":"https://covid19.mathdro.id/api/deaths"},"dailySummary":"https://covid19.mathdro.id/api/daily","dailyTimeSeries":{"pattern":"https://covid19.mathdro.id/api/daily/[dateString]","example":"https://covid19.mathdro.id/api/daily/2-14-2020"},"image":"https://covid19.mathdro.id/api/og","source":"https://github.com/mathdroid/covid19","countries":"https://covid19.mathdro.id/api/countries","countryDetail":{"pattern":"https://covid19.mathdro.id/api/countries/[country]","example":"https://covid19.mathdro.id/api/countries/USA"},"lastUpdate":"2020-12-15T19:26:40.000Z"}');

  // stats.lastUpdate;
  // this gives the corruent timing of updates

  // stats.confirmed.detail
  // https://covid19.mathdro.id/api/confirmed
  // stats.confirmed.value
  // 73211434

  //   print(stats.deaths.detail);
  // print(stats.deaths.value);
  //   https://covid19.mathdro.id/api/deaths
  //   1629792

//       print(stats.recovered.detail);
//     print(stats.recovered.value);
//      https://covid19.mathdro.id/api/recovered
//  41469223

  // stats.countries
  // https://covid19.mathdro.id/api/countries

// stats.countryDetail.example
//  https://covid19.mathdro.id/api/countries/USA
// stats.countryDetail.pattern
//  https://covid19.mathdro.id/api/countries/[country]

// TODO :: BASIC STRUCTURE OF FILE

// stats.dailySummary
// https://covid19.mathdro.id/api/daily

// var url = 'https://covid19.mathdro.id/api/daily';

//   void printData() async  {
//     var res = await http.get("https://covid19.mathdro.id/api/daily");
//     var data = convert.jsonDecode(res.body);
//       print(data);

//   }

  // [{totalConfirmed: 555, mainlandChina: 548, otherLocations: 7, deltaConfirmed: 0, totalRecovered: 0, confirmed: {total: 555, china: 548, outsideChina: 7}, deltaConfirmedDetail: {total: 0, china: 0, outsideChina: 0}, deaths: {total: 17, china: 17, outsideChina: 0}, recovered: {total: 0, china: 0, outsideChina: 0}, active: 0, deltaRecovered: 0, incidentRate: 0.44821646978651847, peopleTested: 0, reportDate: 2020-01-22}, {totalConfirmed: 654, mainlandChina: 643, otherLocations: 11, deltaConfirmed: 99, totalRecovered: 0, confirmed: {total: 654, china: 643, outsideChina: 11}, deltaConfirmedDetail: {total: 99, china: 95, outsideChina: 4}, deaths: {total: 18, china: 18, outsideChina: 0}, recovered: {total: 0, china: 0, outsideChina: 0}, active: 0, deltaRecovered: 0, incidentRate: 0.47555995744189605, peopleTested: 0, reportDate: 2020-01-23}, {totalConfirmed: 941, mainlandChina: 920, otherLocations: 21, deltaConfirmed: 287, totalRecovered: 0, confirmed: {total: 941, china: 920, outsideChina: 21}, deltaConfirmedDetail

  // print(stats.dailyTimeSeries.example);
  // print(stats.dailyTimeSeries.pattern);
  //  https://covid19.mathdro.id/api/daily/2-14-2020
  //  https://covid19.mathdro.id/api/daily/[dateString]

// ...............................................................................


  // void getByCountries(String country) {}

  // dynamic getAll() {}