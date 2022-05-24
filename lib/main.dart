import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:share/share.dart';
import 'package:spreadsheet/ad_helper.dart';
import 'package:spreadsheet/data/dropdownitems.dart';
import 'package:spreadsheet/firebase_options.dart';
import 'package:spreadsheet/monumentmodel.dart';
import 'package:spreadsheet/ui/button.dart';
import 'package:spreadsheet/ui/customdropdown.dart';
import 'package:spreadsheet/ui/monumentlst.dart';
import 'package:spreadsheet/ui/textfield.dart';
import 'package:url_launcher/url_launcher.dart';

AppOpenAd? openAd;
Future<void> loadInitialAd()async{
  await AppOpenAd.load(
    adUnitId: AdHelper.startAppAdUnitId,
    request: const AdRequest(),
    adLoadCallback: AppOpenAdLoadCallback(
      onAdLoaded: (ad){
        print("Ad is loadedddd");
        openAd = ad;
        openAd!.show();
      },
      onAdFailedToLoad: (error){
        print("ad failed to load ${error}");
      }
    ), orientation: AppOpenAd.orientationPortrait
  );
}
void showInitialAd(){
  if (openAd == null){
    print('trying');
    loadInitialAd();
    return;
  }
  openAd!.fullScreenContentCallback = FullScreenContentCallback(
    onAdShowedFullScreenContent: (Ad){
      print("onAdshowed");
    },
    onAdFailedToShowFullScreenContent: (ad, error){
      ad.dispose();
      print("failed to load $error");
      openAd = null;
      loadInitialAd();
    },
    onAdDismissedFullScreenContent: (ad){
      ad.dispose();
      print("dismissed");
      openAd = null;
      loadInitialAd();
  }
  );
  openAd!.show();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360,900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
            home:MyHomePage());
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  late Future<List<MonumentModel>> monuments;
  final _editController1 = TextEditingController();
  final _editController2 = TextEditingController();
  final _editController3 = TextEditingController();
  final _editController4 = TextEditingController();
  String? chineseTmp;
  String? catOnKneesTmp;
  String? yaleTmp;
  String? jyutpingTmp;
  String? initialTmp;
  String? vowelTmp;
  String? endTmp;
  String? toneTmp;
  bool? voiceTmp;

  @override
  void initState(){
    loadInitialAd();
    super.initState();
    _bannerAd = BannerAd(
        adUnitId: AdHelper.bannerAdUnitId,
        request: const AdRequest(),
    size: AdSize.banner,
    listener: BannerAdListener(
    onAdLoaded: (_)
    {
      //print("できてるらしい");
      setState(() {
        _isBannerAdReady = true;
      });
    },
      onAdFailedToLoad: (ad, err) {
        //print('Failed to load a banner ad: ${err.message}');
        _isBannerAdReady = false;
        ad.dispose();
      },
    ),
    );
    _bannerAd.load();
  }
  // MyHomePage({ required this.monuments});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(228, 219, 216, 1),
        body: FutureBuilder<List<MonumentModel>>(
          future: MonumentModel.fetchMonument(),
          builder: (context, snapshot) {

            ScreenUtil.init(context,
                orientation: Orientation.landscape,
                deviceSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),

            );
            if (snapshot.hasError) print('now${snapshot.error}');
            return Padding(
              padding:  EdgeInsets.only(top: 35.h, bottom: 13.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 6.0.h, bottom: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16.h,
                          width: 15.w,
                          child: IconButton(onPressed: (){
                            showDialog(context: context, builder: (context){
                              return SimpleDialog(

                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                                      child: TextButton(onPressed: (){
                                        launchUrl(Uri.parse("https://catonknees.com/privacy-policy-tc/")) ;
                                      }, child: Text("プライバシーポリシー", style: TextStyle(fontSize: 15.h),)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                                      child: TextButton(onPressed: (){
                                        launchUrl(Uri.parse("https://www.freeprivacypolicy.com/live/fee39dae-6962-4722-a07d-1e71c92801d7"));
                                      }, child: Text("利用規約", style: TextStyle(fontSize: 15.h),)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                                      child: TextButton(onPressed: (){
                                        launchUrl(Uri.parse('mailto:infocatonknees@gmail.com?subject=お問い合せ&body=お問合せ内容を書いてください。'));
                                      }, child: Text("お問合せ", style: TextStyle(fontSize: 15.h),)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                                      child: TextButton(onPressed: (){
                                        launchUrl(Uri.parse("https://catonknees.com/"));
                                      }, child: Text("ホームページ", style: TextStyle(fontSize: 15.h),)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                                      child: TextButton(onPressed: (){
                                        Share.share("広東語の発音をひらがな表記に！https://youtube.com/playlist?list=PLZ4XMcZZE-B0mz1ICjKc3Iaw5VD00RLyF");
                                      }, child: Text("シェアする", style: TextStyle(fontSize: 15.h),)),
                                    ),
                                  ],

                              );
                            });
                          },
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.dehaze, size: 23.h,)),
                        ),
                        Text("世界初！広東語発音ひらがな表記", style: TextStyle(
                          fontSize: 14.h,
                        ),),
                        SizedBox(height: 16.h, width: 15.w,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: (){
                            Share.share("広東語の発音をひらがな表記に！https://youtube.com/playlist?list=PLZ4XMcZZE-B0mz1ICjKc3Iaw5VD00RLyF");
                          },
                          icon: Icon(Icons.ios_share_outlined, size: 18.h,),
                        ),),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/logostraight.png", height: 30.h,
            // width: MediaQuery
            //               .of(context)
            //               .size
            //               .width * 0.65,
                      ),
                      SizedBox(
                          height: 50.h,
                          child: FittedBox(child: Text(" 式", style: TextStyle(fontSize: 40.sp),))),
                    ],
                  ),

                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.4,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('広東語発音完全解説動画は', style: TextStyle(fontSize: 12.h),),
                            SizedBox(
                              height: 28.h,
                              width: 40.h,
                              child: TextButton(
                                  onPressed: ()async {
                                    launchUrl(Uri.parse('https://youtube.com/playlist?list=PLZ4XMcZZE-B0mz1ICjKc3Iaw5VD00RLyF'));
                                  },
                                  style: ButtonStyle(
                                      alignment: Alignment.center,
                                    padding: MaterialStateProperty.all(EdgeInsets.zero)
                                  ),
                                  
                                  child: Text('こちら',style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.brown,
                                    fontSize: 12.h
                                  ),textAlign: TextAlign.start,)),
                            )
                          ],
                        ),
                        CustomTextField(editController: _editController1,label: "漢字 Chinese", onChangedFunc: (newText){
                          chineseTmp = newText;
                          print(newText);
                          setState((){
                            chineseTmp = newText;
                            catOnKneesTmp= catOnKneesTmp;
                            yaleTmp= yaleTmp;
                            jyutpingTmp= jyutpingTmp;
                            initialTmp= initialTmp;
                            vowelTmp= vowelTmp;
                            endTmp= endTmp;
                            toneTmp= toneTmp;

                          });
                          },),
                        CustomTextField(editController: _editController2,label: "ひらがな CatOnKnees", onChangedFunc: (newText){

                          setState((){
                            chineseTmp = chineseTmp;
                            catOnKneesTmp= newText;
                            yaleTmp= yaleTmp;
                            jyutpingTmp= jyutpingTmp;
                            initialTmp= initialTmp;
                            vowelTmp= vowelTmp;
                            endTmp= endTmp;
                            toneTmp= toneTmp;
                          });
                          },),
                        CustomTextField(editController: _editController3,label: "イエール Yale", onChangedFunc: (newText){

                          setState((){
                            chineseTmp = chineseTmp;
                            catOnKneesTmp= catOnKneesTmp;
                            yaleTmp = newText;
                            jyutpingTmp= jyutpingTmp;
                            initialTmp= initialTmp;
                            vowelTmp= vowelTmp;
                            endTmp= endTmp;
                            toneTmp= toneTmp;
                          });},),
                        CustomTextField(editController: _editController4,label: "粵拼 Jyutping", onChangedFunc: (newText){

                          setState((){
                            jyutpingTmp = newText;
                            chineseTmp = chineseTmp;
                            catOnKneesTmp= catOnKneesTmp;
                            yaleTmp= yaleTmp;
                            initialTmp= initialTmp;
                            vowelTmp= vowelTmp;
                            endTmp= endTmp;
                            toneTmp= toneTmp;
                          });},),
                        Padding(padding: EdgeInsets.only(top: 3)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          CustomDropdown(0,context, (p0) {
                            print(p0);
                            setState((){pickerValue[0] = p0;
                              initialTmp = (DropdownItems.firstItemsString[p0] == "X無し")? "":DropdownItems.firstItemsString[p0];
                            }); }, "声母", DropdownItems.Items(DropdownItems.firstItemsString)),
                          CustomDropdown(1,context,
                                  (p0) { setState((){
                                    pickerValue[1] = p0;
                                    vowelTmp = (DropdownItems.secondItemsString[p0] == "X無し")? "":DropdownItems.secondItemsString[p0];});}, "韻母1", DropdownItems.Items(DropdownItems.secondItemsString)),
                          CustomDropdown(2,context,
                                  (p0) { setState((){
                                    pickerValue[2] = p0;
                                    endTmp = (DropdownItems.thirdItemsString[p0] == "X無し")? "":DropdownItems.thirdItemsString[p0];
                                  });}, "韻母2", DropdownItems.Items(
                                  DropdownItems.thirdItemsString)),
                          CustomDropdown(3,context, (p0) {
                            setState((){pickerValue[3] = p0;
                            toneTmp = DropdownItems.fourthItemsString[p0];});}, "声調", DropdownItems.Items(DropdownItems.fourthItemsString)),
                        ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(onPressedFunc: (){
                                setState((){
                                  chineseTmp = chineseTmp;
                                  catOnKneesTmp= catOnKneesTmp;
                                  yaleTmp= yaleTmp;
                                  jyutpingTmp= jyutpingTmp;
                                  initialTmp= initialTmp;
                                  vowelTmp= vowelTmp;
                                  endTmp= endTmp;
                                  toneTmp= toneTmp;
                                  voiceTmp = (voiceTmp==true)? false: true;
                                });
                              //print(voiceTmp);
                              },color: (voiceTmp== null || voiceTmp == false) ? Colors.grey: Color.fromRGBO(186, 206, 179, 1),
                                  name: Icon(Icons.volume_up, size: 23.h)),
                              CustomButton(onPressedFunc: (){setState((){
    pickerValue = [null,null,null,null];
    _editController1.clear();
    _editController2.clear();
    _editController3.clear();
    _editController4.clear();

    chineseTmp = null;
    catOnKneesTmp= null;
    yaleTmp= null;
    jyutpingTmp= null;
   initialTmp= null;
    vowelTmp= null;
    endTmp= null;
    toneTmp= null;
    voiceTmp = null;
    });},color: Color.fromRGBO(251, 229, 153, 1),
                                  name: Icon(Icons.delete, size:23.h))
                            ]
                        ),
                      ],
                    ),
                  ),
                  snapshot.hasData
                      ? Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.32,
                      child: monumentList(context: context, monumentList2:MonumentModel.searchMonument3(snapshot.data!, chineseTmp, catOnKneesTmp, yaleTmp, jyutpingTmp, initialTmp, vowelTmp, endTmp, toneTmp, voiceTmp??false)))
                      : SizedBox(
                    height: MediaQuery
                .of(context)
                .size
                .height * 0.32,
                      child: Center(child: CircularProgressIndicator())),
                  (_isBannerAdReady)?SizedBox(
            width: _bannerAd.size.width.toDouble(),
            height: _bannerAd.size.height.toDouble(),
            child: AdWidget(ad: _bannerAd),
            ):
                  SizedBox(width: 30, height: 47),
            //       Padding(
            //         padding: EdgeInsets.symmetric(horizontal: 20.0.h),
            //         child: SizedBox(
            //           height: 32,
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [TextButton(
            //                 style: ButtonStyle(
            //                     foregroundColor: MaterialStateProperty.all(Colors.brown)
            //                 ),
            //               onPressed: (){
            //                 launchUrl(Uri.parse('mailto:infocatonknees@gmail.com?subject=お問い合せ&body=お問合せ内容を書いてください。'));
            //               },
            //                 child: Text("お問い合わせ")), TextButton(
            //
            //                 onPressed:(){
            //                   launchUrl(Uri.parse("https://catonknees.com/"));
            //                 },
            //                 style: ButtonStyle(
            //                   foregroundColor: MaterialStateProperty.all(Colors.brown)
            //                 ),
            // child: Text("catonknees.com"))],
            //
            //           ),
            //         ),
            //       )
                ],
              ),
            );
          },
        ));
  }
}