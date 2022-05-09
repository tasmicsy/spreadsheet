import 'dart:io';

class AdHelper{
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3014443422203887/2025150070';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3014443422203887/3019771193';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }
}