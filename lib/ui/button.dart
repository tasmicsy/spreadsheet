import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  void Function() onPressedFunc;
  Color color;
  Widget name;
  CustomButton({
    required this.onPressedFunc,
    required this.color,
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 3.h),
      child: ElevatedButton(

          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade800),
textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontWeight: FontWeight.bold)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.grey)
                  )
              )
          ),
        onPressed: onPressedFunc,child: SizedBox(
          width:MediaQuery.of(context).size.width*0.33,
          height: MediaQuery.of(context).size.height*0.04,
          child: name),),
    );
  }
}