import 'package:flutter/material.dart';
import 'package:nutalk/constant.dart';

enum TextStyleTypography{
   headText,
}

enum TextStyleColor{
  primaryColor,
  secondaryColor,
}

extension TextStyleColorExtension on TextStyleColor{
  Color toColor(BuildContext context){
    switch(this){
      case TextStyleColor.primaryColor :
        return  primaryText;
      case TextStyleColor.secondaryColor :
        return  secondaryText;
      default:
      return primaryText;
    }
  }
}
TextStyle customTextStyle({required BuildContext context,TextStyleColor? color}){
  return TextStyle(color: color?.toColor(context) ?? TextStyleColor.primaryColor.toColor(context));
}