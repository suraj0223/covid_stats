import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/stats_data.dart';

class CountrySearchBar extends StatefulWidget {
  State createState() => CountrySearchBarState();
}

class CountrySearchBarState extends State<CountrySearchBar> {
  bool _isinit = true;

  @override
  void didChangeDependencies() {
    if (_isinit) Provider.of<StatsData>(context, listen: false).fetchAndSetCountries();
    _isinit = false;
    super.didChangeDependencies();
  }

  List<String> options = <String>[];

  String selectedValue = 'All';
  @override
  Widget build(BuildContext context) {
    var _statsData = Provider.of<StatsData>(context);
    options = _statsData.allCountries;
    _statsData.selectedCountry = selectedValue;
    return DropdownButton<String>(
      value: selectedValue,
      onChanged: (String newValue) {
        setState(() {
          //TODO
          // change content of screen according to the selected item
          // current selected Country
          _statsData.selectedCountry = newValue;
          _statsData.setDataByCountry(_statsData.selectedCountry);
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
