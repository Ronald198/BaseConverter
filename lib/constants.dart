import 'package:flutter/material.dart';

class BaseConverterPalette { 
  static const MaterialColor mainColor =  MaterialColor( 
    0xFFFFC107, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch. 
     <int, Color>{ 
      50: Color(0xFFE6AE06), //10% 
      100:Color(0xFFCC9A06), //20% 
      200:Color(0xFFB38705), //30% 
      300:Color(0xFF997404), //40% 
      400:Color(0xFF806104), //50% 
      500:Color(0xFF664D03), //60% 
      600:Color(0xFF4C3A02), //70% 
      700:Color(0xFF332701), //80% 
      800:Color(0xFF191301), //90% 
      900:Color(0xFF000000), //100% 
    }, 
  ); 
  // static const Color backgroundColor = Color.fromRGBO(163, 194, 164, 1);
}