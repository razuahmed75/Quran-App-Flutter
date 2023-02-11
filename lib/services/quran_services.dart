import 'dart:convert';
import 'dart:developer';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:quran_app/models/quran_model.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/utils/prefs.dart';

import '../utils/store_data.dart';

class QuranServicesClass {
  static final box = GetStorage();

  static Future<QuranModelClass?> getQuranData() async {
    QuranModelClass? result;

    final url = Uri.parse(
        "http://api.quran.com/api/v3/search?q=quran&size=20&page=0&language=en");

    Response response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        result = quranModelClassFromJson(response.body);
        print(data.toString());
        // print("The printed is" + data["search"]["results"].toString());
        // saveStringList(data["search"]["results"]);
        box.write(Keys.ayatText, result.search.results[0].text);
        box.write(Keys.verseKey, result.search.results[0].verseKey);
        box.write(
            Keys.translatedText, result.search.results[0].translations[0].text);
        return result;
      }
    } catch (e) {
      log("Failed to load quran data");
    }
  }
}
