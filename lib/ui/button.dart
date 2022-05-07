import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  void Function() onPressedFunc;
  Color color;
  String label;
  CustomButton({
    required this.onPressedFunc,
    required this.color,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

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
        width:MediaQuery.of(context).size.width*0.3,
        child: Text(label,textAlign: TextAlign.center,)),);
  }
}