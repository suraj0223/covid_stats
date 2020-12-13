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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      padding: EdgeInsets.all(7),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border(),
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(images[i])
              ),
            ),
          );
        },
        itemCount: 6,
      ),
    );
  }
}
