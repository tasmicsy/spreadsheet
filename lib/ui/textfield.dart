import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String label;
  TextEditingController editController;
  void Function(String)? onChangedFunc;
  CustomTextField({
    required this.onChangedFunc,
    required this.editController,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
      child: Container(
        height:40,
        child: TextField(
          controller: editController,
          onChanged: onChangedFunc,
          decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Colors.black54,
              ),
              // focusColor: Colors.black54,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),

              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(10, 5, 0, 0),
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