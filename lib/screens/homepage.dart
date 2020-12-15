import 'package:covid_stats/objects/graph.dart';
import 'package:covid_stats/objects/measures.dart';
import 'package:flutter/material.dart';
import '../data/stats_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> options = <String>[
    'All',
    'One',
    'Two',
    'Three',
    'Four',
    'sdas',
    'sas',
    'sass',
    'sasasas'
  ];

  String dropdownValue = 'All';

  @override
  void initState() {
    super.initState();
  }

  Widget customCard(String text, int values) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(10),
      elevation: 10,
      shadowColor: Colors.blue,
      borderOnForeground: false,
      semanticContainer: false,
      child: Container(
        padding: EdgeInsets.only(top: 30, bottom: 30),
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '$text',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
              softWrap: true,
            ),
            Text(
              '$values',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
              softWrap: true,
            )
          ],
        ),
      ),
      color: Color(0xFF11233c),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(170.0),
        child: SafeArea(
          minimum: EdgeInsets.all(8),
          child: Container(
            padding: EdgeInsets.only(top: 30, bottom: 30, left: 30, right: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              image: DecorationImage(
                  image: AssetImage('assets/images/virusbg.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.white.withAlpha(180), BlendMode.dstOut)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Covid Statics'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: Colors.white.withAlpha(200),
                  ),
                  softWrap: true,
                ),
                Container(
                  alignment: Alignment.center,
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    onChanged: (String newValue) {
                      setState(() {
                        //TODO
                        // change content of screen according to the selected item
                        dropdownValue = newValue;
                        print(dropdownValue);
                      });
                    },
                    iconDisabledColor: Colors.grey,
                    iconEnabledColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    dropdownColor: Theme.of(context).primaryColor,
                    underline: SizedBox(),
                    items:
                        options.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  height: 35,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFF224679),
                    gradient: LinearGradient(colors: [
                      Colors.blue.withOpacity(0.6),
                      Colors.lightBlue.withOpacity(0.3),
                      Colors.blue.withOpacity(0.4)
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PreventMeasures(),
            Text('$dropdownValue'),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              // height: MediaQuery.of(context).size.height*0.5,
              margin: EdgeInsets.only(
                left: 10,
                bottom: 10,
                right: 10,
              ),
              child: ShowGraph(),
            ),
            Row(
              children: [
                customCard('Total Cases', 1181378),
                customCard('Total Death', 8271277),
              ],
            ),
            Row(
              children: [
                customCard('Daily Cases', 8271261),
                customCard('Daily Death', 99821917),
              ],
            ),
            customCard('Total Recovered', 98719382),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.settings),
        onPressed: () {
          // TODO
          // Add Some setting functionality
          // 1. adding refresh idea
          // 2. change
          var d1 = StatsData();
          d1.printData();
        },
      ),
    );
  }
}
