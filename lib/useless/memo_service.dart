// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Memo {
//   Memo({
//     required this.content,
//   });
//
//   String content;
//
//   Map<String, dynamic> toJson() {
//     return {'content': content};
//   }
//
//   factory Memo.fromJson(Map<String, dynamic> json) {
//     return Memo(content: json['content']);
//   }
// }
//
// class MemoService extends ChangeNotifier {
//   MemoService() {
//     loadMemoList();
//   }
//
//   SharedPreferences? _prefs;
//   List<Memo> memoList = [];
//
//   Future<void> initialize() async {
//     _prefs = await SharedPreferences.getInstance();
//   }
//
//   Future<void> createMemo({required String content}) async {
//     Memo memo = Memo(content: content);
//     memoList.add(memo);
//     notifyListeners();
//     await saveMemoList();
//   }
//
//   Future<void> updateMemo({required int index, required String content}) async {
//     Memo memo = memoList[index];
//     memo.content = content;
//     notifyListeners();
//     await saveMemoList();
//   }
//
//   Future<void> deleteMemo({required int index}) async {
//     memoList.removeAt(index);
//     notifyListeners();
//     await saveMemoList();
//   }
//
//   Future<void> saveMemoList() async {
//     List<Map<String, dynamic>> memoJsonList =
//     memoList.map((memo) => memo.toJson()).toList();
//
//     String jsonString = jsonEncode(memoJsonList);
//
//     await _prefs?.setString('memoList', jsonString);
//   }
//
//   Future<void> loadMemoList() async {
//     await initialize();
//
//     String? jsonString = _prefs?.getString('memoList');
//
//     if (jsonString == null) return;
//
//     List<dynamic> memoJsonList = jsonDecode(jsonString);
//
//     memoList = memoJsonList.map((json) => Memo.fromJson(json)).toList();
//     notifyListeners();
//   }
// }
