import 'package:flutter/material.dart';
import 'package:spreadsheet/data/dropdownitems.dart';

Widget CustomDropdown(int index,BuildContext context, void Function(dynamic) onChangedFunc, String label, List<DropdownMenuItem<dynamic>> items){

  return Container(
    alignment: Alignment.center,
    height: MediaQuery.of(context).size.height *0.05,
    width: MediaQuery.of(context).size.width * 0.18,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5)),
    child: DropdownButton(
        underline: Container(
            height: 4,
            color: Colors.grey[300]
        ),
        hint: Text(label),
        alignment: Alignment.centerRight,
        style: TextStyle(
          color: Colors.black,

        ),
        dropdownColor: Colors.white,
        focusColor: Colors.indigo,
        items: items,
        value: pickerValue[index],

        onChanged: onChangedFunc),
  );
}