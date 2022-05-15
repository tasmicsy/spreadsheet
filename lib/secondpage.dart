import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spreadsheet/monumentmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spreadsheet/ui/monumentlst.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondPage extends StatefulWidget {
  MonumentModel monument;

 SecondPage({required this.monument,Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Color colorvolume = Colors.black;
  bool expanded1 = false;

  bool expanded2 = false;

  bool expanded3 = false;

  bool expanded4 = false;

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
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.4,
                  child: FittedBox(
                    child: Text(widget.monument.chinese, style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width*0.4, color: Colors.grey, fontWeight: FontWeight.bold),),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[SizedBox(
                    height: MediaQuery.of(context).size.width*0.4,
                    child: Column(
                      children: [
                       if (widget.monument.catOnknees!= "")SizedBox(
                          width: MediaQuery.of(context).size.width*0.4,

                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                              child: Text('CatOnKnees式:',
                                style: TextStyle(fontSize: 19.sp, color: Color.fromRGBO(67, 67, 67, 1)),)),
                        ),
                          Text(widget.monument.catOnknees,style: TextStyle(fontSize: 20.sp, color:  Color.fromRGBO(102, 102, 102, 1), fontWeight: FontWeight.bold), ),
                        if (widget.monument.yale!= "")Text("イエール式:${widget.monument.yale}",style: TextStyle(fontSize: 18.sp, color: Colors.grey), ),
                        if (widget.monument.jyutpin!= "") Text("粵拼: ${widget.monument.jyutpin}",style: TextStyle(fontSize: 18.sp, color: Colors.grey), ),
                       // if (monument.voice!="")
                       if (widget.monument.voice!= "") SizedBox(
                         height: 25.h,
                             child: Center(
                               child: TextButton(
                                 style: ButtonStyle(
                                   alignment: Alignment.topCenter,
                                   overlayColor: MaterialStateProperty.all(Colors.white,)
                                 ),
                               onPressed: ()async{
                                 setState((){colorvolume = Colors.grey;});
                                 final player = AudioPlayer();
                                 await player.setUrl(widget.monument.voice);
                                 player.play();
                                 setState((){colorvolume = Colors.black;});
                               },
                               child:Icon(Icons.volume_up, color: colorvolume)),
                             ),
                           )
                      ],
                    ),
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
                if(widget.monument.initial!= ""|| widget.monument.vowel!= ""||widget.monument.end!= ""||widget.monument.tone!= ""
                ||widget.monument.cokTips1!= ""||widget.monument.cokTips2!= ""||widget.monument.cokTips3!= ""||widget.monument.cokTips4!= "")CustomBoard(
                  title:  CustromTitle(title: (widget.monument.boxTitle1 == "")? "日本人向け発音のコツ": widget.monument.boxTitle1),
                  color: Color.fromRGBO(239, 239, 239, 1),contents: Column(
                  children: [

                    if(widget.monument.initial!= ""|| widget.monument.vowel!= ""||widget.monument.end!= ""||widget.monument.tone!= "")Padding(
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

                                  SizedBox(width: MediaQuery.of(context).size.width * 0.15, child: Text(widget.monument.initial, textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 20)),),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.15, child: Text(widget.monument.vowel, textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 20)),),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.15, child: Text(widget.monument.end, textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 20)),),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.15, child: Text(widget.monument.tone, textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 20)),),
                                ],),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:20.w),
                      child: Column(
                        children: [
                          if(widget.monument.cokVowel!="")TextWithPad(content: Text(widget.monument.cokVowel, style: TextStyle(fontSize: 20),)),
                          if(widget.monument.cokTips1!="")TextWithPad(content: Text(widget.monument.cokTips1, style: TextStyle(fontSize: 16),)),
                          if(widget.monument.cokTips2!="")TextWithPad(content: Text(widget.monument.cokTips2, style: TextStyle(color: Colors.red, fontSize: 16),)),

                          if(widget.monument.cokTips3!="")TextWithPad(content: Text(widget.monument.cokTips3, style: TextStyle(fontSize: 16),)),
                          if(widget.monument.cokTips4!="")TextWithPad(content: Text(widget.monument.cokTips4, style: TextStyle(fontSize: 16),)),
                          Padding(padding: EdgeInsets.all(8))
                        ],
                      ),
                    ),
                  ],
                ), expanded: expanded1,
                  expansionFunc: (panelIndex, isExpanded){
                    setState((){expanded1 = (expanded1) ?  false: true;
                    print(expanded1);});
                  },
                ),
                  if(widget.monument.vocab!= "")
                    CustomBoard(
                    title: CustromTitle(title: (widget.monument.boxTitle2 == "")? "単語・フレーズ": widget.monument.boxTitle2),
                      expanded: expanded2,
                      expansionFunc: (panelIndex, isExpanded){
                        setState((){expanded2  = (expanded2) ?  false: true;});
                      },
                    color: Color.fromRGBO(217, 217, 217, 1),
                      contents: Column(
                      children: [
                        TextWithPad(content: Text(widget.monument.vocab,textAlign: TextAlign.center, style: TextStyle(fontSize: 16),)),
                        Padding(padding: EdgeInsets.all(8))
                      ]
                  )),
                if(!(widget.monument.mikoTips== "" &&widget.monument.link1== ""&& widget.monument.link2== ""&& widget.monument.link3== ""))
                  CustomBoard(
                      title: CustromTitle(title: (widget.monument.boxTitle3 == "")? "CatOnKneesメモ": widget.monument.boxTitle3),
                        expanded: expanded3,
                        expansionFunc: (panelIndex, isExpanded){
                          setState((){expanded3  = (expanded3) ?  false: true;});
                        },
                        color: Color.fromRGBO(243, 230, 230, 1),
                        contents: Padding(
                              padding: EdgeInsets.symmetric(horizontal:20.w),
                          child: Column(
                              children: [
                                if(widget.monument.mikoTips!="")TextWithPad(content: Text(widget.monument.mikoTips, style: TextStyle(fontSize: 16),)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                  if(widget.monument.link1 != "")TextButton(onPressed: ()async{
                                    print(widget.monument.link1);
                                    launchUrl(Uri.parse(widget.monument.link1));
                                  },child:Text("リンク①")),
                                  if(widget.monument.link2 != "")TextButton(onPressed: ()async{
                                    launchUrl(Uri.parse(widget.monument.link2));
                                  },child:Text("リンク②")),
                                  if(widget.monument.link3 != "")TextButton(onPressed: ()async{
                                    launchUrl(Uri.parse(widget.monument.link3));
                                  },child:Text("リンク③")),
                                ],),
                                Padding(padding: EdgeInsets.all(8))
                              ]
                          ),
                        )
                    ),
                if (!(widget.monument.ipa==""&&widget.monument.phonetics==""))CustomBoard(
                      title:CustromTitle(title: (widget.monument.boxTitle4 == "")? "音声学的解説": widget.monument.boxTitle4),
                        expanded: expanded4,
                        expansionFunc: (panelIndex, isExpanded){
                          setState((){expanded4  = (expanded4) ?  false: true;});
                        },
                        color: Color.fromRGBO(239, 239, 239, 1),
                        contents: Padding(
                          padding: EdgeInsets.symmetric(horizontal:20.w),
                          child: Column(
                              children: [
                                if(widget.monument.ipa!="")TextWithPad(content: Text("[${widget.monument.ipa}]", style: TextStyle(fontSize: 16),)),
                                if(widget.monument.phonetics!="")TextWithPad(content: Text(widget.monument.phonetics, style: TextStyle(fontSize: 16),)),
                                Padding(padding: EdgeInsets.all(8))

                              ]
                          ),
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

class TextWithPad extends StatelessWidget {
  const TextWithPad({
    Key? key,
    required this.content,
  }) : super(key: key);

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: content,
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
      padding:EdgeInsets.symmetric(vertical: 8.h),
      child: Text(title, textAlign: TextAlign.center,style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold)),
    );
  }
}

class CustomBoard extends StatelessWidget {
  void Function(int, bool) expansionFunc;
  Widget contents;
  Color color;
  bool expanded;
  Widget title;
  CustomBoard({required this.title,required this.expanded,
    required this.expansionFunc,required this.color, required this. contents, Key? key}) : super(key: key);


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
        child: ExpansionPanelList(
          expandedHeaderPadding: EdgeInsets.zero,
          animationDuration: Duration(milliseconds: 1000),
          children: [ExpansionPanel(
            backgroundColor: color,
            isExpanded: expanded,
            canTapOnHeader: true,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return title;
            },
            body: Container(
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

          )],
    dividerColor: Colors.grey,
    expansionCallback: expansionFunc,
        ),
      ),
    );
  }
}
