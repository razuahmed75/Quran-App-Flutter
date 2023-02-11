import 'dart:convert';

QuranModelClass quranModelClassFromJson(String str) =>
    QuranModelClass.fromJson(json.decode(str));

String quranModelClassToJson(QuranModelClass data) =>
    json.encode(data.toJson());

class QuranModelClass {
  QuranModelClass({
    required this.search,
  });

  Search search;

  factory QuranModelClass.fromJson(Map<String, dynamic> json) =>
      QuranModelClass(
        search: Search.fromJson(json["search"]),
      );

  Map<String, dynamic> toJson() => {
        "search": search.toJson(),
      };
}

class Search {
  Search({
    required this.query,
    required this.totalResults,
    required this.currentPage,
    required this.totalPages,
    required this.results,
  });

  String query;
  int totalResults;
  int currentPage;
  int totalPages;
  List<Result> results;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        query: json["query"],
        totalResults: json["total_results"],
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "query": query,
        "total_results": totalResults,
        "current_page": currentPage,
        "total_pages": totalPages,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.verseKey,
    required this.verseId,
    required this.text,
    this.highlighted,
    required this.words,
    required this.translations,
  });

  String verseKey;
  int verseId;
  String text;
  dynamic highlighted;
  List<Word> words;
  List<Translation> translations;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        verseKey: json["verse_key"],
        verseId: json["verse_id"],
        text: json["text"],
        highlighted: json["highlighted"],
        words: List<Word>.from(json["words"].map((x) => Word.fromJson(x))),
        translations: List<Translation>.from(
            json["translations"].map((x) => Translation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "verse_key": verseKey,
        "verse_id": verseId,
        "text": text,
        "highlighted": highlighted,
        "words": List<dynamic>.from(words.map((x) => x.toJson())),
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
      };
}

class Translation {
  Translation({
    required this.text,
    required this.resourceId,
    required this.name,
    required this.languageName,
  });

  String text;
  int resourceId;
  Name name;
  LanguageName languageName;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        text: json["text"],
        resourceId: json["resource_id"],
        name: nameValues.map[json["name"]]!,
        languageName: languageNameValues.map[json["language_name"]]!,
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "resource_id": resourceId,
        "name": nameValues.reverse[name],
        "language_name": languageNameValues.reverse[languageName],
      };
}

enum LanguageName { ENGLISH }

final languageNameValues = EnumValues({"english": LanguageName.ENGLISH});

enum Name {
  DR_T_B_IRVING,
  MUHAMMAD_TAQI_UD_DIN_AL_HILALI_MUHAMMAD_MUHSIN_KHAN,
  DR_MUSTAFA_KHATTAB_THE_CLEAR_QURAN,
  ABDUL_HALEEM
}

final nameValues = EnumValues({
  "Abdul Haleem": Name.ABDUL_HALEEM,
  "Dr. Mustafa Khattab, the Clear Quran":
      Name.DR_MUSTAFA_KHATTAB_THE_CLEAR_QURAN,
  "Dr. T. B. Irving": Name.DR_T_B_IRVING,
  "Muhammad Taqi-ud-Din al-Hilali & Muhammad Muhsin Khan":
      Name.MUHAMMAD_TAQI_UD_DIN_AL_HILALI_MUHAMMAD_MUHSIN_KHAN
});

class Word {
  Word({
    required this.charType,
    required this.text,
  });

  CharType charType;
  String text;

  factory Word.fromJson(Map<String, dynamic> json) => Word(
        charType: charTypeValues.map[json["char_type"]]!,
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "char_type": charTypeValues.reverse[charType],
        "text": text,
      };
}

enum CharType { WORD, END }

final charTypeValues = EnumValues({"end": CharType.END, "word": CharType.WORD});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
