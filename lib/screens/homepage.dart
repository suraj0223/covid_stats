// import 'package:covid_stats/custom_widgets/graph.dart';

import 'package:covid_stats/custom_widgets/aboutCovid.dart';
import 'package:covid_stats/custom_widgets/measures.dart';
import 'package:covid_stats/custom_widgets/search_bar.dart';
import 'package:covid_stats/data/stats_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  Widget customCard(String text, int values, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      margin: EdgeInsets.all(10),
      elevation: 10,
      shadowColor: Colors.blue,
      borderOnForeground: false,
      semanticContainer: false,
      child: Container(
        padding: EdgeInsets.only(top: 30, bottom: 30),
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            border: Border.all(
              width: 2.0,
              color: Colors.blueAccent,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '$text',
              style: TextStyle(
                fontSize: 15,
                shadows: [
                  Shadow(
                    color: Colors.blueAccent,
                    blurRadius: 3.0,
                  )
                ],
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              softWrap: true,
            ),
            Text(
              values == null ? 'N/A' : '$values',
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

  Widget headingWidget(String heading, context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        heading,
        style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.textScaleFactorOf(context) * 25,
            fontWeight: FontWeight.w700),
        softWrap: true,
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _statsData = Provider.of<StatsData>(context);
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
                  Colors.white.withAlpha(180),
                  BlendMode.dstOut,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Covid Statics'.toUpperCase(),
                  style: TextStyle(
                    fontSize: MediaQuery.textScaleFactorOf(context) * 35,
                    fontWeight: FontWeight.w700,
                    color: Colors.white.withAlpha(200),
                  ),
                  softWrap: true,
                ),
                Container(
                  alignment: Alignment.center,
                  child: CountrySearchBar(),
                  height: 35,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFF224679),
                    border: Border.all(color: Colors.blueAccent, width: 2),
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
        child: Column(children: [
          headingWidget('About', context),
          AboutCovid(),
          headingWidget('Preventive Measures', context),
          PreventMeasures(),

          // Text('$dropdownValue'),
          // Container(
          //   width: MediaQuery.of(context).size.width * 0.9,
          //   // height: MediaQuery.of(context).size.height*0.5,
          //   margin: EdgeInsets.only(
          //     left: 10,
          //     bottom: 10,
          //     right: 10,
          //   ),
          //   child: ShowGraph(),
          // ),

          customCard(
              'Total Confirmed Cases', _statsData.totalConfirmed, context),
          Row(
            children: [
              customCard('Total Death', _statsData.totalDeaths, context),
              customCard('Total Recovered', _statsData.totalRecovered, context),
            ],
          ),

          customCard('New Confirmed Cases', _statsData.newConfirmed, context),
          Row(
            children: [
              customCard('New Deaths', _statsData.newDeaths, context),
              customCard('New Recovered', _statsData.newRecovered, context)
            ],
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_downward_rounded),
        onPressed: () {
          // TODO
          // Add Some setting functionality
          // 1. adding refresh idea
          // 2. change
          showDialog(
            context: context,
             builder: (_) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: AnimatedContainer(
                duration: Duration(seconds: 5),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.3,
                margin: EdgeInsets.all(10),
                child: Center(
                    child: Column(
                      children: [
                        Icon(Icons.dangerous, size: 100,),
                        Text(
                  'Under Maintenance !',
                  style: TextStyle(fontSize: 30),
                  softWrap: true,
                ),
                      ],
                    )),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    border: Border.all(
                      color: Colors.blueAccent,
                      width: 2,
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}
