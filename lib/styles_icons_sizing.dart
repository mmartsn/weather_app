import 'package:flutter/material.dart';
import 'package:weather_app/localization.dart';

KeepLocalization etxt = KeepLocalization();

extension SizeExt on num {
  double get h => this * SizeData.lpHeight / 100;
  double get w => this * SizeData.lpWidth / 100;
  double get sR => this * SizeData.sizeRatio;
}

class SizeData {
  static const double devLpWidth = 393.0;
  static double lpWidth =
      WidgetsBinding.instance!.window.physicalSize.shortestSide /
          WidgetsBinding.instance!.window.devicePixelRatio;
  static double lpHeight =
      WidgetsBinding.instance!.window.physicalSize.longestSide /
          WidgetsBinding.instance!.window.devicePixelRatio;
  static double tsf = WidgetsBinding.instance!.window.textScaleFactor;
  static double sizeRatio = lpWidth / devLpWidth;
  static double kIsTablet = lpWidth >= 600 ? 0.75 : 1;
  static double isTabSizeRatio = sizeRatio * kIsTablet;
  static bool isTablet = lpWidth >= 600 ? true : false;

  static double realFontSize(double fpFontSize) {
    return (fpFontSize * SizeData.isTabSizeRatio * 1.25 / SizeData.tsf)
        .roundToDouble();
  }

  const SizeData();
}

class Styles {
  static final Styles _instance = Styles._internal();

  factory Styles() => _instance;

  Styles._internal();

  final TextStyle cityStyle = TextStyle(
      fontSize: SizeData.realFontSize(30),
      fontWeight: FontWeight.w400,
      color: Colors.white);
  final TextStyle todaysTemperatureTextStyle = TextStyle(
    fontSize: SizeData.realFontSize(60),
    fontWeight: FontWeight.w400,
    color: Colors.white,
    // backgroundColor: Colors.yellow
  );
  final TextStyle weatherMessageStyle = TextStyle(
      fontSize: SizeData.realFontSize(26),
      fontWeight: FontWeight.w300,
      color: Colors.white);
  final TextStyle timePointStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: SizeData.realFontSize(15),
      //height: 1.13,
      color: Colors.white);
  final TextStyle tempByHourStyle = TextStyle(
      fontSize: SizeData.realFontSize(23),
      height: 1.13,
      color: Colors.white,
      fontWeight: FontWeight.w600);

  final TextStyle pickModelStyle = TextStyle(
      fontSize: SizeData.realFontSize(20),
      color: Colors.blue,
      fontWeight: FontWeight.bold);

  final TextStyle atachSelectStyle = TextStyle(
      fontSize: SizeData.realFontSize(19),
      fontWeight: FontWeight.w600,
      color: Colors.white54);
  //fontWeight: FontWeight.bold);
  final TextStyle tsDateStyle = TextStyle(
    fontSize: SizeData.realFontSize(15),
    fontWeight: FontWeight.w600,
    color: Colors.blue[900],
    //backgroundColor: Colors.white,
  );
  final TextStyle baseNoBoldStyle = TextStyle(
    fontSize: SizeData.realFontSize(15),
    height: 1.1,
    color: Colors.black,
    //backgroundColor: Colors.white
  );

  final TextStyle menuBaseStyle = TextStyle(
      fontSize: SizeData.realFontSize(17),
      fontWeight: FontWeight.w600,
      color: Colors.black);
  final TextStyle menuBlueStyle = TextStyle(
      fontSize: SizeData.realFontSize(17),
      fontWeight: FontWeight.w600,
      color: Colors.blue);
  final TextStyle menuWhiteStyle = TextStyle(
      fontSize: SizeData.realFontSize(17),
      //fontWeight: FontWeight.w600,
      color: Colors.white);
  final TextStyle titleHomeStyle = TextStyle(
      fontSize: SizeData.realFontSize(17),
      //fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,
      color: Colors.white);
  final TextStyle titlePageStyle = TextStyle(
    fontSize: SizeData.realFontSize(18),
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
