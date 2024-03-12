import 'package:flutter/material.dart';

///Classes defining Size configurations with regard to the media query
class SizeConfig {
  static var _mediaQueryData;
  static var screenWidth;
  static var screenHeight;
  static var blockSizeHorizontal;
  static var blockSizeVertical;

  static var _safeAreaHorizontal;
  static var _safeAreaVertical;
  static var safeBlockHorizontal;
  static var safeBlockVertical;

  static var fontSize50;
  static var fontSize32;
  static var fontSize30;
  static var fontSize11;
  static var fontSize12;
  static var fontSize13;
  static var fontSize14;
  static var fontSize15;
  static var fontSize16;
  static var fontSize17;
  static var fontSize18;
  static var fontSize19;
  static var fontSize20;
  static var fontSize21;
  static var fontSize22;
  static var fontSize23;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context).copyWith(
        textScaleFactor:
            MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.3));
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    fontSize50 = SizeConfig.screenWidth * .12;
    fontSize30 = SizeConfig.screenWidth * .076;
    fontSize32 = SizeConfig.screenWidth * .08;
    fontSize18 = SizeConfig.screenWidth * .047;
    fontSize19 = SizeConfig.screenWidth * .048;
    fontSize20 = SizeConfig.screenWidth * .05;
    fontSize21 = SizeConfig.screenWidth * .052;
    fontSize22 = SizeConfig.screenWidth * .053;
    fontSize23 = SizeConfig.screenWidth * .054;
    fontSize17 = SizeConfig.screenWidth * .044;
    fontSize16 = SizeConfig.screenWidth * .042;
    fontSize15 = SizeConfig.screenWidth * .041;
    fontSize14 = SizeConfig.screenWidth * .04;
    fontSize13 = SizeConfig.screenWidth * .037;
    fontSize12 = SizeConfig.screenWidth * .028;
    fontSize11 = SizeConfig.screenWidth * .025;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}
