import 'package:flutter/material.dart';

class UiConfig {
  Color primaryColor = const Color(0xFF00D1FF);
  Color primaryColorSurface = const Color(0xFFEAFBFF);
  Color secondaryColor = const Color(0xFFFFE76B);
  Color secondaryColorSurface = const Color(0xFFFFFBE7);

  Color textColorWhite = const Color(0xFFFFFFFF);
  Color textColorGrey = const Color(0xFFF5F5F5);
  Color textColorGrey2 = const Color(0xFFE9E9E9);
  Color textColorGrey3 = const Color(0xFF828282);
  Color textColorGrey4 = const Color(0xFF424242);
  Color textColorBlack = const Color(0xFF282828);

  TextStyle h1Style = const TextStyle(fontSize: 20, letterSpacing: -0.3, fontWeight: FontWeight.w400, color: Color(0xFF282828), fontFamily: 'Inter');
  TextStyle h2Style = const TextStyle(fontSize: 18, letterSpacing: -0.3, fontWeight: FontWeight.w400, color: Color(0xFF282828), fontFamily: 'Inter');
  TextStyle h3Style = const TextStyle(fontSize: 16, letterSpacing: -0.3, fontWeight: FontWeight.w400, color: Color(0xFF282828), fontFamily: 'Inter');
  TextStyle h4Style = const TextStyle(fontSize: 14, letterSpacing: -0.3, fontWeight: FontWeight.w400, color: Color(0xFF282828), fontFamily: 'Inter');
  TextStyle bodyStyle = const TextStyle(fontSize: 12, letterSpacing: -0.3, fontWeight: FontWeight.w400, color: Color(0xFF282828), fontFamily: 'Inter');
  TextStyle smallStyle = const TextStyle(fontSize: 10, letterSpacing: -0.3, fontWeight: FontWeight.w400, color: Color(0xFF282828), fontFamily: 'Inter');

  FontWeight regularFont = FontWeight.w400;
  FontWeight semiBoldFont = FontWeight.w600;
}