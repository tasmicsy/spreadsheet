import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper{
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-5943388097691889/2903327871';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-5943388097691889/6303630807';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }
  static String get startAppAdUnitId {
    if (Platform.isAndroid) {
      // return 'ca-app-pub-5943388097691889/2882306250';
     return "ca-app-pub-3940256099942544/3419835294";
    } else if (Platform.isIOS) {
      // return 'ca-app-pub-5943388097691889/3342019997';
    return "ca-app-pub-3940256099942544/5662855259";
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }
}
