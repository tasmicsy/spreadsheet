import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spreadsheet/monumentmodel.dart';
import 'package:spreadsheet/secondpage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';
class monumentList extends StatefulWidget{
  BuildContext context;
  List<MonumentModel> monumentList2;
  ScrollController scrollController;
  // List<MonumentModel>? monumentList2 = MonumentModel.searchMonument3(monumentList, "xx");
  monumentList({required this.scrollController,required this.context, required this.monumentList2});

  @override
  State<monumentList> createState() => _monumentListState();
}

class _monumentListState extends State<monumentList> {
  final player = AudioPlayer();
  Color colorvolume = Colors.black54;
  Widget? sound;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return widget.monumentList2.isNotEmpty ? Column(
      children: [
        SizedBox(height: 20.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width * 0.3,
                color: Colors.grey,
              ),
              Text("全${widget.monumentList2.length}件", style: TextStyle(fontSize: 13.h),),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width * 0.3,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.28,
          child: ListView.builder(
            controller:widget.scrollController,

              padding: EdgeInsets.zero,
              itemCount: widget.monumentList2.length,
              itemBuilder: (context, index) {

//print(monumentList2[index].initial);
                // if (index1== 0){
                //   return Text("全部で${monumentList2.length}件");
                // }
                // else{
                //   int index = index1-1;
                return Card(
                    margin: EdgeInsets.symmetric(horizontal:5.w, vertical: 2.h),
                    color: (index%2 == 0)? Colors.white: Colors.grey.shade100,
                    child: ListTile(
                      onTap: () {
                        // print(widget.monumentList2[index].chinese.length);
                        showDialog(context: context, builder: (context) {
                          return SecondPage(
                              monument: widget.monumentList2[index]);
                        });
                      },
                      title: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // color: Colors.grey,
                               width: MediaQuery.of(context).size.height *0.055,
                              // width: MediaQuery.of(context).size.width *0.12,
                              height: MediaQuery.of(context).size.height *0.055,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                 borderRadius: BorderRadius.circular(30.h),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 3.w),
                                // EdgeInsets.all(7.0.w),
                                child: Text(
                                """
${widget.monumentList2[index].initial}
${widget.monumentList2[index].vowel}
${widget.monumentList2[index].end}
                                """,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold, fontSize: 9.h),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *0.35,
                              child: Padding(
                                padding: EdgeInsets.all(8.0.w),
                                child: Text(widget.monumentList2[index].catOnknees,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 13.h),),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width *0.3,
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    widget.monumentList2[index].yale,
                                    textAlign: TextAlign.start
                                    ,
                                    style: TextStyle(
                                      fontSize: 13.h,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left:8.h),
                                    child: Text(
                                      widget.monumentList2[index].jyutpin,
                                      textAlign: TextAlign.start
                                      ,
                                      style: TextStyle(
                                        fontSize: 13.h,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                           (widget.monumentList2[index].voice != "")?SizedBox(
                             width: MediaQuery.of(context).size.width*0.10,
                             child: TextButton(
                                 style: ButtonStyle(
                                     foregroundColor: MaterialStateProperty.all<Color>(colorvolume)
                                 ),
                                 onPressed: ()async {
                                   if (voiceTimes==false) EasyLoading.show();
                                   // print(sound);
                                   await player.setUrl(widget.monumentList2[index].voice);
                                   player.play();
                                   // setState((){
                                   //   sound = Icon(Icons.volume_up, size: 27.h,);
                                   // });
                                   if (voiceTimes== false)EasyLoading.dismiss();
                                   if (voiceTimes==false) voiceTimes=true;
                                   // print(sound);
                                 },
                                 child: (sound!=null)?sound!: Icon(Icons.volume_up, size: 27.h,)
                             ),
                           ): SizedBox(width: MediaQuery.of(context).size.width*0.10),
                          ],
                        ),
                      ),
                    ));
                // }
              }),
        ),
      ],
    ):
    Container(child: Center(child: Text("Nodata"),),) ;
  }
}




