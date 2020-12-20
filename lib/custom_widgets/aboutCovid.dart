import 'package:flutter/material.dart';

class AboutCovid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 10,
      // shadowColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 10,
                )
              ],
              image: DecorationImage(
                
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.blue.withOpacity(0.1),
                  BlendMode.dstOut,
                ),
                image: AssetImage(
                    'assets/images/Coronavirus_3D.png',
                    ),
              ),
            ),
            
          ),
          Container(
            padding: EdgeInsets.all(20),
            // height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.9,
            // color: Color(0xFF11233c),
            // color: Colors.green,
            child: Text(
              '''Coronavirus disease (COVID-19) is an infectious disease caused by a newly discovered coronavirus

Most common symptoms:
  fever
  dry cough
  tiredness
''',
              softWrap: true,
              style: TextStyle(color: Colors.white, fontSize: 18),
              
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue[900].withOpacity(0.8),
                  blurRadius: 8,
                  spreadRadius: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
