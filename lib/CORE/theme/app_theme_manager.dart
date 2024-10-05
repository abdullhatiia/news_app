import 'package:flutter/material.dart';

import 'colors_palette.dart';

class AppTemeManager{
 static ThemeData themeData=ThemeData(
    primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
         titleTextStyle: TextStyle(
          fontFamily: "Exo",
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Colors.white,
         ),
         iconTheme: IconThemeData(
          color: Colors.white,
          size: 35,
         ),
         shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.only(bottomLeft:Radius.circular(40),
              bottomRight:Radius.circular(40),)
         ),
         elevation: 0,
         backgroundColor: Color(0xff39A552),
         centerTitle: true,
 )
  );

}