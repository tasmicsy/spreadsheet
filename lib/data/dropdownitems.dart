import 'package:flutter/material.dart';
List<int?> pickerValue = [0,0,0,0];
class DropdownItems {
  static List<String> firstItemsString = [
   "子音", "b", "ch", "d", "f", "g", "gw", "h", "j", "l", "m", "n", "ng", "p", "s", "t", "k", "kw", "w", "y", "X無し"
  ];
  static List<String> secondItemsString = [
   "母音", "a", "aa","e","i","o","u", "yu",  "aai","aau","ai","au", "eu","ei","ou", "iu",    "ui",  "oi","eoi",   "oe","eo" ,   "X無し"
  ];
  static List<String> thirdItemsString = [
   "語尾", "m", "n", "ng", "p", "t", "k", "X無し",  ];
  static List<String> fourthItemsString = [
    "声調","1", "2", "3", "4", "5", "6"  ];

  static List<DropdownMenuItem<int>>Items(List<String> ItemsString) {
  return List.generate(ItemsString.length, (index)
  => DropdownMenuItem(child: Text(ItemsString[index]), value: index));}
  // [
  // DropdownMenuItem(child: Text("b"), value: 0),
  // DropdownMenuItem(child: Text("ch"), value: 1),
  // DropdownMenuItem(child: Text("d"), value: 2),
  // DropdownMenuItem(child: Text("f"), value: 3),
  // DropdownMenuItem(child: Text("g"), value: 4),
  // DropdownMenuItem(child: Text("gw"), value: 5),
  // DropdownMenuItem(child: Text("h"), value: 6),
  // DropdownMenuItem(child: Text("j"), value: 7),
  // DropdownMenuItem(child: Text("l"), value: 8),
  // DropdownMenuItem(child: Text("m"), value: 9),
  // DropdownMenuItem(child: Text("n"), value: 10),
  // DropdownMenuItem(child: Text("ng"), value: 11),
  // DropdownMenuItem(child: Text("p"), value: 12),
  // DropdownMenuItem(child: Text("s"), value: 13),
  // DropdownMenuItem(child: Text("t"), value: 14),
  // DropdownMenuItem(child: Text("k"), value: 15),
  // DropdownMenuItem(child: Text("kw"), value: 16),
  // DropdownMenuItem(child: Text("w"), value: 17),
  // DropdownMenuItem(child: Text("y"), value: 18),
  // DropdownMenuItem(child: Text("X無し"), value: 19),
  //
  //
  //
  // ];
}