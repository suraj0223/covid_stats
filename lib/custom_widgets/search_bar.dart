import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/stats_data.dart';

class CountrySearchBar extends StatefulWidget {
  State createState() => CountrySearchBarState();
}

class CountrySearchBarState extends State<CountrySearchBar> {
  
  List<String> options = <String>[];
  String selectedValue = 'All';
  bool _isinit = true;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      var _statsData = Provider.of<StatsData>(context, listen: false);
      _statsData.selectedCountry = "All";
      selectedValue = 'All';
      _statsData.setDataByCountry(_statsData.selectedCountry);
    } );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isinit) Provider.of<StatsData>(context, listen: true).fetchAndSetCountries();
    _isinit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var _statsData = Provider.of<StatsData>(context, listen: true);
    options = _statsData.allCountries;
    _statsData.selectedCountry = selectedValue;
    return DropdownButton<String>(
      value: selectedValue,
      onChanged: (String newValue) {
        setState(() {
          _statsData.selectedCountry = newValue;

          // set overall data by country 
          _statsData.setDataByCountry(_statsData.selectedCountry);

          // set overall data on daily basis
          //TODO : Not todays data
          if(selectedValue != 'All')
            _statsData.dailyDatabyCountry(_statsData.selectedCountry);

          selectedValue = newValue;
          print(_statsData.selectedCountry);
        });
      },
      iconEnabledColor: Colors.white,
      style: TextStyle(
        fontSize: MediaQuery.of(context).textScaleFactor * 14,
      ),
      dropdownColor: Theme.of(context).primaryColor,
      underline: SizedBox(),
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
