import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19 Stats',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF11233c),
        scaffoldBackgroundColor: Color(0xFF0d1a2d),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

// TODO 
// modularise code 

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> options = <String>['All', 'One', 'Two', 'Three', 'Four','sdas','sas','sass','sasasas'];
  String dropdownValue = 'All';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180.0),
        child: Container(
          padding: EdgeInsets.only(top: 60, bottom: 40, left: 30, right: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Color(0xFF09111e).withOpacity(0.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Covid Statics'.toUpperCase(),
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withAlpha(180),
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
                  iconEnabledColor: Colors.green,
                  style: TextStyle(color: Colors.blue),
                  dropdownColor: Theme.of(context).primaryColor,
                  underline: SizedBox(),
                  // selectedItemBuilder: (BuildContext context) {
                  //   return options.map((String value) {
                  //     return Text(
                  //       dropdownValue,
                  //       style: TextStyle(color: Colors.white),
                  //     );
                  //   }).toList();
                  // },
                  items: options.map<DropdownMenuItem<String>>((String value) {
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
                  color: Color(0xFF224679).withOpacity(0.2),
                  boxShadow: [
                    BoxShadow(
                    color: Colors.blue.withOpacity(0.254),
                    blurRadius: 7.0,
                    spreadRadius: 0.0,
                    offset: Offset(
                      0.0,
                      3.0,
                    ),
                  ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
      // TODO
      body: Center(
        child: Text(
          dropdownValue,
          style: TextStyle(color: Colors.white),
        ),
      ),


      // In body contents should be :

      // 1. precautions (use caurosal which automatically slides right to left)
      // 2. Add graph ( according to the options selected)
      // 3. beautiful 4 containers (2 in a row)
      //       i. total deaths upto now
      //       ii. total recovered
      //       iii. total new cases
      //       iv. total cases upto now
      // 4. 

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.settings),
        onPressed: () {
          // TODO
          // Add Some setting functionality
          // 1. adding refresh idea 
          // 2. change 
        },
      ),
    );
  }
}
