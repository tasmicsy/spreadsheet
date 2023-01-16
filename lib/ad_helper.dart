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
      return 'ca-app-pub-5943388097691889/2882306250';
     // return "ca-app-pub-3940256099942544/3419835294";
    } else if (Platform.isIOS) {
      return 'ca-app-pub-5943388097691889/3342019997';
    // return "ca-app-pub-3940256099942544/5662855259";
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }
}

class AdInterstitial {
  InterstitialAd? _interstitialAd;
  int num_of_attempt_load = 0;
  bool? ready;

  // create interstitial ads
  void createAd() {
    InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        // 広告が正常にロードされたときに呼ばれます。
        onAdLoaded: (InterstitialAd ad) {
          print('add loaded');
          _interstitialAd = ad;
          num_of_attempt_load = 0;
          ready = true;
        },
        // 広告のロードが失敗した際に呼ばれます。
        onAdFailedToLoad: (LoadAdError error) {
          num_of_attempt_load++;
          _interstitialAd = null;
          if (num_of_attempt_load <= 2) {
            createAd();
          }
        },
      ),
    );
  }
int t=0;
  // show interstitial ads to user
  Future<void> showAd() async {
    ready = false;
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      t=t+1;
      print(t);
      if (t<3) {

        await new Future.delayed(new Duration(seconds: 4));
        showAd();
        print(t);
        return;
      }
      else{ return;}
    }
    print(_interstitialAd);
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) {
        print("ad onAdshowedFullscreen");
      },
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print("ad Disposed");
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError aderror) {
        print('$ad OnAdFailed $aderror');
        ad.dispose();
        createAd();
      },
    );

    // 広告の表示には.show()を使う
    await _interstitialAd!.show();
    _interstitialAd = null;
  }

  // 広告IDをプラットフォームに合わせて取得
  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5943388097691889/8425442824";
    } else if (Platform.isIOS) {
      return "ca-app-pub-5943388097691889/9738524490";
    } else {
      //どちらでもない場合は、テスト用を返す
      throw new UnsupportedError('Unsupported platform');
    }
  }
}
