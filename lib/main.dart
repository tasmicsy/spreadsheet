import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:spreadsheet/ad_helper.dart';
import 'package:spreadsheet/data/dropdownitems.dart';
import 'package:spreadsheet/firebase_options.dart';
import 'package:spreadsheet/monumentmodel.dart';
import 'package:spreadsheet/ui/button.dart';
import 'package:spreadsheet/ui/customdropdown.dart';
import 'package:spreadsheet/ui/monumentlst.dart';
import 'package:spreadsheet/ui/textfield.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
                    padding: EdgeInsets.only(top: 6.0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 15,
                          width: 15,
                          child: IconButton(onPressed: (){
                            showDialog(context: context, builder: (context){
                              return SimpleDialog(

                                  children: [
                                    TextButton(onPressed: (){}, child: Text("プライバシーポリシー")),
                                    TextButton(onPressed: (){}, child: Text("利用規約")),
                                    TextButton(onPressed: (){}, child: Text("お問合せ")),
                                    TextButton(onPressed: (){}, child: Text("ホームページ"))
                                  ],

                              );
                            });
                          },
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.dehaze, size: 20,)),
                        ),
                        Text("世界初！広東語発音ひらがな表記", style: TextStyle(
                          fontSize: 16.sp
                        ),),
                        SizedBox(height: 15, width: 15,),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('広東語発音完全解説動画は'),
                      SizedBox(
                        height: 28.h,
                        width: 55.w,
                        child: TextButton(
                            onPressed: ()async {
                              launchUrl(Uri.parse('https://www.youtube.com/c/catonknees'));
                            },
                            style: ButtonStyle(
                              alignment: Alignment.topLeft
                            ),

                            child: Text('こちら',style: TextStyle(
                              decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown),textAlign: TextAlign.start,)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.35,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                                  name: Icon(Icons.volume_up)),
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
                                  name: Icon(Icons.delete))
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.h),
                    child: SizedBox(
                      height: 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [TextButton(
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all(Colors.brown)
                            ),
                          onPressed: (){
                            launchUrl(Uri.parse('mailto:infocatonknees@gmail.com?subject=お問い合せ&body=お問合せ内容を書いてください。'));
                          },
                            child: Text("お問い合わせ")), TextButton(

                            onPressed:(){
                              launchUrl(Uri.parse("https://catonknees.com/"));
                            },
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(Colors.brown)
                            ),
            child: Text("catonknees.com"))],

                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}