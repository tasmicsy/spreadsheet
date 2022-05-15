import 'dart:convert';
import 'package:http/http.dart' as http;
class MonumentModel {
  String chinese;
  String  catOnknees;
  String yale;
  String jyutpin;
  String initial;
  String vowel;
  String end;
  String tone;
  String voice;
  String cokInitial;
  String cokVowel;
  String cokEnd;
  String cokTips1;
  String cokTips2;
  String cokTips3;
  String cokTips4;
  String vocab;
  String mikoTips;
  String link1;
  String link2;
  String link3;
  String ipa;
  String phonetics;

  MonumentModel({
    required this.chinese,
    required this.catOnknees,
    required this.yale,
    required this.jyutpin,
    required this.initial,
    required this.vowel,
    required this.end,
    required this.tone,
    required this.voice,
    required this.cokInitial,
    required this.cokVowel,
    required this.cokEnd,
    required this.cokTips1,
    required this.cokTips2,
    required this.cokTips3,
    required this.cokTips4,
    required this.vocab,
    required this.mikoTips,
    required this.link1,
    required this.link2,
    required this.link3,
    required this.ipa,
    required this.phonetics
  });

  factory MonumentModel.fromMap(Map<String, dynamic> json) {

    return MonumentModel(
        chinese: json['Chinese'].toString(),
        catOnknees: json['CatOnKnees'].toString(),
        yale: json['Yale'].toString(),
        jyutpin: json['Jyutpin'].toString(),
        initial: json['Initial'].toString(),
        vowel: json['Vowel'].toString(),
        end: json['End'].toString(),
        tone: json['Tone'].toString(),
        voice: json['Voice'].toString(),
        cokInitial: json['COKInitial'].toString(),
        cokVowel: json['COKVowel'].toString(),
        cokEnd: json['COKEnd'].toString(),
        cokTips1: json['COKTips1'].toString(),
        cokTips2: json['COKTips2'].toString(),
        cokTips3: json['COKTips3'].toString(),
        cokTips4: json['COKTips4'].toString(),
        vocab: json['Vocab'].toString(),
        mikoTips: json['MikoTips'].toString(),
        link1: json['Link1'].toString(),
        link2: json['Link2'].toString(),
        link3: json['link3'].toString(),
        ipa: json['IPA'].toString(),
        phonetics: json['Phonetics'].toString(),
    );
  }

  static List<MonumentModel> decodeMonument(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<MonumentModel>((json) => MonumentModel.fromMap(json))
        .toList();
  }

  static Future<List<MonumentModel>> fetchMonument() async {
    //print('herehere');
    final response = await http.get(
        Uri.parse(
            'https://script.google.com/macros/s/AKfycbyuCIGsd8eJqGnTQwXD3RQlqZli5fFM8-XAE6XXyPIMs5BxAGPd9oryqntNL4iDLHiS9A/exec'));
    if (response.statusCode == 200) {
     // print(response.body);
      return decodeMonument(response.body);
    } else {
      throw Exception('Unable to fetch data from the REST API');
    }
  }

static List<MonumentModel> searchMonument3(List<MonumentModel> monumentList,String? firstItem, String? secondItem, String? thirdItem,
    String? fourthItem, String? fifthItem, String? sixthItem, String?seventhItem, String?eighthItem, bool voiceItem) {
  List<MonumentModel> monumentList2 = [];
  if(firstItem== null && secondItem==null &&thirdItem==null&&fourthItem==null&&fifthItem==null&&sixthItem == null && seventhItem == null && eighthItem == null &&voiceItem == false ){
    monumentList2 =monumentList;
  }else{
    int s = 0;
    for(var i=0;i<monumentList.length;i++) {
      if ((monumentList[i].chinese.contains(firstItem??""))
          && (monumentList[i].catOnknees.contains(secondItem??""))
           && (monumentList[i].yale.contains(thirdItem??""))
          && (monumentList[i].jyutpin.contains(fourthItem??""))
          && (monumentList[i].initial.contains(fifthItem??""))
          &&(monumentList[i].vowel.contains(sixthItem??""))
          && (monumentList[i].end.contains(seventhItem??""))
          && (monumentList[i].tone.contains(eighthItem??""))
       && ((voiceItem== true && monumentList[i].voice!="")|| voiceItem==false)){
  monumentList2.insert(s, monumentList[i]);
  // print(monumentList2[s].yale);
  s = s + 1;

      }

    }
    //monumentList2.reversed;

    }
    return monumentList2;
}


}