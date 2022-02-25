import 'package:flutter/material.dart';

class General {
  static Color  kMainColor= Colors.white;
  static Color kSecondaryColor = Color(0xFFFA6400);


  static sizeBoxVerical(space) {
    return SizedBox(
      height: space,
    );
  }

  static sizeBoxHorizintal(space) {
    return SizedBox(
      width: space,
    );
  }
  //static Color kUnActiveColor = Colors.grey;
  // static Color kUnActiveColor = Color(0xFFFFE6AC);
  // static Color kOKColor = Color(0xFF2AED33);
  // static Color kPendingColor = Color(0xFF151976);
  // static Color kClosedColor = Color(0xFFFF0000);


  static int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }
}