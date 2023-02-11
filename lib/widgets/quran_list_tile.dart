import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/dimensions.dart';
import '../utils/store_data.dart';

class QuranTile extends StatelessWidget {
  final quran;
  const QuranTile({super.key, this.quran});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width(20), vertical: height(10)),
      padding:
          EdgeInsets.symmetric(horizontal: width(15), vertical: height(20)),
      height: height(210),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius(18)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Row(
          //   children: [
          //     Text("(${box.read(Keys.verseKey)})"),
          //     SizedBox(width: width(4)),
          //     Container(
          //       width: width(270),
          //       child: Text(
          //         box.read(Keys.ayatText),
          //         // softWrap: true,
          //       ),
          //     ),
          //   ],
          // ),
          // Text(box.read(Keys.translatedText), maxLines: 3),
          Row(
            children: [
              Text("(${quran.verseKey})"),
              SizedBox(width: width(4)),
              Container(
                width: width(270),
                child: Text(
                  quran.text,
                  // softWrap: true,
                ),
              ),
            ],
          ),
          Text(quran.translations[0].text, maxLines: 3),
        ],
      ),
    );
  }
}
