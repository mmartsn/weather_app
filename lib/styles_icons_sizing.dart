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

  final TextStyle pickModelStyle = TextStyle(
      fontSize: SizeData.realFontSize(20),
      color: Colors.blue,
      fontWeight: FontWeight.bold);
  final TextStyle pickDescriptStyle =
      TextStyle(fontSize: SizeData.realFontSize(12), color: Colors.black);
  final TextStyle atachSelectStyle = TextStyle(
      fontSize: SizeData.realFontSize(19),
      fontWeight: FontWeight.w600,
      color: Colors.white54);
  //fontWeight: FontWeight.bold);
  final TextStyle recHintStyle =
      TextStyle(fontSize: SizeData.realFontSize(18), color: Colors.white);
  final TextStyle recEnterStyle =
      TextStyle(fontSize: SizeData.realFontSize(17), color: Colors.white);
  final TextStyle baseStyle = TextStyle(
    fontSize: SizeData.realFontSize(16),
    height: 1.1,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    //backgroundColor: Colors.white
  );
  final TextStyle highlightStyle = TextStyle(
      fontSize: SizeData.realFontSize(16),
      height: 1.1,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      backgroundColor: Colors.yellow);
  final TextStyle tsDateStyle = TextStyle(
    fontSize: SizeData.realFontSize(15),
    fontWeight: FontWeight.w600,
    color: Colors.blue[900],
    //backgroundColor: Colors.white,
  );
  final TextStyle tsHighlightStyle = TextStyle(
    fontSize: SizeData.realFontSize(15),
    fontWeight: FontWeight.w600,
    color: Colors.black,
    backgroundColor: Colors.yellow,
  );
  final TextStyle baseNoBoldStyle = TextStyle(
    fontSize: SizeData.realFontSize(15),
    height: 1.1,
    color: Colors.black,
    //backgroundColor: Colors.white
  );
  final TextStyle highlightNoBoldStyle = TextStyle(
      fontSize: SizeData.realFontSize(15),
      height: 1.1,
      color: Colors.black,
      backgroundColor: Colors.yellow);
  final TextStyle baseDescriptionStyle = TextStyle(
      fontSize: SizeData.realFontSize(12),
      height: 1.13,
      color: Colors.black,
      backgroundColor: Colors.white);
  final TextStyle invisibleDescriptionStyle = TextStyle(
      fontSize: SizeData.realFontSize(12),
      height: 1.13,
      color: Colors.white,
      backgroundColor: Colors.white);
  final TextStyle clicableTextStyle = TextStyle(
    fontSize: SizeData.realFontSize(15),
    height: 1.1,
    fontWeight: FontWeight.w600,
    color: Colors.blue,
    //backgroundColor: Colors.white
  );
  final TextStyle todaysTemperatureTextStyle = TextStyle(
    fontSize: SizeData.realFontSize(80),
    fontWeight: FontWeight.w100,
    // color: Colors.blue,
    // backgroundColor: Colors.yellow
  );
  final TextStyle menuBaseStyle = TextStyle(
      fontSize: SizeData.realFontSize(17),
      fontWeight: FontWeight.w600,
      color: Colors.black);
  final TextStyle menuRedStyle = TextStyle(
      fontSize: SizeData.realFontSize(17),
      fontWeight: FontWeight.w600,
      color: Colors.red);
  final TextStyle menuBlueStyle = TextStyle(
      fontSize: SizeData.realFontSize(17),
      fontWeight: FontWeight.w600,
      color: Colors.blue);
  final TextStyle menuWhiteStyle = TextStyle(
      fontSize: SizeData.realFontSize(17),
      //fontWeight: FontWeight.w600,
      color: Colors.white);
  final TextStyle longPressAttachStyle = TextStyle(
      fontSize: SizeData.realFontSize(17),
      fontWeight: FontWeight.w600,
      color: Colors.yellowAccent);
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
  final TextStyle titleEditStyle = TextStyle(
      fontSize: SizeData.realFontSize(17),
      //fontFamily: 'Roboto',
      fontWeight: FontWeight.w600);
  final TextStyle editDescriptionStyle = TextStyle(
      inherit: false, fontSize: SizeData.realFontSize(13), color: Colors.black);
  final TextStyle editrAboutStyle = TextStyle(
      fontSize: SizeData.realFontSize(17),
      fontWeight: FontWeight.w600,
      color: Colors.black);
  final TextStyle editrBackStyle =
      TextStyle(fontSize: SizeData.realFontSize(16), color: Colors.black);
  final TextStyle selectedDocStyle = TextStyle(
      fontSize: SizeData.realFontSize(14),
      fontWeight: FontWeight.w600,
      //height: 1.3,
      color: Colors.black);
}
