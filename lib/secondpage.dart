import 'package:flutter/material.dart';
import 'package:spreadsheet/monumentmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondPage extends StatelessWidget {
  MonumentModel monument;
 SecondPage({required this.monument,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:90.h, left:10.w, right: 10.w, bottom: 10.h),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25))
        ),
        child:         Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(monument.chinese, style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.4, color: Colors.grey, fontWeight: FontWeight.bold),),
                Column(
                  children:[Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.4,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                            child: Text('CatOnKnees式:', style: TextStyle(fontSize: 30, color: Color.fromRGBO(204, 204, 204, 1)),)),
                      ),
                        Text(monument.catOnknees,style: TextStyle(fontSize: 30, color: Colors.grey), ),
                      Text("イエール式:${monument.yale}",style: TextStyle(fontSize: 20, color: Colors.grey), ),
                      Text("粵拼: ${monument.jyutpin}",style: TextStyle(fontSize: 20, color: Colors.grey), ),
                     // if (monument.voice!="")
                       Icon(Icons.volume_up)
                    ],
                  ),
        
        
        
                    ]
                )
        
              ],
            ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.45,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomBoard(color: Color.fromRGBO(239, 239, 239, 1),contents: Column(
                  children: [
                    CustromTitle(title: "日本人向け発音のコツ"),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:8.0, horizontal: MediaQuery.of(context).size.width*0.04),
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey, //色
                                spreadRadius: 0,
                                blurRadius: 5,
                                offset: Offset(1, 1),
                              ),
                            ],
                            color: Color.fromRGBO(153, 153, 153, 1),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical:8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.15,
                                    child: Text("声母", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20),),),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.3, child: Text("韻母", textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 20)),),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.15, child: Text("声調", textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 20)),),
                                ],

                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.15,
                                    child: Text("(子音)", textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 15)),),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.15, child: Text("(母音)", textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 15)),),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.15, child: Text("(語尾)", textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 15)),),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.15, )
                                ],),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0),
                                child: Container(
                                    color: Color.fromRGBO(133, 133, 133, 1),
                                    width: MediaQuery.of(context).size.width*0.7,
                                    height: 2
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  SizedBox(width: MediaQuery.of(context).size.width * 0.15, child: Text(monument.initial, textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 20)),),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.15, child: Text(monument.vowel, textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 20)),),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.15, child: Text(monument.end, textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 20)),),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.15, child: Text(monument.tone, textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 20)),),
                                ],),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Text(monument.cokVowel),
                    Text(monument.cokTips2),
                    Text(monument.cokTips3),
                    Text(monument.cokTips4),
                  ],
                ),),
                  CustomBoard(
                    color: Color.fromRGBO(217, 217, 217, 1),
                      contents: Column(
                      children: [CustromTitle(title: "単語・フレーズ")]
                  )),
                    CustomBoard(
                        color: Color.fromRGBO(243, 230, 230, 1),
                        contents: Column(
                            children: [CustromTitle(title: "CatOnKneesメモ")]
                        )),
                    CustomBoard(
                        color: Color.fromRGBO(239, 239, 239, 1),
                        contents: Column(
                            children: [CustromTitle(title: "音声学的解説")]
                        )),
              ],
            ),
          ),
        ),
            ],
        ),
      ),
    );
  }
}

class CustromTitle extends StatelessWidget {
  String title;
  CustromTitle({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
    );
  }
}

class CustomBoard extends StatelessWidget {
  Widget contents;
  Color color;
  CustomBoard({
    required this.color, required this. contents, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width*0.8,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black45, //色
              spreadRadius: 0,
              blurRadius: 3,
              offset: Offset(1, 1),
            ),
          ],
          color: color,

        ),
        child: contents,
      ),
    );
  }
}
