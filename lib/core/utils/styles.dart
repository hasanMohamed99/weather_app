import 'package:flutter/material.dart';
import 'app_constants.dart';

abstract class Styles {
  static textStyle14(Color textColor, context,{background}) {
    return TextStyle(
      overflow: TextOverflow.ellipsis,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: kMainFont,
      color: textColor,
      background: background,
    );
  }

  static textStyle20(Color textColor, context,{background}) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      fontFamily: kMainFont,
      color: textColor,
      background: background,
      overflow: TextOverflow.visible
    );
  }

  static textStyle16(Color textColor, context,{background}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      fontFamily: kMainFont,
      color: textColor,
      background: background,
    );
  }

  static textStyleBold16(Color textColor, context,{background}) {
    return TextStyle(
      overflow: TextOverflow.ellipsis,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: kMainFont,
      color: textColor,
      background: background,
    );
  }

  static textStyleBold56(Color textColor, context,{background}) {
    return TextStyle(
      fontSize: 56,
      fontWeight: FontWeight.bold,
      fontFamily: kMainFont,
      color: textColor,
      background: background,
    );
  }

  static textStyle12(Color textColor, context,{background}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      fontFamily: kMainFont,
      color: textColor,
      background: background,
    );
  }

  static textStyleBold34(Color textColor, context,{background}) {
    return TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      fontFamily: kMainFont,
      color: textColor,
      background: background,
    );
  }

  static textStyleBold20(Color textColor, context,{background}) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: kMainFont,
      color: textColor,
      background: background,
    );
  }
}
