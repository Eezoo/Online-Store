import 'package:flutter/material.dart';

import 'bottom_navy_bar_item.dart';

class AppData {
  const AppData._();

  static List<Color> randomColors = [
    const Color(0xFFFCE4EC),
    const Color(0xFFF3E5F5),
    const Color(0xFFEDE7F6),
    const Color(0xFFE3F2FD),
    const Color(0xFFE0F2F1),
    const Color(0xFFF1F8E9),
    const Color(0xFFFFF8E1),
    const Color(0xFFECEFF1),
  ];

  static List<Color> randomPosterBgColors = [
    const Color(0xFFE70D56),
    const Color(0xFF9006A4),
    const Color(0xFF137C0B),
    const Color(0xFF0F2EDE),
    const Color(0xFFECBE23),
    const Color(0xFFA60FF1),
    const Color(0xFF0AE5CF),
    const Color(0xFFE518D1),
  ];

  static List<BottomNavyBarItem> bottomNavyBarItems = [
    const BottomNavyBarItem(
      " الرئسية", //Home
      Icon(Icons.home_rounded),
      Color(0xFF1A4F8C),
    ),
    const BottomNavyBarItem(
      "المفضلة", //Favorite
      Icon(Icons.favorite_rounded),
      Color(0xFF1A4F8C),
    ),
    const BottomNavyBarItem(
      "السلة", //Cart
      Icon(Icons.shopping_cart_checkout_outlined),
      Color(0xFF1A4F8C),
    ),
    // const BottomNavyBarItem(
    //   "الملف الشخصي", //Profile
    //   Icon(Icons.person),
    //   Color(0xFF1A4F8C),
    // ),
  ];
}
