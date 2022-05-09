import 'package:flutter/material.dart';
import 'package:spreadsheet/monumentmodel.dart';
import 'package:spreadsheet/secondpage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
Widget monumentList(BuildContext context, List<MonumentModel> monumentList, ) {

  // List<MonumentModel>? monumentList2 = MonumentModel.searchMonument3(monumentList, "xx");
  List<MonumentModel>? monumentList2 = monumentList;

  return monumentList2.isNotEmpty ? Column(
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
            Text("全${monumentList2.length}件"),
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

          padding: EdgeInsets.zero,
            itemCount: monumentList.length,
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
                    title: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // color: Colors.grey,
                            width: MediaQuery.of(context).size.width *0.12,
                            height: MediaQuery.of(context).size.width *0.12,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(30.h),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(7.0.w),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  monumentList2[index].chinese,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                      fontWeight: FontWeight.bold, fontSize: 25.sp),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width *0.3,
                            child: Padding(
                              padding: EdgeInsets.all(8.0.w),
                              child: Text(monumentList2[index].catOnknees,
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 15.sp),),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width *0.15,
                            alignment: Alignment.centerLeft,
                            child: Text(
                               monumentList2[index].yale,
                              textAlign: TextAlign.start
                              ,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.2,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*0.1,
                                  child: TextButton(onPressed: (){
                                    showDialog(context: context, builder: (context){
                                      return SecondPage(monument: monumentList2[index]);
                                    });
                                  },
                                      style: ButtonStyle(
                                        foregroundColor: MaterialStateProperty.all<Color>(Colors.black54)
                                      ),
                                      child: Icon(Icons.info_outlined, size: 30.sp,)),
                                ),
                                if (monumentList2[index].voice != "")SizedBox(
                                  width: MediaQuery.of(context).size.width*0.1,
                                  child: TextButton(
                                      style: ButtonStyle(
                                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black54)
                                      ),
                                    onPressed: (){},
                                    child: Icon(Icons.volume_up, size: 30.sp,)
                                  ),
                                ),
                              ],
                            ),
                          ),
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




