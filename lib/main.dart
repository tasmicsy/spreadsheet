import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spreadsheet/data/dropdownitems.dart';
import 'package:spreadsheet/firebase_options.dart';
import 'package:spreadsheet/monumentmodel.dart';
import 'package:spreadsheet/ui/button.dart';
import 'package:spreadsheet/ui/customdropdown.dart';
import 'package:spreadsheet/ui/monumentlst.dart';
import 'package:spreadsheet/ui/textfield.dart';

void main() async{
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
                    padding: EdgeInsets.only(top: 7.0.h),
                    child: Text("世界初！広東語発音ひらがな表記", style: TextStyle(
                      fontSize: 17.sp
                    ),),
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
                                });
                              },color: Color.fromRGBO(186, 206, 179, 1),
                                  label: "検索 Search"),
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
    });},color: Color.fromRGBO(251, 229, 153, 1),
                                  label: "リセット Clear")
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
                      child: monumentList(context, MonumentModel.searchMonument3(snapshot.data!, chineseTmp, catOnKneesTmp, yaleTmp, jyutpingTmp, initialTmp, vowelTmp, endTmp, toneTmp)))
                      : Center(child: CircularProgressIndicator()),
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.075,
                    child: Card(
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("YouTube"),
                                    Image.asset("assets/catonkneeslogo2.png",
                                        height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.01 ),
                                  ],
                                ),
                                Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.3,
                                    child: Text(
                                        "独学で広東語を学んだ日本人Mikoによる関東後・香港情報を無料配信チャンネル！",style: TextStyle(fontSize: 10.sp),)),
                                Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.2,
                                    child: Text("広東語マスター動画",style: TextStyle(fontSize: 10.sp))),
                                Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.1,
                                    child: Text("チャンネル登録",style: TextStyle(fontSize: 10.sp)))
                              ]
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("お問い合わせ"), Text("catonknees.com")],

                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}