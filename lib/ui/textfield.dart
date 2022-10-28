import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomTextField extends StatelessWidget {
  String label;
  TextEditingController editController;
  void Function(String)? onChangedFunc;
  int height;
  double fontSize;
  CustomTextField({
    required this.fontSize,
    required this.height,
    required this.onChangedFunc,
    required this.editController,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 3),
      child: Container(
        height:height.h,
        child: TextField(
          style: TextStyle(
              fontSize: fontSize.sp),
          cursorColor: Colors.brown,
          textAlignVertical: TextAlignVertical.center,
          controller: editController,
          onChanged: onChangedFunc,
          decoration: InputDecoration(

              labelStyle: TextStyle(

                color: Colors.black54,
                fontSize: 11.h,
              ),
              // focusColor: Colors.black54,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black54,
              ),
            ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black87,
                ),
              ),

              fillColor: Colors.white,
              filled: true,
              contentPadding: (height>=100)? EdgeInsets.fromLTRB(10.h, 17.h, 10.h, 17.h):EdgeInsets.fromLTRB(10, 5, 10, 0),
              labelText: label,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8))
              )
          ),

        ),
      ),
    );
  }
}