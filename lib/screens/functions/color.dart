import 'package:flutter/material.dart';

Color hexToColor(String hexColor) {
  hexColor = hexColor.replaceAll("#", ""); // Remove the leading '#'
  if (hexColor.length == 8) {
    // Check if the color string includes an alpha channel
    String alpha = hexColor.substring(0, 2);
    hexColor =
        hexColor.substring(2); // Remove the alpha channel from the string
    int colorValue = int.parse("0x$hexColor$alpha");
    return Color(colorValue);
  } else {
    // If no alpha channel, assume full opacity
    int colorValue = int.parse("0xFF$hexColor");
    return Color(colorValue);
  }
}
