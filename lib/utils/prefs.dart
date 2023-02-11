import 'package:quran_app/models/quran_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Saving list of strings
Future<void> saveStringList(List<String> list) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList('stringList', list);
}

// Retrieving list of strings
List quranList = [];
Future<List> getStringList() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  quranList = prefs.getStringList('stringList') ?? [];
  return quranList;
}
