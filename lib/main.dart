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
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid19 Stats'),
        bottomOpacity: 0.8,
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(child: Text('India')),
              PopupMenuItem(child: Text('USA')),
              PopupMenuItem(child: Text('UK')),
            ];
          }),
        ],
      ),
      drawer: Drawer(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.only(
            top: 40,
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView.builder(
            itemBuilder: (context, int i) => ListTile(
               leading: Text('list Of Pages'),
              shape: RoundedRectangleBorder(),
            ),
            itemCount: 100,
          ),
        ),
      ),
    );
  }
}
