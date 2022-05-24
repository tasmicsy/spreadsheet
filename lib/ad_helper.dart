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
}
