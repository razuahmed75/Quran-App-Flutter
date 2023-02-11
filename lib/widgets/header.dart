import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(130),
      width: double.maxFinite,
      padding: EdgeInsets.only(left: width(20)),
      decoration: BoxDecoration(
          color: Color(0xff227966),
          borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(radius(60)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height(20)),
          Text(
            "Qs AL-BAQARAH",
            style: TextStyle(fontSize: 26, color: Colors.white),
          ),
          SizedBox(height: height(4)),
          Text(
            "Ayat 30",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          SizedBox(height: height(4)),
          Text(
            "Al-Quran",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
