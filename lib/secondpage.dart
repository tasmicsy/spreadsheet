import 'package:flutter/material.dart';
import 'package:spreadsheet/monumentmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondPage extends StatefulWidget {
  MonumentModel monument;

 SecondPage({required this.monument,Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 10),
                SizedBox(
                  height: 10,
                  child: TextButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(10, 10)),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                        alignment: Alignment.centerRight),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.clear, color: Colors.grey,)
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(widget.monument.chinese, style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.4, color: Colors.grey, fontWeight: FontWeight.bold),),
                Column(
                  children:[Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.4,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                            child: Text('CatOnKnees式:', style: TextStyle(fontSize: 30, color: Color.fromRGBO(204, 204, 204, 1)),)),
                      ),
                        Text(widget.monument.catOnknees,style: TextStyle(fontSize: 30, color: Colors.grey), ),
                      Text("イエール式:${widget.monument.yale}",style: TextStyle(fontSize: 20, color: Colors.grey), ),
                      Text("粵拼: ${widget.monument.jyutpin}",style: TextStyle(fontSize: 20, color: Colors.grey), ),
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
                CustomBoard(
                  title:  CustromTitle(title: "日本人向け発音のコツ"),
                  color: Color.fromRGBO(239, 239, 239, 1),contents: Column(
                  children: [

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
                    Text(widget.monument.cokVowel),
                    Text(widget.monument.cokTips2),
                    Text(widget.monument.cokTips3),
                    Text(widget.monument.cokTips4),
                  ],
                ), expanded: expanded1,
                  expansionFunc: (panelIndex, isExpanded){
                    setState((){expanded1 = (expanded1) ?  false: true;
                    print(expanded1);});
                  },
                ),
                  CustomBoard(
                    title: CustromTitle(title: "単語・フレーズ"),
                      expanded: expanded2,
                      expansionFunc: (panelIndex, isExpanded){
                        setState((){expanded2  = (expanded2) ?  false: true;});
                      },
                    color: Color.fromRGBO(217, 217, 217, 1),
                      contents: Column(
                      children: [CustromTitle(title: "単語・フレーズ")]
                  )),
                    CustomBoard(
                      title: CustromTitle(title: "CatOnKneesメモ"),
                        expanded: expanded3,
                        expansionFunc: (panelIndex, isExpanded){
                          setState((){expanded3  = (expanded3) ?  false: true;});
                        },
                        color: Color.fromRGBO(243, 230, 230, 1),
                        contents: Column(
                            children: []
                        )),
                    CustomBoard(
                      title:CustromTitle(title: "音声学的解説"),
                        expanded: expanded4,
                        expansionFunc: (panelIndex, isExpanded){
                          setState((){expanded4  = (expanded4) ?  false: true;});
                        },
                        color: Color.fromRGBO(239, 239, 239, 1),
                        contents: Column(
                            children: []
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
