import 'package:flutter/material.dart';
import 'package:news_app/CORE/theme/colors_palette.dart';
import 'package:news_app/models/sorces_model.dart';

class TabBarItem extends StatelessWidget {
 final Source source;
 final bool isSelected;
  const TabBarItem({
    super.key,
    required this.source,
  required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6.0),
      decoration: BoxDecoration(
        color:isSelected? ColorPalette.primaryColor:Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: ColorPalette.primaryColor,
        )
      ),
      child: Text(
        source.name,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: "Exo",
          color: isSelected?Colors.white:ColorPalette.primaryColor,
        ),
      ),
    );
  }
}
