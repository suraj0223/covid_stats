import 'package:flutter/material.dart';

class PreventMeasures extends StatelessWidget {
  final List<String> images = [
    'assets/images/disinfect.jpg',
    'assets/images/distance.png',
    'assets/images/mask.png',
    'assets/images/own_test.png',
    'assets/images/UsehandSanitizer.jpg',
    'assets/images/wash_hands.png'
  ];

  @override
  Widget build(BuildContext context) {
    var sz = MediaQuery.of(context).size;
    return Container(
      width: sz.width,
      height: sz.height * 0.18,
      padding: EdgeInsets.all(7),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Container(
            height: sz.height * 0.18,
            width: sz.height * 0.18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border(),
              color: Colors.white,
              image: DecorationImage(image: AssetImage(images[i])),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue[900].withOpacity(0.8),
                  blurRadius: 2,
                  spreadRadius: 3,
                ),
              ],
            ),
          );
        },
        itemCount: 6,
      ),
    );
  }
}
